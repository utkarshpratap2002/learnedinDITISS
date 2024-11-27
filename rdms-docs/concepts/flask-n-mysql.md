# Tutorial: Using `mysql.connector` with Flask

This tutorial covers essential methods and functions of the `mysql.connector` library for interacting with MySQL databases in Python, and demonstrates how to integrate it with a Flask web application running on the same machine.

**1. Installation:**

```bash
pip install mysql-connector-python
```

**2. Basic Connection and Query:**

```python
import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",  # Or your MySQL server's IP address
  user="your_username",
  password="your_password",
  database="your_database_name"
)

mycursor = mydb.cursor()

mycursor.execute("SELECT * FROM your_table")

myresult = mycursor.fetchall()  # Fetch all results

for row in myresult:
  print(row)

mydb.close() # Close the connection
```

**3. Key `mysql.connector` Methods and Functions:**

* **`connect()`:** Establishes a connection to the MySQL server.  Takes parameters like `host`, `user`, `password`, `database`.
* **`cursor()`:** Creates a cursor object to execute SQL queries. You can specify `buffered=True` to fetch all results at once or `dictionary=True` to get results as dictionaries.
* **`execute()`:** Executes an SQL query.  Use parameterized queries with placeholders (`%s`) to prevent SQL injection:
    ```python
    sql = "INSERT INTO users (name, email) VALUES (%s, %s)"
    val = ("John Doe", "john.doe@example.com")
    mycursor.execute(sql, val)
    mydb.commit() # Important: Commit changes
    ```
* **`executemany()`:** Executes the same SQL query multiple times with different parameters efficiently.
* **`fetchall()`:** Fetches all remaining rows from the result set as a list of tuples (or dictionaries if `dictionary=True` was used).
* **`fetchone()`:** Fetches the next row from the result set.
* **`fetchmany(size)`:** Fetches the specified number of rows.
* **`commit()`:**  Saves changes to the database (essential after `INSERT`, `UPDATE`, `DELETE`).
* **`rollback()`:** Undoes changes since the last commit.
* **`close()`:** Closes the cursor and the database connection.


**4. Integrating with Flask (Same Machine):**

```python
from flask import Flask, request, jsonify
import mysql.connector

app = Flask(__name__)

# Database configuration (best practice is to store these securely, e.g., environment variables)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'your_username'
app.config['MYSQL_PASSWORD'] = 'your_password'
app.config['MYSQL_DATABASE'] = 'your_database_name'


@app.route('/users', methods=['GET'])
def get_users():
    try:
        mydb = mysql.connector.connect(**app.config) # Create connection
        mycursor = mydb.cursor(dictionary=True) # Use dictionary cursor
        mycursor.execute("SELECT * FROM users")
        users = mycursor.fetchall()
        mydb.close() # Close connection after use
        return jsonify(users)
    except mysql.connector.Error as err:
        return jsonify({'error': str(err)}), 500 # Handle errors


# Example route to insert a new user (POST request)
@app.route('/users', methods=['POST'])
def create_user():
    try:
      mydb = mysql.connector.connect(**app.config)
      mycursor = mydb.cursor()
      sql = "INSERT INTO users (name, email) VALUES (%s, %s)"
      val = (request.json.get('name'), request.json.get('email')) # Get data from request
      mycursor.execute(sql, val)
      mydb.commit()
      mydb.close()
      return jsonify({'message': 'User created successfully'}), 201
    except mysql.connector.Error as err:
      return jsonify({'error': str(err)}), 500


if __name__ == '__main__':
    app.run(debug=True)
```

**Explanation:**

* The Flask app config stores database credentials.
* Each route establishes a database connection.
* A `try...except` block handles potential database errors.
* The `cursor(dictionary=True)` returns rows as dictionaries, making them easier to work with in Flask.
* Parameterized queries are used to prevent SQL injection.
* Results are returned as JSON using `jsonify`.



**5. Connection Pooling (Important for Performance):**

For better performance in a web application, use a connection pool to reuse connections instead of creating a new one for each request.

```python
from flask import Flask
import mysql.connector
from mysql.connector import pooling

app = Flask(__name__)
# ... database config ...

# Create a connection pool
cnx_pool = pooling.MySQLConnectionPool(
    pool_name="mypool",
    pool_size=3,  # Adjust pool size as needed
    **app.config # Pass in database credentials
)

@app.route('/users')
def get_users():
    try:
        mydb = cnx_pool.get_connection() # Get a connection from pool
        # ... rest of your database interaction code (same as before)...
        mydb.close() # Return connection to pool
    except Exception as err: # Handle errors
        return jsonify({'error': str(err)}), 500

#... rest of your application code
```

This tutorial provides a solid foundation for using `mysql.connector` with Flask.  Remember to adapt the code to your specific database schema and application requirements.  Securely store database credentials (environment variables are recommended).  Using a connection pool is crucial for performance in production environments.