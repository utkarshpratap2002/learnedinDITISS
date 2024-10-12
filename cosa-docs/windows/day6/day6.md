# DHCP

DHCP uses 67 for server and 68 for client along with DORA process, through which it gets the IP addresses assigned. Manual Assignment of IPs is impossible and we need to configure the network such that we don't make mistakes.

1. **Avoid Mistakes**
  - *What is DORA process?* We give IPs to the DNS. We have to provide static IP addresses and threfore you decide what IPs are to put in DHCP server. 
    - **Discover** Packet - It will first check for the available DHCP server and client will send the broadcast MAC address to the DHCP server with src of it own, thus, remember that in this case src IP will be 0.0.0.0 becuase machine still don't have the IP so here **Transport layer** will work and transport layer will open the port number 67 which will identify the server at the same time.
    - **Offer** Packet - After Discover, there will be an Offer made to the client with IP address and again from DHCP server will broadcast to the client with FFFF. But DHCP has static IP so the src IP will be of the DHCP server and MAC address will be of DHCP server.
    - **Request** Packet - The **Request** client will either accept the offer or it'll demand another IP. If the requested IP is not same as expected, it will send the request for the previous IP and if IP is not available, DHCP will again send the offer of the 
    - **Acknowlegdment** Packet - Now again there will be a broadcast for the acknowledgment with the same IP and DHCP will remove the entry of the IP that is assigned.  

# Wireshark Analysis

#### Ethernet II 

#### Internet Protocol (Network Layer)

#### Transport Layer (TCP/UDP)

#### Bootstrap Protocol

Recognise that what IPs are getting from one place to another, every machine is given IP

---

In case of the 80% of time is completed, when client doesn't recieve any information after the 50% of time, client will send the request to get the IP address that is desired, then it given another IP to the client. Remember you can go to the Virtual machine and change the *NAT* to *Host-only*.


# How to configure the DHCP?

Make sure that when you are DHCP requires any Active Directory, the right answers is no. DHCP can be installed standalone. 
1. **Add a new role**
2. **Add feature of DHCP**
3. Next, you install the DHCP.
4. Then, you'll get *Complete DHCP configuration* to grant the DHCP administrator, remember limited adminitration, and you can that user in the domain.

Now you need to configure what IPs can be assigned to the users, for that:

1. **Go to Tools and Add Scope**
  - DHCP services are started if you see the *Green tick* mark
  - Now *right-click* and select **New**.

2. You need to give the names, meaing you will assign the start IP address and end IP server, remember that you need to give the right subnet mask, along with that there can be exclusion of the IP addresses.

3. What is the default timer of the DHCP? Its 8 days, but you cna increase and decrease the number of days.

4. Now there are DHCP options, therefore you need to provide an address for that. 

5. Now start adding the IP addresses, and remember that if the client couldn't reach out till the DNS, therefore you need to provide the **two DNS**. 

#### `ipconfig /renew`

You can now use `ipconfig /all` where you can see after checking **Wireshark**, it would have the same IP address for the same client. If you need to release the IP address you can use `ipconfig /release`, then you'll see that it has taken the APIPA, out of 169.254.0.0 address series. Thus, if you need to renew the IP address, use `ipconfig /renew` to configure the new IP address from the DHCP.

# Reservation
When you need to provide the fix IP to a particular machine, then you can do that by going to the Reservation inside the IPv4, on which you configured the DHCP address.

Because thre will be lots of reservation within a domain, so you need to keep the backup of the reservations. 

There is temporary database with the file name `tmp.dbd`, you can also check the log file of the following. 

# Multiple Scope in DHCP 

![alt text](multiple-scope.png)

# Windows Deployment Service

It allows the administrators to install windows operating system on the network client over network without requiring DVD. The service was earlier know as Remote Installation servivce (RIS) in server2003.

Before you install the WDS, there are few prerequisite for the installation:

- There should be an Active Directory domain (The server may be DC/ADC/Member).
- Working DNS server
- Working DHCP service
- One NTFS partition
- PXE boot compliant client. This allows the sytem to boot all over the network.
- Then it requires 2 types of images. 
  - Boot Image - This file contains basic windows required to boot the remote client. This image is specific for 32 bit and 64 bit computer. Single boot image is sufficient to boot all the system over the network.
  - Install Image - The image contains the specifc windows version installation. This image is different for diffeerent windows edition. This image is used by remote clients to install windows OS.

Both the images are provided by the Microsoft on window OS DVD. THe DVD has folder names 

# The Process of WDS

- First you need to prepare the boot image and isntall image of requires window OS.
- Then Start client computer, make sure the boot from network option is enabled and added to boot sequence.
- the PXE boot starts, it will start DHCP client. It will send the DHCP Discover packet.
- DHCP server congigured with WDS will provide and IP address to the client.
- Client get the IP address. But alog with it the DHCP server procide the IP of next serve whi is the IP address of WDS server.
- The client send a request for the boot image on this next server IP address.
- Upon recieving this reques the WDSserver procides the **boot.win** file to the client.
- Client odownload s this file and executes it to boot the basic windows OS. This also loads basic drivers for keyboard, mouse, display and network card.
- The program in boot image then contacts WDS server and requests install image.
- WDS will p
12. Based on the selected install image the wdds server will provife the install.wim file for download.
13. Client will download the install.win file and start wndows OS installation. 

# How to Configure it?

1. **Add feature**
    - Add the WDS feature in the open list of services.
    - Then in Role Service click both Deployment and Transport service, it basically helps in laod balancing.
    - And then install.

2. **Configure the Server**
    - Then you need to go to the Tools, then Window Deployment Service, then configure the server.
    - Then you need to choose from **Integrated Active Directory**.

3. **Add Image Wizrd**

3. **Keep DHCP and WDS on same Server**
    - It will make sure that WDS and DHCP are able to listen to each other.

4. **Respond to accounts**
    - This is made for the reponding on known and unknown computers. This is for the fact when **adminsitrators** approval is required for installation of any file



# Home Work

1. How do you see the ipv6 address in windows?

