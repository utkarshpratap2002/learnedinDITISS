# Session 1

Let's break down these MySQL concepts.

**1. Best Practices for Organizing and Naming Databases:**

* **Naming Conventions:**
    * Use lowercase letters for database and table names.
    * Use underscores (`_`) to separate words (e.g., `customer_orders`, `product_catalog`).
    * Avoid using plural names for tables (e.g., `customer` instead of `customers`).
    * Use descriptive names that clearly indicate the purpose of the database or table.
    * Be consistent with your naming conventions across all your databases.
* **Schema Design:**
    * **Normalization:**  Design your tables to reduce data redundancy and improve data integrity. Aim for at least third normal form (3NF) in most cases.
    * **Data Types:** Choose appropriate data types for each column (e.g., `INT`, `VARCHAR`, `DATE`, `DECIMAL`).
    * **Primary Keys:** Define primary keys for each table to uniquely identify each row.
    * **Foreign Keys:** Use foreign keys to establish relationships between tables and enforce referential integrity.
    * **Indexing:** Create indexes on frequently queried columns to improve query performance.
* **Organization:**
    * Group related tables together within a database.
    * Use separate databases for different applications or projects.


**2. Create a MySQL User:**

```sql
CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password'; -- Creates a user 'newuser' who can connect from localhost

CREATE USER 'newuser'@'%' IDENTIFIED BY 'password';  -- Creates a user who can connect from any host (%)

-- Grant privileges (permissions) to the new user:
GRANT ALL PRIVILEGES ON database_name.* TO 'newuser'@'localhost';  -- All privileges on a specific database

GRANT SELECT, INSERT ON database_name.table_name TO 'newuser'@'localhost'; -- Specific privileges on a table

FLUSH PRIVILEGES;  -- Important: Applies the changes.
```
Replace `'newuser'`, `'password'`, `database_name`, and `table_name` with your desired values.  Grant only the necessary privileges for security. The `%` wildcard allows connections from any host, which should be used cautiously.


**3. Create a Database, Add Tables, and Insert Data:**

```sql
CREATE DATABASE my_database;  -- Create the database

USE my_database;  -- Switch to the new database

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) -- Define a foreign key
);

-- Insert data
INSERT INTO customers (name, email) VALUES ('John Doe', 'john.doe@example.com');
INSERT INTO orders (customer_id, order_date) VALUES (1, '2024-07-23');

-- You can insert multiple rows at once:
INSERT INTO customers (name, email) VALUES 
    ('Jane Smith', 'jane.smith@example.com'),
    ('Peter Jones', 'peter.jones@example.com');


```


**4. Delete/Modify a Table or Database:**

* **Delete a table:**
   ```sql
   DROP TABLE table_name;  -- Permanently deletes the table and its data
   ```

* **Modify a table (add a column):**
   ```sql
   ALTER TABLE table_name
   ADD COLUMN new_column_name data_type constraints; -- Example: ADD COLUMN phone_number VARCHAR(20);
   ```

* **Modify a table (change a column's data type):**
    ```sql
    ALTER TABLE table_name
    MODIFY COLUMN column_name new_data_type new_constraints; -- MODIFY COLUMN age INT;
    ```

* **Delete a database:**
   ```sql
   DROP DATABASE database_name; -- Permanently deletes the database and all its tables
   ```

* **Rename a table:**
    ```sql
    ALTER TABLE old_table_name RENAME TO new_table_name;
    ```
* **Rename a database:**
    ```sql
    ALTER DATABASE old_database_name RENAME TO new_database_name;  -- Only supported in MySQL 8.0+
    ```



**Important Notes:**

* `DROP` commands are permanent.  Use them with caution!
* `ALTER TABLE` allows you to make many other changes to a table structure, including adding/dropping constraints, changing column names, and more.
* Always back up your data before performing any destructive operations.




These examples and explanations should give you a solid starting point for working with MySQL.  Remember to consult the official MySQL documentation for the most accurate and detailed information.