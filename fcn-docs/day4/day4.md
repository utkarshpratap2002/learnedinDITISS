### Port

Port ranges from **1 - 65535**. When you type a webiste link, https://google.com, there is file transfer from the google takes place, the packaging of data from the google sends it on a particular port. 

- You can't use 1-1024 ports as they are not used, they are well know ports.
- After 4096-65535 are the ports that can be used by programmers, as they can be used *randomly* for any process.

Remember that when google sends data it packs the port number in segment, the required port for the required process that was requested. Thus, this is how the Segment is, its a standard. Just like a Packet is composed of SRC and DEST, segment is composed of Segment number (given by machine) and port number, which is given by the server.

**Analogy**: Imagine that there are 65535 doors to come inside the machine, if there is any door open any request through the same port can get into the machine as these ports can become a medium to get inside the system. When you talk about defender (Windows Firewall), what it does is that it closes all the ports that are open randomly, but once you start a process yourself, it can cause the app to run and occupy the ports, this 

- **TSR (Teminate State Resident)**, it keep the ports open for those necessary ports that are needed to be open, suppose any cloud application that has to store contineous memory.

- Your Window defender might not be able to protect your system, because what attacker does is that they start looking for every port that is open and *eventually they get one*. The **anitvirus softwares** are not ones that checks *what is getting in from which port* and it doesn't check any ports that are being used for what process. So in order to remain unaffect you need to gaurd your 65535 ports, you need to block them by default, only those ports are allowed to open which are to be used by the company's software, that is called **Coperate Firewalls**, say *Sunbeam Firewall, Honeywell Firewall*.

- Data link layer contains the **options** that identifies that process is to be run and what kind of data it contains. Now network layer is the one that identifies the protocol that is **Protocol Number**, whehter is TCP segment or it is UDP segment, so it tell this for the segment layer, after segment layer carries the packet that further tell teh segment tthat what port is to be used. 

- It goes something like this, **Frame(contains the data type)** -> **Packets(contains the protocol type)** -> **Segments(containes the port number)** ->  **process**.

- When talking about segemnts, there is a **session id** that capture the multiple instances of the same application, it might seem as it is not important but it plays a role while the data gets decapsulated on the destination. Remember that for different application, there is **Port Number** and for diffrent instances of the same application there is **Session ID**.

- Data link layer has double reposibility because it has to deal with Physical layer as well as to Network Layer. So Data link layer interacts with Physical layer using **MAC (Media Access Control)** ensuring that data gets through the physical medium such as Ethernet, etc., and the data link layer has **LLC (Logical Link Control)** that gives the flexibility to understand the protocols being used on the higher end in the OSI modal, i.e., Network layer protocols.


### Cabling

One is Coaxial Cables and another is UTP/STP cables. For networking IEEE has defined some standards,

- First there is coaxial cables, one is called **Thinnet coaxial**, another is **thicknet coaxial**
- IEEE considered Thinnet Coaxial cables as the standard, as it has carriage level of 110V over 185meters, but another was Thicknet coaxial cables had bigger coating as it was 10 base 5, could be extended to 500 meters
- UTP/STP cables have different standards **cat1** and **cat2** and later **cat3** and **cat4**, as these were having 10 Base T, next is **cat5** referrred as 100 Base Tx (meaning twisted pairs with switching), could travel upto 100 meters.
- Later came **cat6** and **cat7**
- Another was twist per inch happers the communication. 
- Later **cat7** that referred as 1000 Base T.

<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<i>Ever wondered about the Fibre-optic Tech? </i> It has distance limitation of 40km. But there's more to it. As fibre-optic cables uses more advance techniques such as <b>advance modulation</b>, <b>repeater</b>, <b>optical amplifiers</b> and what not to extend the distance beyond the 40kms.
</div>
<br> 

*Differences between UTP and STP?* An STP is same as UTP cable if it not grounded. If not grounded, it could cause a lot of potential to generate at the top of circumference of the cable and that is why it grounded so that any potential at the jack pannel could be prevented from getting high voltage on the cables outer surface.

- There are two kind of cables, one is straight and another is cross cables, these cables workin in diffreent paradigm , as differ in fact that cross cables are able to manage to cross the transmit and recieve channels.
- As when we are connecting the devices configure with IP address, like Routers and hosts, are need to be attached to Cross cables and when providing connectivity within the network, they are to be connected to straight cables.
- *What is uplink ports?* The ports that are used to provide conection to the upper devices as these ports are presents only on manageable switches. They are always located seperately always mentioned with speeds. 
- Though we do have mentioned the straight cables and cross cables, but in market it is called **Color coding**.
- Other than straight and cross cables, there **rolled cables**, this cable are connected to direct the networking devices such as routers switches, VPN boxes etc., also called console cables because they are connected at console. It uses **Putty**, a software that gives control over the routers and all the cmds are given to the routers and router sends back the response. Basically, through **Putty** you are able to get a command line interface for the configuration of networking devices.

Remember that when connecting with console cable, you need to see that which **comm** you are connected to. If you don't see the right comm on the CLI, probably you need to go to the Device Manager and check for the right comm you are connected to.

### DOD

It uses TCP/IP, which doesn't have any functinality of Operating system, it only commuincates based on the protocols, but later ISO standards took it and enhanced it, such that it can be used more efficiently. 

In **DOD**, there are only 4 layers basically. 

- **Application/Processes**, which included all the services running on machine, such as *https, https, ftp, Telnet, SSH, DNS, and DHCP*
- **Host-to-Host Connection**, which was the implementation of TCP/UDP, ensuring the reliable connection. Refer to [day 2](../day2/day2.md) article to learn more about how TCP/UDP works in the whole scenario of **ping**.
- **Internet**, as on this layer there were protocols similar to that used on L3 devices, one example is **Routers**. Protocols used are ARP, RARP, ICMP, IP etc.
- **Physical/Network Access**, this is where the error detection and connection with the physical medium use to take place.

### HTTP/HTTPS

Hyper text transfer protocol became so efficient that now using a HTML format you can send data to other device, such that there is HTTPS, meaning Hyper text transfer protocol Secure, that your data will be encrypted as ther are another kind of services running through HTTP. HTTP uses port number 80 and HTTPS uses port number as 443.

### FTP/TFTP

File Tranfer Protocol, and Trivial File Transfer Protocol, FTP uses TCP and TFTP uses UDP. FTP is slow as it uses TCP and TFTP uses UDP and FTP is also useful for sharing data as it supports the **Directory Browsing**, but there is no Directory browsing.

Remember that FTP has authentication and there is no authentication in the TFTP, it is not about being fast but it is about the simplicity.

### SMTP, POP3, and IMAP

SMTP (Simple Mail Transfer protocol) is always going to be a **Push** kind of protocol and POP3 is always going to be a **Pull** kind of protocol. Because these SMTP and POP3 protocols are very bulky protocols as there programming is huge, and becuase there bulky nature, it was hard to put their facility to the smartphones, so there came **IMAP**. 

**IMAP (internet Message Access Protocol)** had the functinality of both, as it can push and pull. Because nobady needs to download anything as everyone is connected, so there is need to be a much faster protocol, IMAP.

### LPD (Line Printer Demon)

It is to send print jobs to the printer, already connected to the network.

### Telnet

TIll now we saw one classical paradigm of configuring a router, as through **Putty**, but say a router connected to the network and on PC you can configure routers using Telnet and you can do it remotely, you can specify the IP and can get directly to the routers. This happens on Command Line Interface, while travelling across. 

### SNMP

- SNMP (Simple network management protocol) has SNMP server and agent.
- SNMP can be used to configure the server as it has traps and alerts. Suppose a link inutilzed 100% for 5 minutes, you can tell ther servers to shitdown the system. These traps badically triggers the SNMP, and you can do this by configuring the settings, when to trigger and where to stop on SNMP server. 
- Configuration fo SNMP is very critical and only experts are able to do it.
- Also called NSM, Network management Software.

### X-Windows, RPC

Everywhere X-Windows and RPC (Remote Procedure Control), where X-Window is used to see the GUI of the remote server and RPC is uesd to control the GUI of the remote machine.

### DNS

DNS uses UDP/TCP, as its main job is to resolve the FQDN into IP, i.e., fully qualified domain name, in cooperate offices, there is one DNS server that has list of entries that looks for the required or requested server. The destination IP address is understood after resolving the FDQN.

Thus the Name to IP is done by DNS and then IP to MAC address is resolved using ARP. 

### DHCP

Basically the DHCP server leases the IP address to the host, and the moment the 50% of time of the lease times overs there is another request sent to the DHCP server and it checked whether the leases IP address is renewed or not, DHCP will have that IP and it can use it somewhere else. 

Remember it is only after 50% of time is over, the the given IP address is suppose to re-new itself. If in any case the Machine is switched off then machine if switched on again, DHCP will allocate the same address if it is not given to another machine.

|What DHCP Provide you?        |
|-----------------|
| IP               |
| Subnet Mask  |
| Default Gateway |
| DNS1 |
| DNS2 |

*How DHCP make a role in our Life?* When you are connected to the internet, DHCP assigns you an IP address. Nowadays, DHCP is on Routers, Switches and everywhere else, not only on the Machines. 


### Fixed Lenght Subnet Mask V/S Variable Lenght Subnet Mask

The **FLSM** means that the whole network has on subnet. As shown below the subnet remains same for all the netowrks that exists, say if there are three network, all the three networks are using a /27 subnet mask, where as **Variable Lenght subnet mask** is the concept of using or changing the subnet mask per network and being able to use different subnet mask per network. In the below exmample we can witness the fact that routers subnet is **/30** and that of the two networks is **/26**, that gives 64 hosts per network.  





