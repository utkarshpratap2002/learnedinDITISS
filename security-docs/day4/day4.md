# Web Application

- Damm Vulnearable Web Application, developed speacially for learning the web application security, such that it is open source, developed in **PHP**.

- Requirements: Web server (Linux), Service (Apache), Database (MySQL), WebTech (PHP).

- First, lets install the dvwa in kali linux. Use the following command to install them.

```
sudo apt install dvwa
```

- The agenda is that, we've setup dvwa, we have our own local server, so inside ther are differncet types of security, so we customise the modes of security, for example, as if low, medium, and hard. We need to setup in the following ways.
  - Local Machine should be able to reach the machine.
  - Install the DVWA on linux.
- 42001 is the port of which the service will run. 

- Now, start with database, there you'll find the DVWA Database. Not only that, on the localhost:24001 you will find the option to *reset the database*, it will show the different tables inside the sql server.

- Usrname: admin, Password: password

- Now see the website that shows the page that will tell the **Security Level**. There will be some points to regarding what is needed to be done and how is needed to be done. 

- Basically it tells that when you are developing web application, at that time, OWASP releases the Top 10 security vulnerability for the OWASP. 

- So when you testing the Application, you can't fully say that after testing, the application is vulnerabilty free, or safe. Therefore, there are **Levels** of Vulnerability of the Application. 

- Therefore, OWASP Top 10 Vulnerabilty are tested and this means that we are saying that these top 10 security are upto the *marque*.

- Companies coming for the Security Consultant will always asks for OWASP Top 10.

# Brute Force Vulnerabilty

Brute force vulnerabilty that is cracking the password with all the possible combination. This can be done by trying multiple combination. The point is what id needed to be done, meaning *what can be done?*

- **Make your passwords complicated** - Securoty from the brute force can be achieved by having long and complicated passwords, as the users can have very weak passwords, as they can have passwords for example *p@55w0rds* which is also an expression of *password*. 

# `wfuzz`

Run the following command in order to get the response for the passwords list that you ran over the website or say authentication form. 

```
wfuzz -c -w ~/password.txt -b "security:low; PHPSESSID=document.cookie" "http://127.0.0.1/dvwa/vulnerabilities/brute/index.php?username=admin&password=FUZZ&Login=Login" 
``` 

### Dictionary Passwords

This is how or say one of the methods of reducing the subset of possible passwords that will check for all the possible combination, meaning *trying the most comman passwords*. These are most comman combination, for example, *11111*, *55555*, *12345* etc.

You can go and see what the type of encryption that the passwords are saved in.

- **Restrict the user to limited logins** - Restrict the users with the restricted number of attempts and that you only have limited amount of atte

# How to Perform?

YOu need to open the proxy inside *burpsuite* and start the temp project, then start the burpsuite. So what it does is that it acts like man-in-the-middle who is looking at the traffic and can intercept the traffic that can allow or deny the traffic.

- Bursuite is used in order to see the responses and you can analyse the packages and burpsuite is used to capture the traffic and therefore you can see the traffic going.

- Now if we go back to our dvwa (lamp server), and try logging in with the same passwords and usernames, you'll get those passwords there. Therfore, in case of **Brute force**, you are to perform the various permutation and combination.

- Therfore, in order to do that, you need to go to the **Intruder** inside the Bursuite, then you need to start with **payload**.

- In Payload and because the username is known, it will tell you that the attack type is *sniper*.

- Select the Payload Type as *Brute forcer*, then you need to give the number of attempts, say *1000* passwords for brute forcing.

- You can go and check the *md5hashmanager* to check or see the md5 values of the passwords.

- Using BurpSuite, you can write muliple methods meaning machien will do it, give it muliplte option for checking the login. Bursuite will be running various combinations and once the combination that will look different you'll be able to identify the right passwords.

# Bypassing OTP

THis is another kind of vulnerability which is Bypassing the OTP, and that when it comes to bypassing you need the following steps:

- Go the website *register* page, open the registration page.

- Enter phone number and let the response reach the registered mobile number.

# *Data & Privacy*

Lets talk about the General Request Handling Issues,

* **Lack of Input Validation and Sanitization:** This is a fundamental issue that applies to all HTTP methods. Failure to sanitize user input can lead to injection attacks (XSS, SQL injection, command injection).
* **Insufficient Authentication and Authorization:**  If requests are not properly authenticated and authorized, attackers could perform actions they should not be allowed to.
* **Improper Error Handling:** Verbose error messages can leak sensitive information to attackers.
* **Denial of Service (DoS):**  Large or malformed requests can overload the server, causing a denial of service.

Improperly handling HTTP requests can lead to a wide range of vulnerabilities. Let's explore some common issues related to different HTTP methods:

**1. GET Requests:**

* **Information Leakage:**  Sensitive data should never be included in URLs (query parameters).  Attackers can easily access URLs, potentially exposing confidential information.
* **Cross-Site Scripting (XSS):** If user-supplied data in query parameters is not properly sanitized, attackers could inject malicious JavaScript code that executes in other users' browsers.
* **Server-Side Request Forgery (SSRF):** If a GET request is used to fetch a resource from a user-supplied URL, attackers could potentially access internal resources or services on the server.

**2. POST Requests:**

* **Cross-Site Request Forgery (CSRF):** If POST requests don't include proper CSRF protection (anti-CSRF tokens), attackers could trick users into submitting unintended requests.
* **SQL Injection:** If user-supplied data in POST parameters is not sanitized and is used in SQL queries, attackers could inject malicious SQL code to manipulate the database.
* **Command Injection:**  Similar to SQL injection, if POST data is used to construct shell commands, attackers might be able to inject commands to execute on the server.
* **File Uploads (Unvalidated):**  If POST requests are used for file uploads without proper validation of file types and content, attackers could upload malicious files (e.g., executable scripts) to the server.

**3. PUT Requests:**

* **Method Overriding (Insecure):** Some frameworks allow overriding the HTTP method using a hidden form field. If not handled carefully, this can enable attackers to send unintended PUT requests.
* **Unvalidated Data:**  Similar to POST, if data in PUT requests is not validated and sanitized, it can lead to injection vulnerabilities.
* **Unauthorized Resource Modification:** If PUT requests are not properly authorized, attackers could modify resources they shouldn't have access to.

**4. DELETE Requests:**

* **Unvalidated Data/IDs:** If DELETE requests rely on user-supplied IDs without proper validation, attackers could potentially delete resources they shouldn't have access to.
* **Unauthorized Resource Deletion:**  Similar to PUT, unauthorized DELETE requests can lead to data loss or disruption of service.

**5. Other HTTP Methods (PATCH, HEAD, OPTIONS, etc.):**

* **Method Not Allowed:**  If an application doesn't properly handle unsupported methods, it might reveal information about the server or create unexpected behavior.
* **Method-Specific Vulnerabilities:** Each method has its potential vulnerabilities. For example, `OPTIONS` requests can be used for information gathering, and `PATCH` requests can have similar vulnerabilities to `PUT`.



**Example (Insecure File Upload - PHP):**

```php
<?php
$filename = $_FILES['uploaded_file']['name'];
move_uploaded_file($_FILES['uploaded_file']['tmp_name'], "uploads/$filename");
?>
```

This code is vulnerable because it doesn't validate the uploaded file's type or content. An attacker could upload a malicious PHP script and then execute it by accessing `uploads/malicious_script.php`.


# Setting Up DNS and DHCP Server To Redirect the user to Phishing website

# SQL Injection

Perform the following command in order to by pass the vulnerability.

```
1' or '1' = '1 UNION SELECT * from users#
```
