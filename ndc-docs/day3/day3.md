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

# What does Hash Function do?

Understanding Hash Function is simple, it generates the Hash Code for the data, even a single bit change can cause the hash code to change, therefore hash function is used mainly for encryption in order to check the hash value for verification. 

Hash funcitons are irreversible, meaning if you encrypted the data or message using teh hash function, you won't be able to extract the source from the value itself. This means that ***Hash Function is not for Encryptions or to Encrypt, rather it is used to check the Encryption and authenticity of the message or data***.

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

1. **Configure the hostname**. Take a fresh machine and configure hostname. Use the commad `hostname <hostname>` to configure the hostname.

2. Configure a **static IP address** on the server and try pinging to the another machine or sunbeam.shuharilabs.com.

3. **Check for the updates**. Run the Command `sudo apt-get update && apt-get install`.

4. Then **check whoami command**.

5. **Configure Time Zone**. Run the following command to `sudo dpkg-reconfigure tzdata`, this is how you configure the time zone of the machine.

6. **Installing Nagios Core**. Before installation of Nagios, you need to install the prerequisites, the following is the command.

    ```
    sudo apt-get install apache2 apache2-utils autoconf gcc libc6 libgd-dev make php python3 tree unzip wget libkrb5-dev openssl libssl-dev
    ```

Remember to install the source code of the Nagios from the local server. **Download it**, **Extract it** and **Change the Directory** where Nagios is installed.

7. Now you need to make the configurations inside the nagios source file that you installed. 

8. **Installation of Apache Server**. Make sure that you've created the file insdie the /etc/apache2/site-enabled/ folder.

    ```
    ./configure --with-httpd-conf=/etc/apache2/site-enabled
    ```
9. **Compile**. Run the following command to start the installation.

    ```
    sudo make all
    ```

10. **Create New User**. Use the below command to make the nagios user and group, this user and group are the one on which our apache server will be running. 
    ```
    sudo make install-groups-users
    ```

In Debian based Linux, the apache user is ***www-data*** for the apace services. You can check the same using the cmd `cat /etc/passwd | grep www`.

11. **Add the www_data to Nagios**. Now you need to add the user to the nagios group so that apache can run the services that nagios has.
    ```
    sudo usermod -aG nagios www-data
    ```

12. **Change the nagios user password**. Now what needed to be done is that change the password for the nagios user.

```
sudo passwd nagios
```

13. **Check nagios is installed**. Move to /usr/local/ and check if you are able to see the nagios folder created. Because this is the file that is offical nagios file. Run the below command to execute the executable file of the nagios.

```
sudo make install
```

14. **Inspect the nagios file**. You need to go into the file and check. Remember `/usr/local/nagios/bin` is the main nagios file.

15. **Now make the service available**. Run the `sudo make install-daemoninit` and nagios is installed as the service and now the service is running.

16. **Make the Command Mode on**. Run the file `sudo make install-commandmode`.

17. **Make the file available**. Run this command to execute `sudo make install-config`.

18. Run the command, `ls -l /etc/apache2/site-enabled/`, this will ensure that the installation is complete.  After that you need to execute the `sudo make install-webconf`.

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

Once the setup is complete, open browser and look for `http://<ip-address>/nagios`, you'll find the nagios server running.

# Installing Nagios Plugins

- Dependencies for plugins 

```
sudo apt-get install -y automake autotools-dev bc build-esseential dc gawk gettext libmcrypt-dev libnet-snmp-perl libssl-dev snmp
```

- Second you need to install the following dependencies.

```
sudo apt-get install -y automake autotools-dev bc build-essential dc gawk gettext libmcrypt-dev libnet-snmp-perl libssl-dev snmp
```
- Extraction
```
tar zxf nagios-plugins<filename>
cd nagios<filename>
ls
```

- The location for the nagios plugin folder `/usr/local/nagios/libexec/`, remember that there should be no files within the folder.

- Start `sudo ./configure`.

- Next `sudo make`.

- Now `sudo make install`.

After the installation of the check the files within the libexec folder and verify. After that you can go and start looking at the **services** and check all the services will turn *green*.

# Encryption

Encryption of folder can be performed using the following cmd. There will be U in front of file names showing that they are unencrypted.

```
cipher /e one\oneone 
```

After you execute the cmd, the folder will turn *green*. But the content inside the oneone\ will not be encrypted. In order to encrypt the files and folder within you need to do a recursice encryption. 

```
cipher /e /s:two
```

The above cmd will encrypt the folder *two* recursively. This is the cmd line version. 



