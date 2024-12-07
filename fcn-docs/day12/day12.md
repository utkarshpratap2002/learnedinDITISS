### WAN Security

Earlier multiple technologies for WAN were in use but die to cloud adoption technologies like SD-WAN came into picture and changed everything. Earlier technologies like Frame Relays, Leased (T1/T2) Lines, ATM (Asynchroneous Transfer Mode) were used. But they are not used more. 

- **MPLS (Multi Protocol Label Switching)** - Now that it is method of 

**WEP (Wireless Equivalency Protocol)** works on the architecture that allows you to connect on the internet same as that of the Access-point. You know that when you are trying to connect the network, you need to connect through the WEP network and provide the passwords.

WEP version1 - Uses TRIP, DES (32 bits)
WEP version2 - Uses Triple DES, AES.

*What is Triple DES?* The text will be encrypted for the three times, once it gets encrypted then again for two more times, the DES is applied three times. *Don't think what needs to be done for security, think what hacker could do.*

*Another is AES.* AES is the most advance system as it composed to 128 bits algorithm.


### GRE Tunnel

Before we get into the technolgy, we need to understand that with standard NAT, there is a problem faced in the industry. Every time you can use Overloading of NAT and expect to have a stable connection as ability to be communicate fromthe outside to the inside isn't possible, therefore to get the better view at the problem, look at problem statement.


**Problem statement** - 

![alt text](gre-tunnel.png)


**Generic Routing Encapsulation** is the method used in the industry in order to add another header, L3 Header, nothing but the network layer header. This header is the one that takes on the entry of Inside global and Outside global, thus, after the header the tunneling provides themedium to carry on the packet to the destination and the at destination **80.1.1.1** is able to recieve that packet, knowing that this is going to be the **171.30.2**.

*How we can do it?* Use the tunneling commands given below to configure the tunnel on router A and Router B:

```
A(config)# ip route 172.16.30.0 255.255.255.0 tunnel0 
A(config)# ip route 172.16.30.0 255.255.255.0 172.16.20.1
A(config)# ip route 172.16.30.0 255.255.255.0 172.16.20.2
A(config)# int tunnel0
A(config-if)# no shut
A(config-if)# ip address 172.16.20.1 255.255.255.0
A(config-if)# tunnel source 75.1.1.1
A(config-if)# tunnel destination 80.1.1.1
A(config-if)# ip mtu 1420
```

The Configuration of the `ip add 172.16.20.1 255.255.255.0` is the tunnel0 configuration.

The last lines of command, `tunnel 75.1.1.1` and `tunnel 80.1.1.1` are to tell the source and destination of the tunnel. And remember for every tunnel you need to create a new tunnel that will pass your frame and data to the destination.

Now you need to configure the path to you ISPs, that can also be internet. Remember that the the line below that specifies the path to the ISP, `ip route 0.0.0.0 0.0.0.0 75.1.1.2` tells the router to the send it the ISPs router, then above that its ISPs routing and all, that will decide the routing path.

```
A(config)# ip route 0.0.0.0 0.0.0.0 75.1.1.2
```

Similarly B's configuration can be written:

```
B(config)# ip route 172.16.10.0 255.255.255.0 tunnel0
B(config)# int tunnel0
no shut
B(config-if)# ip address 172.16.20.2 255.255.255.0
B(config-if)# tunnel source 75.1.1.1
B(config-if)# tunnel destination 80.1.1.1
B(config-if)# no
```

### IPSec 

There are two typese of IP security, one is Tunnel Mode and Transport Mode. When your packet is going through the internet, the packet is basically encrypted with payload. It basically tries to protect the src and dest IP address. 

- When the company choose to go directly to the public servers, then they need Transport Mode 
- When the company choose to be more secure not exposing the servers to the internet or oublically accessible, then they need Tunnel Mode. 

Tunnel Mode also hides the data, as there is IP header within the IP header so it is impossible to know whether this is tunneling or the Regular IP header.
 




