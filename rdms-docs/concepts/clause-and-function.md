# Clause and Function

SQL provides several clauses and functions to extract data, filter it, and perform calculations. Here's a breakdown of the key elements:

**Core Clauses for Data Extraction:**

* **`SELECT`:**  This is the fundamental clause for retrieving data. It specifies the columns you want to retrieve. You can use `*` to select all columns.  Example: `SELECT EmployeeName, Department FROM Employees;`

* **`FROM`:** This clause indicates the table(s) from which you're retrieving data. Example: `FROM Employees;`

* **`WHERE`:** This clause filters the data based on specified conditions. Example: `WHERE Department = 'Sales';`

* **`GROUP BY`:** This clause groups rows with the same values in specified columns, often used with aggregate functions (see below). Example: `GROUP BY Department;`

* **`HAVING`:**  This clause filters the results of a `GROUP BY` clause.  It's like a `WHERE` clause, but it applies after grouping. Example: `HAVING COUNT(*) > 5;`

* **`ORDER BY`:** This clause sorts the results based on specified columns. You can use `ASC` (ascending) or `DESC` (descending) to specify the sorting order. Example: `ORDER BY EmployeeName ASC;`

* **`LIMIT` (or `TOP` in some SQL dialects):** This clause restricts the number of rows returned. Example: `LIMIT 10;` or `TOP 10;`


**Functions for Data Manipulation and Calculation:**

* **Aggregate Functions:** These functions perform calculations on sets of rows to return a single value.
    * `COUNT()`: Counts the number of rows.
    * `SUM()`: Calculates the sum of values in a column.
    * `AVG()`: Calculates the average of values in a column.
    * `MAX()`: Returns the maximum value in a column.
    * `MIN()`: Returns the minimum value in a column.

* **String Functions:** These functions manipulate string values.
    * `CONCAT()`: Joins two or more strings together.
    * `SUBSTR()`: Extracts a substring from a string.
    * `LENGTH()`: Returns the length of a string.
    * `UPPER()`: Converts a string to uppercase.
    * `LOWER()`: Converts a string to lowercase.
    * `REPLACE()`: Replaces occurrences of a substring within a string.


* **Date and Time Functions:** These functions work with date and time values.
    * `NOW()`: Returns the current date and time.
    * `DATE()`: Extracts the date part from a date and time value.
    * `TIME()`: Extracts the time part from a date and time value.
    * `DATE_ADD()`: Adds a specified interval to a date.
    * `DATE_SUB()`: Subtracts a specified interval from a date.
    * `DATEDIFF()`: Calculates the difference between two dates.


* **Mathematical Functions:**
    * `ROUND()`: Rounds a number to a specified number of decimal places.
    * `ABS()`: Returns the absolute value of a number.
    * `MOD()`: Returns the remainder of a division.


* **Other Useful Functions:**
    * `CAST()`: Converts a value from one data type to another.
    * `COALESCE()`: Returns the first non-null value in a list.
    * `CASE`: Used for conditional logic within a query.


This is not an exhaustive list, as SQL has many more functions and features, but it covers the most common and essential elements used for extracting and manipulating data within a database. You can find more specific documentation for your particular SQL database system (MySQL, PostgreSQL, SQL Server, etc.) for a complete reference.
