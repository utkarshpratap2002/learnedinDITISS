# RDMS

It is a kind of Database software that is used to manage the data, meaning write the data, update the data, make changes, like create or insert into the database, and delete the database. It is similar to Excel (not your typical RDMS), mysql, mongoDB, Cassandra, Oracle. All these are called **RDMS (Relational Database Management System)**. 

There are typically two types.
- **RDBMS** started in 1970, when the theory was developed and people started talking about it in theory, SQL was RQL (Relation Query Lanaguage), and standardiation was first officailly released in 1986, and people started upgrading in 1989.
  - It manages the data in tabular format, in tables, basically in rows and columns. Some popularly used databases are Oracle, MySQL, PostgreSQL, Microsoft SQL.
  - Basically the whole management thing that we do is called CRUD Operations, performed using the SQL queries.
  - It is called Structured Query Lanaguage, the stnadardization was done in 1986 by ANSI (American National Standard Institution). It is standar dfor all teh sql langeuages.
  - It is case insensitive language, it just doesn't matter where letter are uppercase or lowercase.
  - DDL (Data Distribution Language), DML (Data Manipulation Language), DQL (Data Query Language), DCL (Data Control Lanaguage), TCL (Transaction Control Language).


Let's talk about the SQL, and all the operation that we perform through the SQL.

- **DDL** includes CREATE TABLE, ALTER TABLE, DROP TABLE, TRUNCATE, ...
- **DML** includes INSERT, UPDATE, AND DELETE
- **DQL** includes SELECT, this is called retrival of data.
- **TCL** includes START, TRANSACTION, COMMIT, ROLLBACK, ...
- **DCL** takes care of the security associated with the data, includes GRANT, REVOKE, ...


- **NoSQL (Not Only Database)** came after the 1998, where people stated overcomming the limitaion often MySQL, for example, Cassandra, MongoDB, Redis, Nei4J.

*lets start talking about the who designed it*, it was developed by Michael, named after Myia (his daughter), it was first taken by SunOS, then Oracle took the MySQL. Lets talk about its insallation on Linux. 

The Installation on Ubuntu is done by a simple command.
```
sudo apt install mysql-server
```
In windows, the MySQL server configuration file is the **my.ini** file and on linux is is **my.cnf** file. On Windows, it is installed with name **mysqld.exe**, meaning it is a daemon, by default the port used in the installation is 3306, if you want to change it, it can be changed. MySQL installation comes with the installation of the NoSQL installation itself, as the port is **33060**. 

The Database for the MySQL is located on a particular location that is **/var/lib/mysql/** in **Ubuntu**. In case of Windows and linux there is .ini or .cnf file where globally the MySQL configuration file is located, it is installed on location such as below:

- C:\ProgramData\MySQL\MySQLserver\my.ini for Windows 
- /etc/mysql/my.ini for Linux.

The services can be changed using the following command:

- **systemctl** is used for starting the services in Linux.
- **sc** in windows are used for the same in Windows.

# Learning MySQL

If you want to start with mysql we need to start with 

```
mysql -u root -p
```

You can also see how many databases are there on you machine using the following databases.

```
SHOW DATABASES;
```
If you want to create the database, then you can create using the following query.

```
CREATE DATABASE ditissdb;
```

If you want to use the Operating system command within the SQL, you need to use the following command.

```
\! clear
```

To start using the Database you need to start with **USE** command, and then create table using **CREATE TABLE**. Thus, if you want to use the database you first need to get into the data, then you can implement the data.

```
USE ditissdb

CREATE TABLE course(cid INT, cname CHAR(20), cdesc VARCHAR(60), cfees DOUBLE);

SHOW TABLES;

DESCRIBE course;
```

Thus you can insert into the course table and add new values using the following paradigm.

```
INSERT INTO course VALUES (1, 'PG-DITISS', 'Security * Admin Experts', 10600);

INSERT INTO course (cid, cname, cfees, cdesc) VALUES (2, 'PG-DAC', 'Web Application Developers');
```

Inserting multiple records in the following way.

```
INSERT INTO course (cid, cname, cdesc) VALUES (3, 'PG-DMC', 'Mobile Application Developer'),
(4, 'PG-DBDA', 'Machine Learning and Artificial Intelligence')
```

### Comuputer column

If you want to change the computed column that will allow you to change the computer column of the 

Remember that writing as keywords is optional it is called **cloumn alias**, as they are called speacial characters. If the columsor alias name contains speacial chard like space, #, $, then tha name must be given in `back quotes`.

What is called Projection.

# DDL Queries
Now run the query below:

```
SELECT *  FROM course ORDER BY cname DESC;
```
This is by default asending sort order, then you can make the query run in desending order of the fees. 

# MySQL Data Types

- **Numberic Data types**, it is worth talking about some data types, uses the following data types.
  - TINYINT(1)
  - SMALLINT(2)
  - MEDIUMINT(3)
  - INT(4)
  - BIGINT(8)

- **Floating Data types**, we used DOUBLE, typical size of 8 Byte, have the similar behaviour to JAVA double.
  - DOUBLE(8)
  - FLOAT(4)
  - DECIMAL(m,n) where m and n means the precession that needs to be made in order to approximation upto particular decimal places, then you can use the concept of DECIMAL.

- **Date time types**, we can keep the dates and time.
  - DATA: "YYYY-MM-DD"
  - TIME: "HH:MM:SS", this is called interval time, meaning how many time has passed.
  - DATETIME: "YYYY-MMM-DD HH:MM;SS", is where you can to store the exact date and time of the customer.
  - TIMESTAMP(4bytes-num of seccs from epoch time: 1-1-1970 0:0:0)
  - YEAR: yy(1 byte: 1901 to 2155)

- **String Data types**, we can use the following types.
  - CHAR(N), having maximum limit of 255, the space for this is pre-allocated, it will always allocate the particular space but that left out space can be utilized.
  - VARCHAR(N), maxiumum limit of 64k, space allocated as per the given characters. But the space remain fixed, when we know that the space might be need again.
  - TEXT(N), maxiumum limit of 64k, space allocated as per the given characters, but the content is stored externally, meaning the lenght of the content is measured and then the memory is stored using the pointer to the hardisk.

- **Binary types**
  - BINARY(N), max size of 255 bytes
  - VARBINARY(N), max 64k bytes
  - BLOB(N), max 64k bytes external 

- **Miscellaneous types**
  - BIT(N)
  - SET
  - ENUM

- **NULL** is one data type is a speacial constant value that can be assigned to any column, that means thre is no value at al.

Note, in order to check in which database you are, you should go for check where and who you are logged in as.

```
select user(), database();
```

Use **`SOURCE`** in order to write a script of the file, as the file will contain all the query, it is just like the shell scripting where you can make the file export easy.

```
SOURCE path/to/the/file.sql;
```

Remember that you don't miss any spaces in between as the spaces are not expected 

- Using DELETE you can delete on row or all the rows 
- Delete is slower and truncte is faster
- Delete can be rollbacked as it is DML query, but the DDL query Truncate cannot be roolbacked.

One thing that is comman between the two is the fact that the table structure is not deleted, the table content is deleted, all rows are deleted. But if you need to delete the whole table, then it has to be DROP TABLE *table-name*.

