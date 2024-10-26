# Samba

When you need to connect using the windows, you need to go for SMB (Samba server), it is not only used for file sharing but it is also used for printer sharing, so this particular functionality is supported for file sharing and resource sharing. It is good for file and other resources.

# How to configure the samba server?

First thing first, lets start installing the **samba**, if needs to be installed using the `sudo yum install samba -y`, it means install the server implicitly. It will start installing all the dependencies. Now you need to create a directory **/smb-share**, we are using it share all the files using the samba server.

```
sudo semanage fcontext --add --type 'samba_share_t' '//smb_share(/.*)?'
```

Whenever you setting you need to restore all context for the same server. You need to create the restoring the file 
```
sudo restorecon -R /smb_share
```

Now you need open the s

```
sudo vim /etc/samba/smb.conf
```
Now her eyouneed to start making changes on the last line, there will be comment, path, writable, and more. **comnent** is used for the administrators and **public** means it is publically avaialable, **browsable** where users can list the files as the users won't be use browser. Here you can set the directory permission.

Now you need to share the services using the following command and therefore you would require a user and you need to put the user inside the smb service.

```
sudo smbpasswd -a user10
```
It is not necessary to make the same password but you need to start the service and apply the firewall configurations.

```
sudo systemctl restart samba
firewall-cmd --add-service=samba --permanent
firewall-cmd --reload
```

This was about the nfs we did something similar and here too we can do something similar, we can mount similarly using the samba server and only that instead of using the **nfs** we will use the **clif** and that is how we can go for the samba server.

# Mail Server

We need to configure three protocol, **smtp** used to configure the email services where are going to use for **postfix**, then we ned to configure **imap** and **pop3** and **devcot** for the imap and pop3.

*Lets see what we need to do in order to configure it on linux server.* **SMTP**, we are using emails that is standard way of sending the data. We have a sender who sends an email, a reciever is the one who will recieve it. It is easy to communicate with each other using email address. 

Mailer program contains the ability to read, write or manage ad deletelthe mail, it is the program. Another is **Mail Server** which is responsible for configuring the services, so a mail server does all the sending, recieving, managing and recording there services, it is where mail services are configured (**imap** or **pop3** but **smtp** is necessary).

Then **SMTP** is the one responsible for transfering the emails from one machine to another machine. 

# Components of Emails

There are three mail componenets.

### MUA 

It is responisible for maintaining the user interface between the client and server.

### MTA (Mail transfer Agent)

Suppoe you are usng the yahoo and you are having a gmail, then MTA is agent that communicates with the email server and threfore mtu is used to capabilities, 

### MDA (Mail Deliver agent)


# SMTP

It is the standard that is used in every communication when its about the having a email server, postfix is just one of implementation of the operating system, it is one of the transaction protocol used for the mail service.

# How to configure the SMTP?

You need to check if postfix is already installed, so you first need to install the postfix.

```
sudo yum install -y postfix
```

Then change your machine name to **server**.

```
sudo vim /etc/hostname
```

Now you need to go configure the postfix file and therefore you need to go to **/etc/postfix/main.cf** and therefore we need to start. Open the file and make few changes.

- Line number 98, you need to change the the entry.
```
myhostname=server.example.com
```
- Line 107
```
mydomain = example.com
```
- Line 123
```
myorigin = $mydomain
```
- Line 138, change the interfaces to all.
```
# inet_interfaces = localhost
inet_interfaces = all
```
- Line 443, where you need to change the mail directory.
```
home_directory = Maildir/
```
- Line 
```
mynetwork = your-ipaddress, 127.0.0.0
```
Then you need to make changes in the services using firewall-cmd.
```
sudo firewall-cmd --add-service=smtp --permanent
```
Now you need to install the nmap, it will tell which services are involved running currently, using the below commands.
```
yums install -y nmap
nmap localhost
```
Here you need to confirm that service is running and if not seen you need to install that. Then install **telnet**.
```
sudo yum install -y telnet
```

Now lets create two users and assign them a password so that we can test them.

```
useradd -c user50 user50
useradd -c user51 user51
echo "user50:test" | chpasswd
echo "user51:test" | chpasswd
```

Now lets use the EHLO localhost, it is used to say communicate with the smtp server and it will list all the components of the server. Now we are going to use three commands, **MAIL**, **RPCT**, and **DATA**
```
MAIL from:user50@example.com
RPCT to:user51@example.com
DATA
```

When you'll do DATA, and you'll be able to type your data as much as you can, if you need to stop, you need to stop using a `.` (dot), and in order to quit, you need use *Ctrl + ]* and then come out of shell.

Now login in to the user and you'll witness a **Maildir** directory, inside which there will be the **new** directory that will contain all the mails send to the user, you'll find a **.server** file that will have the real content of the file and therefore you'll find the contents of the messages. This is the proof that how the real smtp is storing all the emails in files. This is practical example how mail servers work.


# Devcot (IMAP/POP3)

Again, first you need to check if the devcot is already installed.

```
sudo yum install devcot -y
```
The first file tha we need touse i the **/etc/devcot/devcot.conf**, and we need to uncomment the following line:
```
protocols = imap pop3 lmtp submission
```
It contains following protocols and depending on what you need to use, the one will start working. Then you need to configure the listen:

```
listen = *, ::
```
Where * means IP address and :: means IPv6. Now the first file that you need to configure is the **/etc/devcot/conf.d/10-auth.conf**, now we need to make certain chagnes within the file.

```
disable_plaintext_auth = yes
auth_machanisms = plain login # add login in front of the plain.
```

Now you need to configure the **/etc/devcot/conf.d/10-mail.conf** file and you need to go to the line 24.

```
mail_location = maildir:~/Maildir
```

Another file that needs to be configured is **/etc/devcot/conf.d/10.master.conf**, 

Lastly you need to make firewall settings using the below configuration.

```
firewall-cmd --add-service=icmp --permanent
```

# Mail Client

For creating a mail client you first need to check if your client have **mailx**.



