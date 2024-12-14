# Asymmetric Cryptography

- Rule Two, Every will be having two keys, one is public key and another is private key.

- Rule Three, private is not to be shared and public key can be shared to anyone.

- Rule Fourth, Both the keys can be used for encryption and decryption, though, if you are encrypting using the public key, the same key can't be used for the decryption, because it can only be decrypted using the corresponding key, meaning if encryption is done using the public key.

- **Concept** - If you are having theh private key of someone else person, then the confidentiality is conpromised. Only you are suppose to encrypt the data using your private key and everyone else can decrypt is, ensuring Non-repudiation, meaning ensuring the identity. 

Let discuss the further definations that supports the same concepts.

- What is Secure Format? When the message is encrypted with the public key of the reciever.

- What is Open message Format? Encrypting data with the sender's private key.

### Deffie-Helmann

Basically it solves the problem of confidentiality of how the data is encrypted or protected from unauthorised access, take a scenario of two people (A and B) wants to communicate with each other, say A will send the lock to another with his own key, and B wil send it back with his key, A will then open the lock using his key and B will do that same. 

Deffie-Helmann works in similar manner, meaning it works similarly using the mathematical formulas.

- Tinku Calculates 'A = g ^ a mod p', which is 5 ^ 6 mod 23 = 8
- Pinky Calculates 'B = g ^ b mod p', which is 5 ^ 15 mod 23 = 19

- Tinku then sends 'A' to Pinky
- Pinky then sends 'B' to Tinku

- Tinku calculates teh secret key 's = B ^ a mod p', which is: 2
- Pinky calculates teh secret key 's = A ^ b mod p', which is: 2

Here are some examples of asymmetric key algorithms:

* **RSA (Rivest–Shamir–Adleman):**  One of the oldest and most widely used. Its security relies on the difficulty of factoring large numbers.  Used for encryption, digital signatures, and key exchange.

* **ECC (Elliptic Curve Cryptography):**  Offers strong security with smaller key sizes compared to RSA.  Based on the discrete logarithm problem of elliptic curves over finite fields.  Used for encryption, digital signatures, and key exchange.  Gaining popularity due to its efficiency, especially in resource-constrained environments.  Commonly used curves include Curve25519, NIST P-256, etc.

* **DSA (Digital Signature Algorithm):**  Specifically designed for digital signatures, although related algorithms like ECDSA (using elliptic curves) are now more commonly used.  Its security is based on the discrete logarithm problem.

* **ElGamal Encryption:**  Based on the Diffie-Hellman key exchange. Used for encryption and digital signatures.  Less widely used than RSA or ECC.

* **Diffie-Hellman Key Exchange:** While not strictly an encryption algorithm, it's a fundamental method for securely exchanging keys over an insecure channel. Used to establish a shared secret that can be used for symmetric encryption.  Variants include ECDH (Elliptic Curve Diffie-Hellman).

<br>

# NCPA - Nagios Cross Platform Agent

- Open the NCPA, give and token and provide the port number.

- Make sure that firewall is switched off. Open the base machine. 

- Go to the `http://<ip-address>:<port-number>`, and enter the token and *Enter*, you should be able to see the statistics. 

Verify certain things before getting ahead. You need to check the Firewall first, whether it is turned off, second you need to check for the ncpa agent is in the running state

- One step missing!

- Go to /usr/local/nagios/libexec/check_ncpa.py and change the shabang header to python3.

- Now you need to check whether the python script is running or not, use `sudo ./check_ncpa.py -V`. We only tested the python script, but now we need this python file to talk to our windows machine and ask for the files and data. 

- `sudo ./check_ncpa.py -t Password123 -H 192.168.80.13 -M memory/virtual`

- Now you need to move to the /usr/local/nagios/etc/objects/ where you'll find the commands.

- Now create teh function inside tehh command.cfg file.

    ```
    define command {
        command_name    check_ncpa
        command_line    $USER1$/check_ncpa.py -H $HOSTADDRESS$ $ARG1$
    }
    ```
- Nagios yet don't know what machine is to monitored, so do the following. 

- Basically what we are doing is that when we are making the file we are requried to make the file public and therefore we need to install the we need to 

```
define host {
    use                     windows-server
    host_name               win-10_1
    alias                   Windows 10 System 1
}

define service {
    use                     generic-service
    host_name               win-10_1
    service_description     NCPA Agent Version
    check_command           kcheck_ncpa!-t 'Password1234' -p -P 5693 -M system/agent_version
}

define service {
    use                     generic-service
    host_name               win-10_1
    service_descriptions    CPU Average
    check_command           check_ncpa!-t 'Password1234' -p -P 5693 -M cpu/percent -w 20 -c 40 -q 'aggregate=avg'
}

```

# Reverse Proxy

We are going to establish a reverse proxy where we are installing two servers on each machine, one will be on **ngnix** and another will be **apache**. 

Our goal is to establish Reverse proxy, when redirect to ngnix backend, it will be redirected to apache. 

- Install the apache2 and ngnix server on the machine. 

```
sudo apt-get install ngnix

sudo apt-get install apache2
```

- Now we need to remove the contenet of sites-enabled.

```
rm -rf /etc/apache2/sites-enabled/*
```

- Go to the site-available and write the following script inside `/etc/ngnix/site-available/rp.conf`.

```
server {
    listen 80;
    location / {
        proxy_pass http://192.168.80.130;
    }
}
```

- After writing the script, create soft link using the below command.

    ```
    ln -s /etc/ngnix/sites-available/rp.conf /etc/ngnix/sites-enabled
    ```

- Now you just need to test what we did just now.

    ```
    sudo ngnix -t -c /etc/ngnix/ngnix.conf
    ```

- Now just do the simple restart the service.

**Key Differences & When to Use Which:**

| Feature        | HAProxy                                 | Nginx                                  |
|----------------|------------------------------------------|-----------------------------------------|
| Primary Role  | Load balancer, reverse proxy              | Web server, reverse proxy, load balancer |
| Performance     | Extremely high, especially for TCP/HTTP | Very good, especially for static content|
| Layer 7 Features| Primarily HTTP/HTTPS focused             | Richer HTTP features, more versatile     |
| Static Content | Basic support                            | Excellent support                         |
| Load Balancing | Very mature and feature-rich            | Good, but not as advanced as HAProxy     |
| Configuration  | Relatively simple                        | Can be more complex                      |

<br>

* **Choose HAProxy:** When you need the absolute best performance and reliability for load balancing TCP/HTTP-based applications, especially in high-traffic environments.
* **Choose Nginx:** When you need a versatile web server that can *also* act as a reverse proxy, load balancer, and cache, or when you require more advanced HTTP processing capabilities.

Often, they are used together, with Nginx serving static content and handling initial HTTP requests, and HAProxy acting as a load balancer for dynamic content served by application servers.  The best choice depends on your specific needs and infrastructure.


# Squid

- Start with installing `squid`.

    ```
    sudo apt-get install squid
    ```

- This configuration file that contains 9149 lines has the path /etc/squid/squid.conf. Before going ahead *take backup*.

- Squid is basically configured using `TAG`s, which are nothing but indication of sections. We first need to write the ACL tags. 

- Something missing!

- Write the acl for domain.

    ```
    acl shuhari_usrs dstdomain 192.168.80.128
    ```

- Now search for `TAG: http` and write the following.

    ```
    http_access allow shuhari_users
    ```

- Now seach for `TAG: http_port` and scroll down to http_port 3128 which is the default port. 

    ```
    http_port 3128 accel defaultsite=192.168.80.128 vhost
    ```

- Now search for `TAG: cache_peer` 

```
cache_peer 192.168.80.130 parent 80 0 no-query originserver name=shuhari
```

# What do we mean by all that?

*You might ask, what is the difference between the squid and Nginx? Or what is the difference between Nginx and HAproxy? What to use when?* 
