# Apache

Apache is being trusted by many organisations and it is also open-source system, we can configured it in multiple variants, call is deployment of apache. Basically we need to remember how web works, it is **Web Architecture** we need to discuss.

URLs (Uniform Resource Locators) are used to address resources on the web. They specify a protocol (e.g. http), a server name, a path to the resource, and potentially a query string. A client, such as a web browser, sends a request to a server using a URL. The server then sends a response, which includes a status code indicating whether the request was successful or not. The server may also send a response body, which contains the requested data. Details of the transaction, including any errors, are logged for later reference.


This architecture works by reponding with services that needs to be provided, using the **request** and **reponse** server, both of them contains the header in key-value pairs and another contains the boy corresponding to the request that client has made.

### Stack

Web server **Stack**, meaning **AMP** is a web server stack that includes multiple technologies in order to server web pages, these stacks are used during the deployment and we can have multiple services or technologies like Apache (or Ngnix), MySQL and Python.

- **AMP**, it can be run using the apache, MySQL, Python/Perl/PHP. 
- **MEAN** - Mongo + Express + Angular + Node
- **MERN** - Mongo + Express + React + Node

Refer to [stack](../concepts/stack.md) in order to learn more about how Apache is not just a single entity instead it is a *one part* of whole web server stack.

# Configuring HTTPD service

First you need to check if the **httpd**, http daemon is already installed. It will be the httpd server that we are going to use to create a server on the machine and then hosts it. SO first you use **rpm** to check if the daemon httpd is installed.

```
rpm -q httpd
```

Now you need to check if the service for the **httpd** is working using `systemctl start httpd` and also don't forget to **enable** it, this will make sure the server will start automaitically when the system will boot up.

```
sudo systemctl status httpd
sudo systemctl enable httpd
```

Now you need to check if httpd default website is accessible, the default website lies in **/var/www/html**. If if doesn't give a response, it means the connection is not established and the server is not running, next you need to check if the firewall is allowing the http service, which you need to implement on the inbound of the server.

```
firewall-cmd --add-service=http --permanent
firewall-cmd --reload
```

Now you can check if the default website is working. The default website listens on port **80** and by default the web server listens on port 80, but if bind your default website with another port then you might not get the same result. You can make sure the website is working using the below command.

```
curl http://localhost
```

You can put your file into the default path **/var/www/html** and this is where you'll find a default *index.html* which will be hosted if you do **curl localhost**.


# Apache Configuration for Custom Website

The default website is hosted inside **/etc/www/html/** but you can host mutliple webiste using the Apache configuration files inside **/etc/httpd/**, where you can find **conf** and **conf.d**, conf.d is a directory that will have the configurations of you customly build websites. 

You are to first create your custom website folders within the directory **/var/www/**, say website1, website2, and so on. Inside directory you need to create the html file named *index.html*.

```

# create a website named mywebsite1 in /var/www/mywebsite1
> sudo mkdir /var/www/mywebsite1

# copy some contents in the index file
> sudo vim /var/www/mywesite1/index.html
# this is my website 1

```

Now you need to configure the httpd configuration file **/etc/httpd/conf.d/website1.conf**, **/etc/httpd/conf.d/website2.conf**, where you need to create the website1.conf and website2.conf inside the conf.d directory first.

```

# add virtual hosting  settings for mywebsite1
> sudo vim /etc/httpd/conf.d/website1.conf

# add the following settings for website1
<VirtualHost *:80>
    DocumentRoot "/var/www/website1"
    ServerName www.website1.local
</VirtualHost>

```

The **Virtual Host** entries contains three things.

- **Port Number**: This tells which port the server should listen to for the particular website.
- **DocumentRoot**: It tells the file directory to which the website is saved.
- **ServerName**: It tells what is the domain name of the webiste.

Now you need to go to the **/etc/hosts** file which is like the local DNS for the website that you are going to host. So you need to start giving the entries of the websites **customly build** webistes. 

```
127.0.0.1 www.website1.local
```

This means that the custom websites are hosted on the same machine and can be find using the following domain name. So, if you do the following:

```
curl www.website1.local
```

You can find the website inside the folder **/etc/www/website1/index.html** getting hosted on your local mahine. You can also go and look for the website on your chrome browser by giving the IP address of the virtual machine that is running the server. But becuase it is custom website which will not be available on the local host, you need to add the domain name entries on your local machine also. So you need to edit **/etc/hosts** entries on your local machine with the domain name.

Whenever you are making changes on your httpd configuration file, you need to update the httpd using **systemctl**




You can COnfigure the configuration file **/etc/httpd/conf/httpd.conf**. You can directly go to the file and look into the settings. This is where you'll find the server configuration 

### /etc/httpd/conf/httpd.conf

The file containing the default configuration of an Apache web server is typically called **httpd.conf** (or **apache2.conf** on some Linux distributions).  The exact name and location might vary slightly depending on the specific operating system and installation.  Modern installations may also utilize a virtual host configuration, stored in files like `sites-available`, `sites-enabled` or similar folder structures.


### Listen 80

If you want to change th eport number form 80 to 8080, you can change the line number 47 and change the port to which the port listens. Now if you need to make it work, you need to try it on the port number and this is done using the following command.

```
root@localhost:/etc/httpd/conf# curl http://localhost:8080
This is my Webiste!
```

### conf.modules.d/*.conf

`conf.modules.d/*.conf` contains **separate configuration files for individual Apache modules**. Instead of having one large monolithic configuration file, this directory structure allows for modularity and easier management of different components.  Each `.conf` file within that directory typically configures a specific Apache module.  This is a common organizational approach in modern Apache setups, often found in more complex installations compared to a simple `httpd.conf`.


### User apache

This proves the fact there apache is using the system user and this can checked using the following commands.

```
cat /etc/passwd | grep apache
```

### Blocks

This is another file that 

### DocumentRoot "/var/www/"

This is where you can change the **Document Root** file and can save the file in different location. This is the same location where you can create multiple website and store them to host them, by default there exist the html directory that has the default website running.

# Understanding HTTP Request and Response

The image shows a breakdown of an HTTP request.  Let's break down the key aspects:

* **Request:**  The process when a web client (like a browser) connects to a web server.

* **Default Method (Port 80):** The client's initial connection attempt is *typically* directed to port 80 of the server.  This is the default port for HTTP.

* **HTTP-compliant Commands:**  The client doesn't just connect; it sends specific HTTP commands (often called "verbs" or "methods") to instruct the server what to do, such as `GET` (retrieving a resource).

* **Request Header:**  Each command is accompanied by a request header.  This header contains crucial information about the client, including:
    * **Client's software and Version:**  Like the browser type and version (`User-Agent`).
    * **Requested resource:**  The specific file or content (`Host: localhost`).
    * **Preferred content types (MIME types):** Like `Accept: text/xml, image/gif, image/jpeg, image/png...`.
    * **Desired encoding and language:** Like `Accept-Language: en-us`, `Accept-Charset: iso-8859-1,* utf-8`.

* **GET / HTTP/1.1:**  This is a specific example of an HTTP command.  `GET` requests a resource from the server, `HTTP/1.1` specifies the version of HTTP in use.  `/` indicates a request for the root resource (often the main page).

* **Connection: Keep-Alive:**  This tells the server to keep the connection open, allowing subsequent requests to use the same connection.  This enhances performance, as it avoids the overhead of creating a new connection for each request.

The key here is that `curl localhost` is a client making an HTTP request.  If your firewall *only* blocks access to port 8080, the `curl` (a client) might work because the server software listens on port 80 (or another open port). The details from the request show it's a standard web client request to the web server. The firewall is a potential issue but might not be the sole source of the problem. You need to check which port the web server is actively using.

The **HTTP response** from a web server after a client request.  Let's break down the attributes:

* **HTTP/1.1 200 OK:** This is the initial status line.  `HTTP/1.1` indicates the HTTP protocol version.  `200 OK` means the request was successful.  It's a standard part of the server's reply to the client.

* **Date:**  `Mon, 14 Nov 2022 14:03:31 GMT` shows the date and time the server processed the request in Greenwich Mean Time (GMT).

* **Server:** `Apache/2.4* (Fedora)`: Identifies the web server software and the operating system it's running on. The asterisk (*) often signifies a specific version or a variant within the software.

* **Last-Modified:** `Mon, 14 Nov 2022 11:41:32 GMT`: This tells the client when the content was last changed.

* **ETag:** `"7888-1f-b80bf300"`: An entity tag, a unique identifier for the content.

* **Accept-Ranges:** `bytes`:  This means the server can support byte-range requests (allowing the client to request only a part of the file).

* **Content-Length:** `31`:  The size of the content being sent back in bytes.

* **Connection:** `close`: Indicates the connection will be closed after this response.

* **Content-Type:** `text/html; charset=UTF-8`:  Specifies the MIME type and character encoding of the content (HTML).  `UTF-8` is a common encoding for web pages.

These headers provide crucial information about the server, the response, and the content being sent.  They are vital for the client to understand and process the server's reply effectively.  They are a crucial part of the HTTP protocol's communication between a client and a server.




