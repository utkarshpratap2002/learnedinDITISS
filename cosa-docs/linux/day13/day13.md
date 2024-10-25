# Apache

Apache is being trusted by many organisations and it is also open-source systems, we can configured it in multiple variants, call is deployment of apache. 

# Web Architecture

This architecture works by reponding with services that needs to be provided, using the **request** and **reponse** server, both of them contains the header in key-value pairs and another contains the boy corresponding to the request that client has made.

### Stack

Both of them uses **Stack**, these stacks are used during the deployment and we can have multiple like Apache, MySQL and Python.
- **AMP**, it can be run using the apache, MySQL, Python/Perl/PHP. 
- **MEAN** - Mongo + Express + Angular + Node
- **MERN** - Mongo + Express + React + Node

# How to do it?

First you need to check if the server is already installed.

```
rpm -q httpd
```

Now you need to check if the service for the **httpd** is working. And also don't forget to **enable** it, this will make sure the server will start automaitically when the system will boot up.

```
sudo systemctl status httpd
sudo systemctl enable httpd
```

Now you need to check if httpd default website is accessible. If if doesn't give a script, it means the connection is not established and the server is not running, which you can using the previous command.

```
curl http://localhost
```

You can customise or deply a custom webiste, where you need to directory


# Configuring the Apache 

WHen you have the service running, now you can configure the apache file, that is, **/etc/httpd/httpd.conf**. You can directly go to the file and look into the settings.

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

### <Directory> blocks

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


# 

