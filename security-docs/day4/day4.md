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

If we go to the Youtube history, hyou 

# Setting Up DNS and DHCP Server To Redirect the user to Phishing website

# SQL Injection

Perform the following command in order to by pass the vulnerability.

```
1' or '1' = '1 UNION SELECT * from users#
```
