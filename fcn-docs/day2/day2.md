# ARP (Address Resolution Protocol)

Let’s consider the Machine A and Machine B wants to communicate, question, how machine B knows that Machine B wants to communicate. It uses **ARP** protocol.

* The purpose of ARP is to learn the MAC address of the **Destination** machine. A will broadcast that he wants to communicate with the Machine B, the broadcast message carries `::FFFF`

![alt text](diagrams/arp.png)

<br>

* Machine B will recognise the data, because once the broadcast e message is sent by A, every other machine listen to that braodcast, but only machine B will respond.

Once the connection is established, it keeps the MAC address is kept for 10mins. Suppose A is transfering 40Gb of data, A has generated creadcast and lets say the communication was for 20min. Once the comm stops, if 10mins last, after the communication with respect to the fact that there is ideal period, meaning 10 mins lasted and no comm is happening, then MAC address will remain for that 10min. It is called ARP Cache time.

![alt text](diagrams/two-department-comm.png)

<br>

*So what is MAC Table?* Let’s talk about the A and B communicating again, but now there are two different deparments communicating. Now think, A from one department sends the message, the device (switch) will process the broadcast and will learn the address of A and B, Note that 48 machines are still in waiting stage. Similarly, on the other side, there are two devices whoes address switch has learned, now here too ther eare 48 machine. Thus, 

* Switch will discard the message if the destination lies in the same subnet or domain.
* The switches learns the MAC addresses when broadcast takes palce.
* The switches increases the chances of Collison but decreases the collison.
* The switches have RAM so when A will communicate with C and D will communicate with B, at the same time, the collision won’t happen, as it will store the data in RAM and once the channel gets free it will carry out the comm. 
* Switch has ARP cache time for 300 seconds.

Let’s take a point! Switch has a microprossessor and a RAM, so it learns the MAC address and send it to the destination.

* So what kind of intelligence is being programmed in the switches. This is called ASIC. 
* This can’t be something like a machine with Windows 11 but we can’t do that, because we only need to be able to create a device with limited functionality, and don’t want to implement other programs form Windows 11.
* Note that Switch is ASIC based and Bridge is software based.

Full Duplex? Full duplex basically uses Hub, the devices are individually connected to the Hub, so that any chances of circuit corruption can be avoided. 

* basically we use two seperate cables using one for transmission and another for recieving at 200Mbps, that means, all the machines can have complete communication, this is called Full Duplex.
* Even more basically, we use CSMA/CA, collison avoidence.

Half Duplex?  Half Duplex is where at a time, only one Machine or ddevice is able to send the data. Another is Simplex?  It is only one way communication that allows only receiving of data, that means you can’t send back. 

On each interface when switch recieves the breadcast of the machine or it sends the frame to destination, it learns the MAC address of the respective machines on the respective interfaces. 

This kind of network is called flat network and MAC address is called flat address.

* The biggest drawback of the switches. First, everytime when a braodcast will be initiated, there will be x amount of delay because there will be 50 hosts on each interface to search for it, so there will be dealy of 3x time to search for a host on three such LANs, so Switches create delays.
* Even if you buy a 1000 rupees switch which is capable of handling only 8 ports, it eventually iwill be bombarded with 150 MAC addresses, this will create more delays

For reference, the price is always proportional to the capability of the processor, a standard Switch comes of 80,000 Rupees with 24 ports. Note that, the switch with great capabilites is what we should always say ideal one.

* Another drawback is that it gives you the **hangs**, it happens because the the keyboard buffer gets filled up and while the processor is processing the broadcast, the moment broadcaset filled up, processor has to clear them up.
    * There are always diffrent kind of broadcast, like printer broadcast, keep a contineous anouncement from the machine, machine do have their machine names, they too do name advertisement, every machine anounce every 10 min, if there is a shared folder, they too anounce, there are various services anouncing their servers.
    * So, machines are full of broadcast, even servers, there are like lot of broadcasts.
* Switches cannot take down the broadcast, so servers go down when broadcast are overlaoded. 

![alt text](flat-network.png)
<br>

Now that we know that we need the solution to the Flat network Architecture of the Switches. We’ll look into identification of networks. We say there are networks that will uniquely identify the network using broadcast address of the particular networks.

* Because the networks are having their own broadcast for each network, we connect the three switches in each network with a device (Routers).
* Now there no need to know individual networks, thus, there will lesser number of machines on each switches, thus there will be les delay.
* This device has two parts, one is network identity and host identity.
* Question is how there will be communication? Because switches only knows there own networks, but the routers will help them to reach till Network 3.

Routers is very important, as if you have internet connection, this router give connection to every devie present in the premises. Routers give internet the ability to connect to you as well as it also limits the high speed broadcast from reaching you individual space.

* Routers never work alone, they have IP address associated with it, that handles, network and host.
* IP address has 32-bits, `w.x.y.z` (192.168.0.41), and has Subnet Mask. 
* Subnet mask is called the one that tell what part is network identity and what part is host identity.
* If IP address is 172.16.150.200 and subnet mask 255.255.0.0 that is tell only last two octet wil tell the host identity.
* IP Address is simple, the subnet mask will decide what is your network and who is your host.
* Remember there will be strict breaking line, say if subnet is 255.0.0.0 (11111111.00000000.00000000.00000000), meaning only the first octet will tell you the network, say 172.198.0.51 has subnet mask of 255.255.255.0, then 172.16.0.0 is your sub-network and 172.16.0.51 is the host.
* IP addresses are distributed in four classes :

|Classes    |First Octet    |Default Subnet Mask    |Use    |Property   |
|-----------|---------------|-----------------------|-------|-----------|
|Class A    |0 - 126        |255.0.0.0              |Used for large scale organisation|0xxxxxxx|
|Class B    |127 - 191        |255.255.0.0              |Medium scale organisation|10xxxxxx|
|Class C    |192 - 223        |255.255.255.0              |To be uses in small scale organisation|110xxxxx|
|Class D    |224 - 239        |Multi-casting             |Reserved for multicastig|1110xxxx|
|Class E    |240 - 255        |Experimental Classes            |Reserved for Experiments|1111xxxx|

<br>

* Now there is 127.0.0.1, that is called localhost address that means initialising the own network, that is used in development of the softwares to loopback to your local system.
* IANA, internet Association Numbers Association.

Why TCP/IP only? Becuase of it’s address scheme. Becuase we are able to distinguish between the network and host as well. Say if we have a network of 172.16.1.0, representing out network, and then there is host. Host will be 172.16.1.1. These subnets can be easily manipulated as if you need more network you can choose to increase the networks and IP addresses within the Network. 

* In the above example of 172.16.1.0, our subnet mask will be 255.255.255.0. Thus, you can change the demarkation point, you can ask for more networks and similarly increase the number of networks run.
* You can choose to move the demarkation point forward.
* If you are already in Class C, then 255.255.255.0, meaning within the last octet, you can take more bits to increase you networks, 255.255.255.224. 
* Now let’s go and decompose the networks, from 202.208.220.0, if take first three bits of the network, you’ll be extending the subnet mask with three more bits. i.e., 202.208.220.224. 
* Understand that all zeroes and all ones cannot be the hosts, as they are used for broadcast and localhost.

In order to know how many hosts and networks can be there you can calculate using 2ⁿ - 2, which gives number of subnets :

|Subnet/Hosts |Bits |
|-------------|-----|
|2² - 2 = 2|2|
|2³ - 2 = 6|3|
|2⁴ - 2 = 14|4|
|2⁵ - 2 = 30|5|
|2⁶ - 2 = 62|6|
|2⁷ - 2 = 126|7|
|2⁸ - 2 = 254|8|
|2⁹ - 2 = 510|9|
|2¹⁰ - 2 = 1022|10|
|2¹¹ - 2 = 2046|11|
|2¹² - 2 = 4094|12|

* If we look at our example, 202.208.220.224 has taken 3 bits from the last octet, then it gives 6 subnets, then you get hosts for remaining bits, for remaining bits you can calculate using 2ⁿ -2, where n is the number of bits remaining.
* Let’s consider a example, where in class B we need 55 subnets, remember when we say 55 subnets in class B, it means we already have first two octets full of 1 bits, now we need the arrangement of bits in next octet so that we can acheive 55 more subnets.
    * we take class B first, 255.255.0.0, meaning you have last two octets left
    * now you can acheive 55 subnets by taking first 6 bits, i.e., 62 subnets
    * so the value of 11111111.11111111.11111100.00000000 is 252, that means the subnet mask we get is 255.255.252.0 mask where the remaining zeroes are the possible hosts that can exist in each subnet.
* There is another way of writing subnet mask `/24`, `/16`, `/8`, i.e., specify the number of bits are occupied with 1, if the subnet mask is 255.255.255.0, meaning there are 24 bits that are occupied with 1 subnet part, so specify the number of bits that occupied with subnet bits.

Now let’s move further, calculate the subnet ID and ..

* There will be three parts in the IP, up to default network, that is called Network ID, then up to extended part is called subnet ID, then further there is host.
* Considering a example, 11111111.11111111.11111111.1011

Remember while calculating the Subnet ID and Broadcast ID, if you find that subnet mask is all ones, then don’t calculate the subnet id, because it id INVALID.

Remember that once you write the IP address, it is necessary to check which class the IP address belongs to, accordingly you'll be required to assign the subnets.

We also use something called UTP/STP.