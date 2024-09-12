### Private and Public Infrastructure

So far we know that we can deal with IP and Subnets and how we calculate subnet mask and then further how we are able to create subnets and number of hosts that be in subnet.

* There exist two kind of IPs, one is private and another is public, this kind of IP are to be used within your private organisations, as private IPs are supposed to used in your private infrastructure.
* Basically, Routers has something called NAT, that is Network Address Translation, basically it is communicating with internet as well as 
* Routers have something called proxy servers, that means dummy, routers take that IP and sends the requests to internet.
* Now NAT and Proxy, these two technolgies are used in to communicate with IP addresses over the internet.
* **APIPA (Automatic Private IP addressing)** is the kind of IP address where system themselves are able to assign an IP within the subnetworks and they are able to communicate with them.

### Spanning Tree Protocol

Let’s see switches again, if we create network of four switches connected in a circular fashion, then if we send a broadcast address to the switch 1, similarly, the same broadcast will be transfered to other switches too, thus that will distributed to the switches, thus this will create a looping braodcast address, and it will chock the network. 

* Switches are that intelligent, if you don’t configure the network properly, then this switching loop will exist within your network.

![alt text](diagrams/day3.png)

* What happens is that it creates a broadcast strorm.
* Routers seperate collison domains as they tend to seperate the collison domains into seperate networks, and this prevents the collison domain.

<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>What is collison domain?</strong> A collison domain is where multiple frames collide within the same network. When two frames form the same network comes together, collison happens.
</div>
<br> 

Let's talk about the Cables,
- the standard **ethernet cables**, which are used to connect two devices such as Routers and switches, only remember that ethernet cables are also called *straight-through cables*
- and **crossover cables**, which are used to directly connect two devices such as two computers that *switches* the send and recieves signals, so that thay can make a contact, like pluging the two phones together

There are two more cables called **CSU/DSU (Control Service Unit/Data Service Unit)**, and **DCE/DTE (Data Terminal Equipment/Data Communication Equipment)**.

- **CSU/DSU** - It is an speacial type of equipment that is used to connect the routers to the telecomm lines, called **leased lines**, such as **T1** and **T3** lines. CSU is like a **bridge** that ensure the lines are connected between the router and the telecommunication company's network, and DSU acts as a **converter** that converts the data of router that leased lines, *T1 and T3*, can understand and can be send over the large distance.

Before we understand **DTE/DCE** communication, we need to understand **Synchroneous** and **Asynchroneous** Technology. 

- Asynchroneous is the one that used the transmission of **one byte (or bit) at a time**, meaning one bit was transfered at a time, which was slow, as it uses extra bits **start** and **stop** bits during the transmission to track the starting and stopping of the data. In fact, it didn't had any synchroneous time calculation mechanism.

- Synchroneous tech was more fast becuase it used to send the data unit inependently using **clocking mechanism**, using a shared clock while sending the data. This redues the overhead of start and stop bits and was much more faster than Asynchroneous.

- **DTE/DCE** - In order to communicate, there was used Clocking method, just like synchronous clocking mechanism where a pulse was provided to the devices, that is called DCE, that provides pulses and another is DTE, that recieves the pulses and interpretes the communication.

* **HUB**
    * This device is a part ethernet commnication
* **Repeater**
    * Thus due to the internal resistence of the material, the signal gets reduced so because of the resistence there is repeaters, that amplifies the signals of the transmission, thus HUB too amplifies signals but there may be internal interference.
    * Thus Repeater’s amplification, it basically purifies the noice and removes the noice and it restores the amplification.

<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>Some General Knowledge</strong>, The three-pin plugs in our homes have a  <strong>Live</strong> (positive), <strong>Neutral</strong> (Negative), and <strong>Ground</strong> pins.
When you wear slippers while touching a high volt of current, you’ll be thrown away, because the cuurent finds a better way to flow through you but becuase you’ve slippers on it doesn’t directly go down to the earth, and if you didn’t wore the slippers then you’ll get stuck to the circuit as it won't leave you with any capabilities to think.
That was just a scenario. Thus, the <strong>Live</strong> wire connects you with the whole circuit and that might lead to the huge amount of current of voltage through it, in that case three is a <strong>fuse</strong> that blows away when a a hige amount of voltage is passes throught the plugs, and it prevents any possible disaster. 
The <strong>Earth</strong> wire is for safety and it directs the current to the ground, when there's a fault.
Then there is <strong>Neutral</strong>, is negative that completes the circuit.
</div>
<br> 

Switch connection do provide connectivity within a network or say LAN but it resulted in **Broadcast storm**, thus broadcasting message to every machine in the network and we need a better solution over it, i.e., **Routers**, which uses segmentation of networks and it uniquely identifies the network based on **subnets**, through IP addresses.

### Routers

We take now a scenario where PC1 and PC2 are connected with a router, one router with PC1 and another router with PC2, also each PC is again connected to Switches on each side. Consider each PC is in some zone, say Pune and Delhi.

Network 1 is Pune, Network 2 is routers connected on both side, Network 3 is Delhi. Say the LAN on Pune be having 172.16.10.1/24, and LAN on Delhi be 172.16.30.0/24, then our PC1 be 172.16.10.2 and PC2 be 172.16.30.2, and routers be having 172.16.20.0/24.

* `ping` is a most used command, it directly sends empty packets to the destination address.
* The PC1 frame will contain the src and dest and machine will be able to understand what is the network, whether forign or within the subnet, in our case we are trying to send it to PC2 so it will send it to the default gateway. 
* Default gateway is the routers IP ATS that is connected to the network.
* Default gateway is the routers address, in our case it is 172.16.10.1.
* Because Routers have IP address of Networks. So it has three entries in the routing table, one of network 1, 2 ,3 as well. 
* When PC1 wants to send the frame the PC2, then the data link layer is working as MAC address recognition by Switches, and then tranfering the data over the network.
* Because frames uses routing protocols through which frames are able to get where they required to.

Now, Routers themselves can communicate among them and can provide a comm beyond the networks. For that there are routing protocols, these are RIP, OSPF, EIGRP.

What happens at Transport layer?  It is about relliability, it provides a assurity, but remember that segments never go alone, it always includes the parts like NACK and ACK

Transport layer functionality includes:

- Windowning or sliding window protocol
- It provides the error correction
- It is Connection oriented communication
- It also got the sequencing, meaning it tracks the label of of the packets it is recieving
- Flow control, a resource can be asked by many machines, so this occupation of resources is handle by machine (having the resource) using stop bit and ready to go bit, meaning if the resource is demanded while the machine is busy, simply machine will send a stop bit that tell to hold on and when the machine gets free, it sends the ready to go bit.

Remember that all of it are part of segments. As segments never go alone,

|UDP         |TCP       |
|------------|----------|
|It is not reliable as TCP ensure error correction and detection| It is reliable as it uses three-way handshaking|
|It is fast | It is slow|
|UDP doesn't have any flow control| TCP has a flow control and check if reciever is ready to recieve data|

*Why UDP is so fast?* UDP segment carry more data than the TCP, and TCP is reliable and flow control and is flexible. TCP is also got a bigger level.

Now calculate for the following considering **W.X.Y.0/29**:

- FIRST HOST ON 5TH SUBNET
- LAST HOST ON 10TH SUBNET
- BR ID 12TH SUB
- LAST HOST ON 15TH SUBNET
- LAST HOST ON 20TH SUB
- LAST HOST ON LAST SUB


