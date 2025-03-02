# Session 2

Let's explore these fundamental MySQL concepts with practical examples. We'll use a simple database scenario with two tables: `Customers` and `Orders`.

**Tables:**

* **Customers:**
    * `customer_id` (INT, PRIMARY KEY)
    * `name` (VARCHAR(255))
    * `city` (VARCHAR(255))
    * `country` (VARCHAR(255))

* **Orders:**
    * `order_id` (INT, PRIMARY KEY)
    * `customer_id` (INT, FOREIGN KEY referencing Customers.customer_id)
    * `order_date` (DATE)
    * `total_amount` (DECIMAL)


**1. Writing SELECT Statements:**

* **Select all columns from a table:**

```sql
SELECT * FROM Customers; -- Retrieves all rows and all columns from the Customers table.
```

* **Select specific columns:**

```sql
SELECT name, city FROM Customers; -- Retrieves only the name and city of all customers.
```

* **Select with aliases:**

```sql
SELECT name AS CustomerName, city AS CustomerCity 
FROM Customers; -- Retrieves name and city, but labels them as CustomerName and CustomerCity.
```

* **Select with calculated values:**

```sql
SELECT order_id, total_amount, total_amount * 0.1 AS sales_tax  -- Calculating a 10% sales tax
FROM Orders;
```

* **Select distinct values:**
```sql
SELECT DISTINCT country FROM Customers; -- Shows a list of unique countries.
```


**2. Using WHERE Clause:**

* **Filtering by a single condition:**

```sql
SELECT * FROM Customers WHERE country = 'USA';  -- Retrieves all customers from the USA.
```

* **Filtering by multiple conditions (AND):**

```sql
SELECT * FROM Orders WHERE customer_id = 10 AND order_date > '2024-01-01'; -- Orders from customer 10 after Jan 1, 2024.
```

* **Filtering by multiple conditions (OR):**

```sql
SELECT * FROM Customers WHERE city = 'London' OR city = 'Paris'; -- Customers in London or Paris.
```

* **Using other comparison operators:**

```sql
SELECT * FROM Orders WHERE total_amount >= 50;  -- Orders with a total amount of 50 or more.

SELECT * FROM Customers WHERE name LIKE 'J%';   -- Customers whose names start with 'J'.
```

* **Combining AND and OR (use parentheses for precedence):**
```sql
SELECT * FROM Customers WHERE (city = 'London' OR city = 'Paris') AND country = 'UK'; -- Customers in London or Paris who are in the UK.
```



**3. Sorting Data with ORDER BY:**

* **Sorting in ascending order:**

```sql
SELECT * FROM Customers ORDER BY name ASC; -- Sorts customers alphabetically by name.
```

* **Sorting in descending order:**

```sql
SELECT * FROM Orders ORDER BY order_date DESC;  -- Sorts orders from the most recent to the oldest.
```

* **Sorting by multiple columns:**

```sql
SELECT * FROM Customers ORDER BY country ASC, city ASC; -- Sorts by country, then by city within each country.
```



**4. Basic JOIN Operations:**

* **INNER JOIN (returns only matching rows):**

```sql
SELECT c.name, o.order_id, o.total_amount
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id; -- Retrieves customer names and their order details.
```

* **LEFT JOIN (returns all rows from the left table and matching rows from the right):**

```sql
SELECT c.name, o.order_id
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id; -- All customers, even those without orders (order_id will be NULL).
```

* **RIGHT JOIN (returns all rows from the right table and matching rows from the left):**
```sql
SELECT c.name, o.order_id
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id; -- All orders, even those with potentially "missing" customer information (rare but can happen with data integrity issues).  name will be NULL if the customer doesn't exist.
```


These examples demonstrate the basic usage of `SELECT`, `WHERE`, `ORDER BY`, and `JOIN` in MySQL.  By combining these clauses and using various operators and functions, you can create complex queries to extract and manipulate data efficiently. Remember to adapt the table and column names to match your specific database schema.