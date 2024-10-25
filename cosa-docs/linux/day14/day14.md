# Load Balancing

We are going to install two server on which we are going to implement a load balancing between the two server, see [day13](../day13/day13.md) where discussed the concept of **load Balancing**. You need to check if the HA proxy is isntalled or not, use the following command.
```
sudo rpm -q haproxy
```

If not, then you need to install the **haproxy** on first server and similarly there needs to installed on another server also.
```
sudo yum install haproxy
```

Now you need to configure teh haproxy configuration directory, and fiund haproxy.cng configuration file.

```
sudo /etc/hasproxy
sudo vim haproxy.cng
```

Now you'll witness lots of information
1. *frontend main*:and you need to bind it to the port number 8080, on **line number 67**. Remove the lines and let the *default backend*, don't change anything.
2. Then you need to change the dummy server and you need to change the IP address of the machines you've configured.

After configuring with the status **check** you need to restart the haproxy server and check the status of the server.
```
sudo systemctl restart the haproxy
```

# FTP

In order to install and inplement the FTP we use the daemon is called **vsftpd**, it used to communicate with the server. In order to work, there needs to be client-server architecture. On different Operating system, there client server should be available, for Windows, MacOS, Linux, and for Android, there are different client server available and therefore, it is literally a piece of cake. If something goes bad, you need to troubleshoot it. The issues in the server are very rare.

*So how do you troubleshoot things?* Id order to work in such environment, you first need to consider what the problem might be, it could be problem of client, there are certain conf mistaken, it could be server problem, and next there could be network problem.

- **Check if they belong in Same Network** - You need to use the `ping` command, check if the server is same.
- **Two ports**, port number 21 is used to send the command control, meaning that when you'll hit the command, it will control what commands are being communicated, but what is getting communicated is done using the port 20, it control the data between the client and server. 

FTP is used in two ways, they were **active** and **passive**. This wil dicide what should be used.

- **Active FTP**, It was traditionally used, client connect on port numbers above 1024.
  - A **Control Command Channel** is created that is communicated using 21 on the server, then on client there is an ephemeral
  - **Data Transfer** is another process created to communicate teh data, security was not that important, but becuase it (FTP client) is choosing the random ports. the request is innitited by the client and the server is then opening the data connection, but instead the server might open the connection, but the client

# How to Configure FTP on server

Initially you need to check if the FTP daemon is installed. so you need to 

```
sudo yum install vsftpd
```

Now you need to create a user, this and assign a password to it. Then you need to create a **chroot_list**, it will get created inside the /etc/vsftpd/chroot_list, if it doesn't exist, you need to be able to create the file. But **sudo vim /etc/vsftpd/vsftpd.conf** is where you need to do the service configuration.

```
sudo vim /etc/vsftpd/vsftpd.conf
```

Now you need to add certain configurations as given below:

```
# configure the vsftpd.conf
> sudo vim /etc/vsftpd/vsftpd.conf

# on line 12 make sure that anonymous setting is NO
> anonymous_enable=NO

# line 83,84: uncomment ( allow ascii mode )
ascii_upload_enable=YES
ascii_download_enable=YES

# line 101,102: uncomment ( enable chroot )
chroot_local_user=YES
chroot_list_enable=YES

# line 104: uncomment ( chroot list file )
chroot_list_file=/etc/vsftpd/chroot_list

# line 110: uncomment
ls_recurse_enable=YES

# line 115: change (if listening IPv4 only)
# if listening IPv4 and IPv6 both, specify [NO]
listen=YES

# line 124: change (if listening IPv6 only)
# if listening IPv4 and IPv6 both, specify [YES]
listen_ipv6=NO

# add to the end
# specify root directory (if don't specify, users' home directory become FTP home directory)
local_root=public_html

# use local time
use_localtime=YES

# turn off for seccomp filter (if cannot login, add this line)
seccomp_sandbox=NO

# fix PASV ports to allow FTP access with PASV
pasv_enable=YES

# this will enable the server to allocate an ephemeral port for client's data exchange
pasv_min_port=21000
pasv_max_port=21010
```

Now you need to autostart the server using `sudo systemctl start vsftpd`, make sure that you check the *running status*. The last thing you need to do is add the firewall-cmd configurations.

```
sudo firewall-cmd --list-services 
sudo firewall-cmd --add-service=ftp
```

Then finally you need to start the ftp process.

```
ftp localhost
```

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









