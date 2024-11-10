# Stoered Procedures

We are basically sending SQL queries over the server, it slows down the process and performeace, that is why Stored Prcedures are used t sppee dup th execution, 

To speeup the executino one/more spwl stamtnsts are written in ablock called procedure. It is compulerd adnd stoed in db servr, now this "sotored procedure" can be acalled multiple times, but execution will be muhch fasterm because no system check id required.

In order to do this., you need to do this, you need to set up t "Delimiter", Once you set the delimit, ceint will send it to ther servver,e 

```
DELIMITER $$

CREAE PROCEDURE
sp_findemp(eid INT)
BEGIN 
SELECT * FROM emp WHERE EMLOYEED;
FINDD
$$
```


# Using Python with MySQL

In order to interact with MySQL usng Python, you need to install the package that can connect the MySQL with python, the package that we are going to use is **mysql-connector-python** which is the easiest way of connecting python with mysql.

First you need to check if you have pip installed on your server, if not, then install one using the following command and check the version of **pip** isntalled and the version of python using the following command.

```
sudo dnf install python3-pip -y

pip --version

python --version
```

Then, make a directory for the modal and start with the creation of the python file. Then start with the import of your mysql-connector-python module named **mysql.connector**.

``` 
import mysql.connector
```

Then what you need to do is create a dictionary with **db_conf**, this dictionary is configuarational file for the sql connection that stores the basic login credentails through which you will be logging in to the MySQL server.

```python3
db_conf = {
        "host": "localhost",
        "user": "root",
        "password": "singhsingh",
        "database": "MYTABLE"
        }
```
Remember if you need to connect to the server where MySQL is running you need to write the IP address of that server, say the IP address of the Machine where MySQL server is running is **172.16.164.134** and you are trying to connect the MySQL server through your machine, say **192.168.1.2** for example, then in the `host` entry will looking something like below:

```python3
db_conf = {
        "host": "172.16.164.134",
        "user": "root",
        "password": "singhsingh",
        "database": "MYTABLE"
        }
```

Then create a variable and initialise you connection with mysql. This will start the connection with the configuration dictionary that you created.

```
dbcon = mysql.connector.connect(**db_conf)
```
Now, we will be creating a cursor object, `dbcon.cursor()` that we will be using to execute the SQL queries.

```
cur = dbcon.cursor()
```

Then, make write your SQL queries and store it in a variable, you can also write a set of queries in order to 




