# PKI 

Public Key Infrastructure, collection of entities not as the single process, b

- Method of storing and transmitting data in a form that only those it is intended for can read and process.

- Goal of Cryptography is to encrypt the data such that no one can decrypt the data. Any system can be broken if there is resource and time, so the goal of cryptography is make it harder for the hacker to brainstorm over it. 

- The goal is for sure to protect the data, encrypt the data, but when it comes to philosophy of cryptography we need to understand that we do it because we want to encrypt our data in such a way that it should become harder for any system/resource infact any amount of time to crack it.

# Keywords

- **Plaintext** 

- **Access Control**

- **Encryption**

- **Decryption**

- **Cryptanalysis** - It is basically the study breaking the cryptography

Then there are few more terms that defines how things go in accordance to 

- Cryptology

- Encryption ALgorithm

- Cipher

- Encipher

- Decipher

- Receipt

# Encryption Methods

There can be various encryption methods that are used in Industry. Some of ciphers that we use in the Industry are as follows:

- **Substitution Cipher**, basically there is one is to one replacement of the characters, the algorithm of the subsitution can vary, as well as there could be various forms.
  - Monoalphabetic Substitution Cipher, where there is single mapping of characters. There are two such types, **Atbash** and **Ceaser** Ciphers.

  - **Poly-alphabetic Substitution Cipher**, for example, the Plaintext is `FOUR` and Secret Key that we are sharing with the reciever is `FIVE`. There will be Chart of the Alphabetic listings on X-axis and Y-axix, we can go using the x v/s y mapping of the characters.

- **Transposition Cipher**, basically changing the positions of the 

# Encryption Schemes

Now there are various schemes used in the real world for encrypting the data based on the efficiency that is required.

### **Symmetric Algorithms**

Baically there are lot of things that can be done using the symmetric methods, but the summary is that *Sender and Reciever uses two instances (basically the copy of file that is going both ways) of the same **key** for the encryption and decryption*.

- **Advantages**, it is basically much faster than to asymmetric systems. 

- **Disadvantages**, when it comes to the scalabilty annd key mangement is not efficient and therefore key exhange is difficult, moreover, we even can't share the secret key to people sitting accross the network, and therfore, it is not possible to keep sharing.
  - One important discussion needs to be done, when we talk about the **Authentication** and **Non-repudiation**, basically somehow you just can't prove that the encryption key generated was given or taken by particular person.

- **Examples**

- **Other Symmetric Algorithm are:** 
  - Block Cipher
  - Stream Cipher 

# Redirection of Health of System

In this section we are going to cover the health inspection of the machine, basically we are going to observer some parameter and redirect it to the server. This server is going to access the performance outside of the machine, these parameter can be made available to the main server.

### Three ways of Installing Packages

1. **From binary** - It is a paradigm of installtion using the .deb file, for debian, it is .deb, for fedora it is .rpm and the category **From Source Code**, meaing installing from source code also comes into category of installing it **offline**.

2. **Package Mangement** - It is the paradigm of installing the packages using the package manager, that is through the dnf, yum, apt-get and all. 

3. **Source Code** - There are three ways of making the istalling when a developer creates a application and those are:
  - **Configure**
  - **Make**
  - **Make Install**

# Nagios LAB

1. **Step 1** - First you need to configure the hostname. Take a fresh machine and configure hostname. 

2. Configure a **static IP address** on the server and try pinging to the another machine or sunbeam.shuharilabs.com

3. Check for the **updates** and try to try installing them.

4. Then **check whoami command** and try to get the 

5. **Configure Time Zone**. Run the following command to `sudo dpkg-reconfigure tzdata`, this is how you configure the time zone of the machine.

6. **Installing Nagios Core**. Before installation of Nagios, you need to install the prerequisites, the following is the command.

    ```
    sudo apt-get install apache2 apache2-utils autoconf gcc libc6 libgd-dev make php python3 tree unzip wget libkrb5-dev openssl libssl-dev
    ```

Remember to install the source code of the Nagios, the source code of the Nagios is written as C, **Download**, **Extract** and **Move to directory**.

7. Now, **Find Configure File**. Make sure that you have the Configure file inside the **nagios-4.5.0**.

8. **Installation of Apache Server**. Make sure that you've created the file insdie the /etc/apache2/site-enabled/ folder.

    ```
    ./configure --with-httpd-conf=/etc/apache2/site-enabled
    ```
9. **Compile**. Run the following command `sudo make all install` to start the installation. 

10. **Make New User**. Now we'll be running the Nagios server on this user. We are not going to use the command `sudo make install-group-users`.

In Debian based Linux, the apache user is ***www-data*** for the apace services. You can check the same using the cmd `cat /etc/passwd | grep www`.

11. **Add the www_data to Nagios**. Now you need to add the user to the nagios group, so you need to run the following command `groupadd -aG nagios www-data`.

12. **Change the nagios user password**. Now what needed to be done is that change the password for the nagios user.

13. **Check nagios is installed**. You need to move to /usr/local/ and check if you are able to see the nagios folder created. So you need to install it. Because this is the file that is offical nagios file. Remember to run the `sudo make install` inside the nagios-4.5.0 file.

```
sudo make install
```

14. **Inspect the nagios file**. You need to go into the file and check.

15. **Now make the service available**. Run the `sudo make install-daemoninit` and nagios is installed as the service and now the service is running.

16. **Make the Command Mode on**. Run the file `sudo make install-commandmode`.

17. **Make the file available**. Run this command to execute `sudo make install-config`.

18. Run the command, `ls -l /etc/apache2/site-enabled/`, this will ensure that the installation is complete. 

Once you install the apache, there are modules **rewrite** that changes the url of the website when it get redirect. Another feature is **cgi**, it is the comman gateway interface, that needs to run both the module enable.

```
sudo a2enmod cgi

sudo a2enmod rewrite
```

Now we need to set up the authentication for the service, so that only specific ones are able to access that.

```
sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
```

19. **Authenticate**. Enter the password and confirm the password. 

20. **Verify**. In order to verify, run the command.

```
sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
```

21. Now you need to `sudo systemctl start apache2`.








