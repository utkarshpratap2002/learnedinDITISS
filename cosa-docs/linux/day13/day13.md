# Apache

Apache is being trusted by many organisations and it is also open-source system, we can configured it in multiple variants, call is deployment of apache. Basically we need to remember how web works, it is **Web Architecture** we need to discuss.

URLs (Uniform Resource Locators) are used to address resources on the web. They specify a protocol (e.g. http), a server name, a path to the resource, and potentially a query string. A client, such as a web browser, sends a request to a server using a URL. The server then sends a response, which includes a status code indicating whether the request was successful or not. The server may also send a response body, which contains the requested data. Details of the transaction, including any errors, are logged for later reference.


This architecture works by reponding with services that needs to be provided, using the **request** and **reponse** server, both of them contains the header in key-value pairs and another contains the boy corresponding to the request that client has made.

### Stack

Both of them uses **Stack**, these stacks are used during the deployment and we can have multiple like Apache, MySQL and Python.
- **AMP**, it can be run using the apache, MySQL, Python/Perl/PHP. 
- **MEAN** - Mongo + Express + Angular + Node
- **MERN** - Mongo + Express + React + Node

# How do you configure a service?

First you need to check if the **httpd** server is already installed. Thus, it is the httpd server that we are going to use to create a server on the machine and then hosts it. SO first you use **rpm** to check if the daemon httpd is installed.

```
rpm -q httpd
```

Now you need to check if the service for the **httpd** is working. And also don't forget to **enable** it, this will make sure the server will start automaitically when the system will boot up.

```
sudo systemctl status httpd
sudo systemctl enable httpd
```

Now you need to check if httpd default website is accessible. If if doesn't give a response, it means the connection is not established and the server is not running, which you can using the previous command.

```
curl http://localhost
```

You can put your file into the default path **/var/www/html** and this is where you'll find a default *index.html* which will be hosted if you do **curl localhost**.


# Apache Configuration

You can COnfigure the configuration file **/etc/httpd/httpd.conf**. You can directly go to the file and look into the settings. This is where you'll find the server configuration 

### ServerRoot "/etc/httpd"

This is the file contains all tehdefault configuration of service.

### Listen 80

If you want to change th eport number form 80 to 8080, you can change the line number 47 and change the port to which the port listens. Now if you need to make it work, you need to try it on the port number and this is done using the following command.

```
root@localhost:/etc/httpd/conf# curl http://localhost:8080
This is my Webiste!
```

### Include conf.modules.d/*.conf

If you want to customise the apache using some other application then you need to start editing this direcotry called **conf.modules.d** directory.

### User apache

This proves the fact there apache is using the system user and this can checked using the following commands.

```
cat /etc/passwd | grep apache
```

### Blocks

This is another file that 

### DocumentRoot "/var/www/html"

This is where you can change the **Document Root** file and can save theifiel in different location.

# Virtual Hosting 

Check for the apache configuration directory. YOu first need to create the fiels insifde teh **/etc/httpd/conf.d**. Now we are going to host mutliple websites for different website

```
cd /etc/httpd/conf.d
```

Now you need to go and put the configuration files for the websites.

```
vim website.conf
```

And you need to write the following commands.

```
<VirtualHost *:80>
    DocumentRoot "/var/www/mywebsite1"
    ServerName www.mywebsite1.local
</VirtualHost>
```

Now you need to create the document rooot for the website1,

```
mkdir /var/www/website1
```
 
And then you need to create the html file.

```
vim /var/www/website1/index.html
```

Then you need to go to the file **/etc/hosts** and write the follwoing entry.

```
127.0.0.1 www.website1.local
```

Then you need to restart using systemctl.


