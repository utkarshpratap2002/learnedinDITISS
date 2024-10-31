# Configuring Load Balancing

We are going to install two server on which we are going to implement a load balancing between the two server, see [Load Balancing](../day13/day13.md#load-balancing) where discussed the concept of **load Balancing**. You need to check if the HA proxy is isntalled or not, use the following command.
```
sudo rpm -q haproxy
```

If not, then you need to install the **haproxy** on a server and we need two servers that are running the web service [Apache server](../day13/day13.md#apache) hosting websites. You must have the IP address of both the servers. *So, first thing first*, we need to install the haproxy on the server.
```
sudo yum install haproxy
```

Now you need to configure the haproxy configuration directory, and edit the haproxy.cfg configuration file and make the changes inside **frontend main** and **backend app**.

```
sudo /etc/hasproxy
sudo vim haproxy.cfg
```


- **`frontend main`**: This handles the frontend of haproxy, it tells which port the haproxy is listening on, it should have a consistent port number to that of the web servers that are going to send the responses to the haproxy. If the backend servers are listening on port same as haproxy, then only the haproxy would be able to forward the traffic. 
- **`backend app`**: This contains the backend server definations, you need to enter your backend server IP address on which the [Apache](../day13/day13.md#apache) service is running, along with the port number they are listening on.

After configuring check the status and then start/restart the haproxy server and check the status of the server. 
```
sudo systemctl restart the haproxy
```

Now you need to curl on the server (haproxy server) itself, you'll get the load getting balanced on both the server having apache service running. 

# FTP

In order to install and inplement the FTP we use the daemon is called **vsftpd**, it used to communicate with the server. In order to work, there needs to be client-server architecture. On different Operating system, there client server should be available, for Windows, MacOS, Linux, and for Android, there are different client server available and therefore, it is literally a piece of cake. If something goes bad, you need to troubleshoot it. The issues in the server are very rare.

*So how do you troubleshoot things?* Id order to work in such environment, you first need to consider what the problem might be, it could be problem of client, there are certain conf mistaken, it could be server problem, and next there could be network problem.

- **Check if they belong in Same Network** - You need to use the `ping` command, check if the server is same.
- **Two ports**, port number 21 is used to send the command control, meaning that when you'll hit the command, it will control what commands are being communicated, but what is getting communicated is done using the port 20, it control the data between the client and server. 

# FTP's Active and Passive Modes

There are two modes in which FTP works, the difference lies in the fact that which side start or say initiates the data connection. This is seemingly a small distinction but create a real-world impact by the fact that it decides the firewall configurations and Network Address Translation. 

FTP is used in two ways, they were **active** and **passive**. This wil dicide what should be used.

- **Active FTP**, It was traditionally used, client connect on port numbers above 1024.
  - A **Control Command Channel** is created that is communicated using 21 on the server, then on client shares an ephemeral port number that tells server which port it'll listen on for the data.
  - **Data Transfer** is another process created to communicate teh data, security was not that important, but becuase it (FTP client) is choosing the random ports, the request is initited by the client and the server is then opening the data connection, but instead the server opening the connection, the client does it in Active FTP.

- **Passive FTP**, It is not the same as the Active FTP but here too client initiates the connection with the server.
  - A **Control Connection** is initiated by the client to the server on port 21, then client request the server to assign a high port (above 1024) for the data connection, server then opens the listening port and communicates the IP address and port number with the client.

Passive FTP is generally preferred for most situations because it's much more compatible with firewalls and NAT, which are common in today's networks. Active FTP can be useful in specific scenarios where the server is behind a firewall and cannot accept incoming connections, but the client has a more permissive firewall configuration, but this is less common. 
   
# How to configure FTP 

First you need to check the vsftpd service running on the server, if not, install the vsftpd daemon using `yum install vsftpd` and progress by creating few users such that you can test whether it is working or not. 

Once the vsftpd daemon is installed, you need to start configuring the configuration file of the vsftpd. First thing first, create the **chroot_list** that will contain the list of users that are allowed on the ftp server. 

```
vim /etc/vsftpd/chroot_list
```

Then configure the **vsftpd.conf** file by adding the below entries to the file:

The image shows a portion of a configuration file (likely `/etc/vsftpd/vsftpd.conf`) for the vsftpd FTP server.  It's a configuration file, not a general system configuration file.

The lines you've shown configure various aspects of the FTP service. Let's break down the example entries:

* **`pam_service_name=vsftpd`:**  This configures the Pluggable Authentication Modules (PAM) to use for handling vsftpd authentication.  This determines the specific authentication method and rules for the FTP server.

* **`userlist_enable=YES`:** This enables a user list for authentication.  This is a way to restrict access to the FTP server based on a defined list of users.

* **`use_localtime=YES`:**  Configures the FTP server to use the local time zone.

* **`chroot_local_user=YES`:**  This is a security feature.  It confines users to their home directory, preventing access to other parts of the system.  Crucial for security.

* **`chroot_list_enable=YES`:**  In conjunction with `chroot_local_user=YES`, this defines a list of users that should *not* be confined.  Essentially, this allows some users to access parts of the filesystem outside of their home directory, and thus often contains a list of trusted or administrative users.

Refer to the [chroot](../concepts/chroot.md) to understand the concept behind the chroot and why it is important to create a user authorization for accessing the files and folder that exist beyond the users home directory, and also refer to [ftp server](../concepts/ftp.md) that explore the crucial concept of user authentication in ftp.

* **Security:** The `chroot` options are critical for security.  Improper configuration can lead to security vulnerabilities.  It's very important to manage the `chroot_list` appropriately to only allow users that should not be restricted.
* **File Permissions:**  Make sure the `/etc/vsftpd/` directory and the files within it have appropriate permissions to prevent unauthorized access.
* **Restart vsftpd:** After making changes to `/etc/vsftpd/vsftpd.conf`, you will need to restart the vsftpd service (`sudo systemctl restart vsftpd`) for the changes to take effect.

These changes are FTP-specific configuration settings. They are not general system configuration changes.  Don't confuse these parameters with broader Linux system settings like hostnames or firewall rules. Remember the security implications and review your configuration carefully.


# NFS (Network File System)

It is similar concept such as iCloud, and Google Drive. Now there are certain commands, simple commands for it.

```
sudo mount serverA:/home /home
```

This is the same **mount** command that will do the job, mounting the remote directory to the local directory.

### The beauty of NFS

Every Linux Administrator usually would mount the **/home** directory over the client machine, it will be easy for recover the directory and will save the data, even if the data is lost, because the directory was mounted it wasn't actually there. 

In order to do this, you need **rpc**, it is Remote Procedure Calls, it takes care of the communication between the server and clients. NFS uses RPC, thus, **RPC** needs to be installed in order to work.

# How to configure it?

First you need to install the hostname of the server machine as server.

```
sudo vim /etc/hostname
sudo reboot now
```

This is becuase you will be working with different machine at the same time, so you need to know. Set the name of the server machinees as server and clients as client.

First you need to install the **nfs-utils** in both the machines.

```
rpm -q nfs-utils
```

Then, create a new directory to share it with the client, so that we can share the directory and move inside the directory and create few files..

```
sudo mkdir /nfs_share
sudo touch /nfs_share/file{1..100}.txt
``` 

Now you need to edit a **/etc/exports** file and add the following fields with the following directory.

```
# part1: directory used to share the files
# part2: network address
# part3: permissions 
/nfs_share 172.16.164.131/24(rw,no_root_squash)
```

This is similar to the mount in the fstab.
```
sudo exportfs -a
```

Now you need to enable the server using the systectl command.

```
sudo systemctl start nfs-server
sudo systemctl status nfs-server
```

Now you need to check if you can see the mounting that localhost is carrying.
```
reva@localhost:~$ showmount -e localhost
Export list for localhost:
/nfs_share 172.16.164.131/24
```

Now this can't be accesed if there is firewall-cmd is working and then reload the server.

```
reva@localhost:~$ sudo firewall-cmd --add-service=nfs --permanent
sudo firewall-cmd --add-service=rpc-bind --permanent
sudo firewall-cmd --add-service=mountd --permanent
```

Now you need to mount the file to the client file.

```
sudo mount -t nfs 172.16.164.131:/nfs_share /client_nfs_share
```

# Samba









