### Why we need Networks?

Talking about the Old **Novel NetWare** system and migration over the Windows. It was about in 1990s, the era of windows. In india there were like 235 locations to migrate over windows. 

* Cisco is failing its market but it started the market of the **Switches** and **Routers**. Cisco are investing in R&D.
* We’ll be learning Cisco Routers Architecture, later Cisco IOS too. 
* Brainbench was one of most confidential organisation, they used to take the exams based on industry specialists and never on internet you’ll find those answers. That’s BrainBench.

Let’s start with why we need networks, we need network so that we can share resources.

* Data, voices, and videos, all of them can be shared on Networks
* ISDN lines, where communication was done using circuit-switched telephone channel, you can send voices, videos, and data but nowadays communication of data is different, because first it gets converted into data, then converted to necessary forms.
* Nowadays we use Fibre-optics and other mediums for that.
* Plans by ISPs are totally shifted to databases, becaue it doen’t matter how much data is being send, now what is being send matters.
* Other use case of networks can be controlling other devices.
* Why do we need networks, Its because we need to share our resources.

*Can you tell how you can share the micropossessors?*  The question has history with it. Let’s see some history.

* These dumb machines were very costly, dumb teminal, it only had monitor, it had output device and input device, terminal. 
* In order to connect it there were PAD, connected through modem, it was called P2P connections.
* Before there were so many Monitors, but nowadays, its like everyone has there own Microprocessors.
* IBM didn’t took the copyright, and we got to see the Intel, SeaGate, other such companies overtaking the market and we got our Personal computes in the market.
* People started affording PCs, becaue it was cheap, as it was too costly to buy it from the IBM. 
* That gave birth to De-centralized computation and that was when compuation power got introduced into the era of 1980s. That was the Third Generation.

As the company started to grow, organisations were increasing and it were needing more resources there was requirement of mangement of data. So, there came next generation. 

* After that there were servers, You only need to update the server, you don’t need to send ther server again and again, after that we got Client-Server Technology. 

After that, Cloud Computing, we know it already. 

* Later we got Hub-and-spoke Architecture, clients that were having problems they were able to connect to the server as the server were accessible across different locations
* Though, hub-and-spoke became the most popular choice for the Cloud Infrastructure.
* Client doesn’t connect directly to the other nodes (or say spokes) in the connection.
* The first level of Cloud Computation, Infrastructure as a service, providing virtual servers, scalalibility and flexiblity to adopt as you grow.
* Suppose a MS-Office, on every new version of the MS-Office, as they were to update it on all their systems, so Microsoft came up with Office 365, a cloud based application, providing SaaS.
* Office 365 represented the shift to cloud, where every application was delivered over the cloud.
* Then after that it was Platform as a Service. Where you get all different types of software and carry on with the job you have. 
* Now there is Communication as a service. 
* Some companies also offers the Security of the cloud. It is Security as a service, it is that before the data requested will travel through a inspection, firewalls, IDP (Intrusion Detection and Prevention), and then it will go to it requested destination.

*The question? Answer to whether we can share the micoprocessors? No we can’t*.

Let’s talk about Networks, there are various types of networks, LAN, HAN, CAN, MAN, WAN, BAN, or VPN. Let’s see some of them.

Typically there are only two kinds of Networks. **LAN** and **WAN**. So what is PAN, which means Personal Area Network, as when you use a device, it comes with its own Area network to be able to connect with devices around it.

There are five Super ISPs, when you need to transfer to data over the long distance, you go and take services from the ISPs, then again have the another ISPs whom with they themselves are taking the service from.

* **Tata** has the 45% if shares that has acquired the teleglobe networks to lay down the optical fibre cables.
* A critical part of global infrastructure is **submarine cables**. These cable transfer data at extremely high speed, as it is **Terrabytes per seconds**, connnecting continents and nations.
* Our data is being transferred over sea, once it reaches the Destination, in our case New York, they have their own regional networks that are managed by their ISPs (probably Comcast, or Verizon)

Let’s get to know VPN, Virtual Proivate Networks, You have one medium to connect to the New York from Pune and you can use VPN.

* VPN works on large distance, sending your data over the internet (untrusted medium) applying encryption that makes connection quite secure to tranfer over internet.
* It uses protocols such as **IPSec**, **OpenVPN**, and uses underlying algorithms, such as **AES** and **DES** for encryption.

Let’s move onto SAN, Server Area Network, where multiple servers are connected, providing access of data not focused on storage or data centers.

Let’s talk about SAN, Storage Area Network, thus, *it provides high-speed solution of fact that you don’t need connection over multiple server acting as a single server*, you can simply go create **one data center** storage and then connect all the multiple servers with them. Earlier, there were multiple servers running, data too was accessed using these many servers, which wasn’t reliable.

* This uses RAID, Redundant Array of Inexpensive Disk, connecting storage devices to the Network.
* Instead of extracting specific data from each server, we created one single data center that allow the availability of resource to all the multiple servers, i.e., now you don't have to go for a specific server for specific data, instead, you can just go onto the single server that has all the resources.
* This also means that if one server is down, you can anyway access the data from the other servers, because there are multiple servers accessing the same data. So you are not dependent on same server to get data.

There is one more thing called as GAN, Galaxy Area Network. If we were to create a Intersteller communication, we would have been able to communicate throughout the solar system. The part where communication between Moon and Earth is already established.

Down the line everything comes to LAN, WAN, or combination of both. Cisco re-defined the way we see the LAN, WAN. It said, our defination should be medium and technology independent, meaning a LAN when you are connected on one internet, but when taking ISPs from third party organisation, then it has to be WAN.

* Meaning, we can say that LAN is when the network is small and usually connected on a single router, but you can differentiate between LAN by WAN, as WAN usually uses ISPs to be able to communicate over large distances.

Let’s see what is WAN, let’s talk about **Ethernet** and **TokenRing**. You won’t see TokenRing netowrks, mostly Ethernet. 

* IEEE maintains Ethernet standards, and it is an open Technology and anyone can use it.
* It goes from 10Mbps to 100Gbps.
* IBM didn’t thought how visionary the production into the PC or say the PC-DOS was, much profitable, they lost again.
* Ethernet has 10Mbps, which is Metro E, 100Mbps, which is PPPoE, 1Gbps, which is LRE (long range ethernet), then, 10Gbps, which is WLAN.

How Ethernet works? Understand how the data is being transferd, it takes that co-axial cable in order to send data. When a machine is sending data, other machine on the same cable used to recieve it till the conversation comes to end, as it won't accept another streamline of data. Ethernet technology uses **Collision detection**, which detects the data collision and resends the data using **backoff algorithm**.

So, that’s why there was set of rules, or say protocols that was developed by IEEE, they developed **CSMA/CD**.

* Basically, CSMA/CD listens to any ongoing transmission of data before sending another data.
* When a device wants to send data, it first listens to see if the network is busy. If the network is clear, it sends the data. 
* However, if two devices sending data simultaneously, a **collision** occurs, and the data is scrambled. Each device then waits a random amount of time before trying again. This is managed by the **backoff algorithm**.

Never a machine can send the data with 100Mbps, you’ll be getting the access of the machine thus , thus i t help in mutliaccess  of the system.

if you have address like this, **01:2A:1B:67:22:AC**, as the first id called Organisation unique identier, meaning it sa called **Vendor Code**. 

* Every machine has it ’s own backoff timer, and the NIC (unique identifier).
* All the machines will back off, if there is coliison, they will anyway backoff. This is called **backoff alogithm**, every machine is suppose to wait till the **backoff timer**.
* If the machines shares the same collision domain, then there will be **backoff timer** that will prevent the device from sending data, thus the device has to wait before the channel starts listening again.
* So a machine has to wait for the random amount of time in order to send the data.

Let’s see Unicaset and Braodcast:

* The unicast works as if  two ends are to be communicated
* Another sis BraodCast address, themmachine will see if the mac cddress it not changing, then it said be rereciveving the data.

Once the machine that were communicating , the probability of remaining machine i the waiting state, that number increases, when there are more number of machine. If there are more mahcines, the more backoff timer, the more there will be more, so you can imaginetha tthe more machin will be ther, ther more ther will be wastage of speed, say if the speed is 100Mbps, then say if 100Mbps is wasted. 
In this case there is also a limit of getting redialed, that is avaliability of the media will be the problem, these two drawbacks of the using the ethernet. So it is important to note that the availability ofthe media doesn’t come to a limitation.

* Electromagnetic Interference, this is what makes the changes to the data during the transmission of data. Because this strong magnetic fields changes the bits and bytes of the data, 1 may become 0, 0 may become 1. Same with RFI.
* Second is the siglnals might be weak, due to this, this can cause a problem in bits of data.
* So what does the CRC does? A CRC is going to be mismatch if there is going to be some happering during the transmission of data. So on the destination the calculation of the CRC is recalculated.
* MTU, Maximum transmission units. 
* The frame size could vary between 64 to 1518 bytes.
* Remember that all the calculation happens in the NIC, as it has nothing to do with the Operating system as such or with the processor.
