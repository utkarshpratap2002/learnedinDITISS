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

Mail server is the server within the domain that has SMTP service running that is handling the transfer and receiving of emails. SMTP is a **Simple Mail Transfer Protocol** that is used to send mails over the internet, primarily it is used to send the mails over the servers and across the servers. Refer to [SMTP](../zone-of-darkness/smtp.md) in order to learn more about the mail servers and how mail services are carried out. But we will go into looking the overview here.

Basically the job of SMTP includes:

- **Building Connection** - On a client side, the *Email Client* initiates a connection with the SMTP server for the transfer of email messages.
- **Email Submisssion** - The sender then sends the emails address of the recipent and sender along with the content of the email.
- **Processing** - This is where the SMTP after getting the sender and recipients email address decides which domain or mail server it needs to send the email by checking if the domain of recipent belong to different domain, in that case it identifies the mail server of the recipent's email address. Here you can refer to  [smtp](../zone-of-darkness/smtp.md) to learn how it works.
- **Email relays** - SMTP uses the postfix for the efficient delivery of the emails to its recipients mail server, it takes care of how the email message is delivered to the recipients inbox.

**Postfix** is protocol that is implemented in order to make sure the delivery of the recipent email, **postfix** acts as a potential relay between the servers while transfering the email message.

Lets see how the Postfix works. Postfix has its role and set of procesdure that it follows to make sure the email is received on the destined mail server.

- **Email Submission** - The email client first inititates a connection with the SMTP server typically through (MUA, Mail User Agent), thus identifying itself to the server.
- **Processing** - Posfix then checks for the recipients email address and try to identifies the domain it belongs to, if the domain is same, postifix transfers it to MDA (Mail Delivery Agent) to transfer the email to desired inbox of the recipents inbox. But if it is not, it look in to DNS for the recipients domain name for the identification of mail server, for that it goes with multiple DNS queries to find out the desired mail server. Once it finds out the mail server it forwards it to the destined mail server, thus acting as a relay communicating across the servers.
- **Managing Failures** - Failures are managed if any of the process of inspection or check for the discovery of the mail server fails, refer to [smtp](../zone-of-darkness/smtp.md), it queues the email message to retry it later on the SMTP Queue.

*Lets see what we need to do in order to configure it on linux server.* **SMTP**, we are using emails that is standard way of sending the data. We have a sender who sends an email, a reciever is the one who will recieve it. It is easy to communicate with each other using email address. 

Mailer program contains the ability to read, write or manage ad deletelthe mail, it is the program. Another is **Mail Server** which is responsible for configuring the services, so a mail server does all the sending, recieving, managing and recording there services, it is where mail services are configured (**imap** or **pop3** but **smtp** is necessary).

Then **SMTP** is the one responsible for transfering the emails from one machine to another machine. 

# Components of Emails

There are three mail componenets. As we talked about the [Mail Server](#mail-server), we saw different terminologies on how these things work in mail server and email transfer within and across the servers. So we further re-collect on the them by saying that there are three components of Email Communication.

### MUA (Mail User Agent)

It is responisible for maintaining the user interface between the client and server. Itis where the user is able to manage there mails reading, creation, deletion, and other such tasks. It also provide basic formatting of the email message in HTML and plain text options.

Further, we talked about connection establishment where MUA is the only one that initiates the connection with the SMTP server that allows the SMTP server to recognise the client. Moreover, MUA is responsible for retriving the mails from the SMTP server using POP3 and IMAP to download the mails to the local drive. MUA sends the information such as senders and recipients addresses, message body, and subject line to the SMTP server using command `MAIL FROM`, `RCPT TO`, and `DATA`.

The MUA acts as the front-end application that interacts directly with users while relying on back-end systems like Mail Transfer Agents (MTAs) for sending messages and Mail Delivery Agents (MDAs) for storing received messages.

### MTA (Mail transfer Agent)

MTA is responsible for the efficient and secure trasfer of the mail from one server to another, postfix is one the Mail Tranfer Agent that works to send you mail to the destined recipients mail server. Thus, if the email domain of the recipient is the same as that of the senders, it is traferable within the local domain, but if the domain is differnt, **postfix** is responsible for making the transfer. 

It includes the various roles in the Email comm, it first establishes the connection, then checks for the recipients email address and resolves the mail server for the recipient domain, refer to  [smtp](../zone-of-darkness/smtp.md), postfix communicates multiple MTAs in order to resolve the desired mail server for the recipients domain, once found it acts as a relay to communicate between the servers. It also maintains the Failure Queue, that contains all the mail that either failed or couldn't get resolved due to downtime of the mailserver.

### MDA (Mail Delivery agent)

The main job of MDA is like a *Email Reception* where MDA receives the email sent by the MTA to the designated mail server or say recipients domain. MDAs job is to manage the storage for the emails, make sure they are sorted, stored, and accessible easily within the file system.

Not only MDA receives the emails from the MTA, but it also handles the emails such that the MUA is able to communicate with the MDA, as users should be able to make the changes in emails they recieve on the interface, so MDA also interacts with the interface of MUA. 

MDA is like a final delivery point for the emails as it acts at the communicator between the MTA and MUA for the final delivery of the email message on the recipients domain.

# SMTP

Till the point where we are, we already know about Mail Server, then what are the components that are used within the email communication (i.e., MUA, MTA, and MDA). Though the bigger picture is that mail server is implemented using **SMTP**, which is basically used for trasfer of the email to the recipients domain, but how the complete delivery happens is taken care by either POP3 or IMAP. SMTP, POP3, and IMAP are the Protocols that are used to make the email transfer, SMTP is implemeted on **inbound**, meaning where the emails are send to the recipients domain, then how emails are to be accessed is looked by POP3 or IMAP.

SMTP is the standard that is implemented using **postfix**, it is one of the transaction protocol used for the mail service and you can refer to [Mail Server](#mail-server) to understand in more detials. Though the bigger picture of SMTP can be described to be one that handles the senders request to the client, acting like a push operation. Lets see how SMTP make sure the domain discovery of the recipients domain and successful resolution of the recipients mail server.

- First the email client is suppose to make a connection with the SMTP server.
- Next, the client will send the command `SEND FROM`, `RCPT TO`, and `DATA` to the server to send the senders and recipients address.
- Next, the SMTP server will resolve the mail server of the recipients domain, and thus, look for the DNS query if necessary.
- If the email transfer fails, the smtp server will store the message in the queue in order to make the delivery later.

# POP3 and IMAP

POP3 is protocol that works as retrieval of email messages from the mail server to the users local drive. POP3 make the emails message available for the download onto the users local mahine and hence, we can say that POP3/IMAP works as a pull operation. Lets see it in more details.

- The client will make connection with the POP3 server or IMAP server
- Then the server make start downloading the emails onto the local drive of the user.
- Once done with the downloading, POP3 will remove all the emails from the mail server, ensuring that emails are only available on the users local drive.

The major difference between the POP3 server and IMAP server is that IMAP is much more powerful and provide better features, IMAP doesn't necessarily download the emails to the local device, instead it allows you to access the through the server, as you can access them, manage them, perform operations, and even delete them accordingly. As the emails are accessible from any device, its feature is to maintain the synchronization accross the multiple device.

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



