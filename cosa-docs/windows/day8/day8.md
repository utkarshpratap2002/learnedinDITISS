# DNS

Remember that ADC is backup of the Database of the AD, not the whole computer and hard disks. It is also Read/write, any operations and files can be written and copied, and updates can be made.

When you are making the secondardy zone, you need to make sure that secondardy knows where is primary zone and therefore secondary zone should be able to recognise that which is primary zone. If the Primary zone doesn't allow the copy to all the domain controller or to which specified domain the copy should be allowed, then also ther while creating a secondary zone should be able to copy if primary is ready to replicate to secondary and secondary should be knowing who is primary, and from whom to copy.

# DHCP 

If you giving a range of IPs, make sure that any of that IPs are not given in the range, and also make sure that any of the IPs will not get conflict wil the IP addresses of the server, you need to make sure that there isn't any conflict with the servers and clients IP addresses.

If you want to assign an IP of the different network, then you need to make sure that you have a router that is able to communicate with the two different networks. Then you can assign new network and they can be communicated.

# WDS

First you need to make sure that system is bootable and is empty and therefore the system is able to find the DHCP, because before that you need to remember that the machine won't be having the IP address for itself, so it needs to get it first.

# IIS (Internet Information Service)

It has Web Server and FTP server. Remember that by default FTP is not installed, if you need, then you can do that manually. By default, when you install web server, a default website is installed with the service (uses TCP port number 80) and **C:/inetpub** directory is created called **wwwroot**.

Basically IIS works on the application layer and when it request the Transport layer the port number 80, then then when any request is initiated the transport layer transfers it to the IIS, thus this forms a **Socket** server and client relationship. But when you try hosting second website for hosting the website, it won't start the service, becuae the first website already has taken teh port number 80, this is called **binding**, therefore you need to provide the port number if you are hosting another website.

Now what is problem, it that when it comes to multiple website, there is a problem with multiple websites there are multiple port numbers to be mapped with the  websites, so this is quite impossible to do that to remember port number for the websites. Therefore we leave it upto the IIS, that is, for all the websites there is only one port number assigned and when request comes, it is mapped with the domain of the website and identification is made using the domain of the website.


# How to configure it?

1. First you need to install the IIS Service.

2. Then go to the web server and search your Server IP address and then you can got to C: dirve an check that you'll get a **inetpub** folder on the drive. Now you can go and create another html file and when you'll go onto the server, you'll find your file created in html displaying its content.

3. Then go to the IIS Manager inside your utility. 

4. Expand your server name and then expand **Sites** and create a new website, using *Right-click* and **Add New Website**.

5. A window will open up, then provide a *Site Name* for the webste, and parallely you can see the HR website created.

6. Then finalise your Website, but yet the website is not started yet, then you need to go to **Edit Bindings** and then edit the sier binding to designnated port number.

7. Now you need to start the binding using the **Start**.

8. Go to the browsser and type the IP address along with the PORT number, thus now it recognises the webite you've created.

Go to the default documents and you;ll find the list of inherited files which are recognise by the browser first, and therefore you need to make an entry of the sales.html file in the Dfefault Documents and you can see the html file in the browser.