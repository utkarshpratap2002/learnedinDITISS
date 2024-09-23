### Frame-relay

Frame-relay is called P2M (Point-to-Multipoint).

- Frame-relay mapping happing according to the frame-relay numbers such that creating a multipoint connection.
- ISPs provide you connection where you can map the one **hub** with muliple **spokes** using frame-relay numbers.

    ```
    A(config)# int g0/1
    A(config-if)# encapsulation frame-relay
    A(config-if)# frame-relay interface-dlci 16
    A(config-if)# frame-relay map ip 172.16.20.2 17
    A(config-if)# frame-relay map ip 172.16.20.3 18
    A(config-if)# frame-relay map ip 172.16.20.4 19
    ```
    - Imagine connecting all those 300 multiple location using leased lines, that can be a big hurdle instead you can use ISPs services to coonnect all your multiple servers using DLCI technology.

If you consider above example, you'll find that router will follwing entries:

```
172.16.20.0 -> s0
172.16.10.0 -> g0/0
172.16.30.0 via 172.16.20.2
172.16.40.0 via 172.16.20.3
172.16.50.0 via 172.16.20.4
```

*How Frame-relay manages the Services it provides to the End hosts?* Frame-relay technology takes in down to DE (Discard Eligibility), BECN (Backward CExplicit Cogestion Notification), and FECN (Forward Explicit Cogestion Notification). Let's understand each terms in simply.

- **DE** is the commitment about of speed that is given by the ISPs and they make a commitment to the Users for the appropiate amount, but when there are servers getting down say B's using 5 Mbps, then there is shooted speed from the end of the Users.
- But when this user use badwidth which is more than the commitment, it gets down using **BECN**.
- On the other hand, there is router which are been told about the reduced bandwidth, using **FECN**.

Think of DE as the Demarkation point where the speed that need to be remain at the commitment level, and this can change if you don't fix the router to a commitment speed, therefore *for the benefit of the customers*, the ISPs never fix the router speed, because every time the router recieve the speed, they try shooting them up wheneer possible, but the switches are the ones using the FECN, telling the other end *to put down the speed with x percent*.



### NAT 

Private IPs are not allowed on internet, so the routers IP addresses are used to interact with internet.

*What is NATing statements?* The addresses on routers getting mapped to the private addresses. Thus the source IP addresses of the host within the prpivate infrastructure is getting translated to the routers unique IP addresses through which the private IPs are able to interact with internet.

- ROuter should know what is **Inside** and what is **Outside**.

|Inside local|  Inside GLobal|
|------------|-----------------|
|172.16.10.2 | 202.208.220.2|
|172.16.10.3 | 202.208.220.3|
|172.16.10.4 | 202.208.220.4|
|172.16.10.5 | 202.208.220.5|
|172.16.10.6 | 202.208.220.6|
|172.16.10.7 | 202.208.220.7|
|172.16.10.8 | 202.208.220.8|


User the follwoing commands to decare the Inside and Outside. You also need to map the Private IPs with the IPs of the router and that can be done using the following commands:

```
A(config)# int g0/0
A(config-if)# ip nat inside 
A(config)# int g0/1
A(config-if)# ip nat outside
A(config)# ip nat inside source static 172.16.10.2 202.208.220.2
A(config)# ip nat inside source static 172.16.10.3 202.208.220.3
A(config)# ip nat inside source static 172.16.10.4 202.208.220.4
A(config)# ip nat inside source static 172.16.10.5 202.208.220.5
```

You can't configure the 200 machine in the LAN, so you nned to confugure them dynamicaly. There is **Dynamic NAT** statement that allows the translation of the Private IPs with the fixed amount fo IPs, meaning you are needed to create the **pool** of fixed amount of addresses and **simultneously** there will be only 6 machine that will be able to commuicate, if 6 IPs are configured to the **Inside Global**. 

- First you need to create the **access-list**, letting every IP from the network out.
- Second, you need to create a pool using `ip nat pool` *name* *starting-ip-address* *ending-ip-address* `netmask` *subnet-mask*
- Third, you need to configure them using `ip nat inside source list` *access-list-number* `pool` *name*

```
A(config)# access-list 15 permit 172.16.10.0 0.0.0.255
A(config)# ip nat pool sunbeam 202.208.220.1 202.208.220.6 netmask 255.255.255.248
A(config)# ip nat inside source list 15 pool sunbeam
```

Anyone from outside can get the **172.16.10.2** via **202.208.220.2**, so if a unauthenticated user can't access the machine as the addresses are getting changes as there are many machines that are using by different machine. Either use `ip nat translation` so that any outside global user can access the IP. But when talking about **static** NAT, the IPs are fixed, hence, anyone can have the access of the machine through the fixed **inside global** address but not the same with **dynamic** nat.

Use the following `show` command to see the NAT table:

```
Router#sh ip nat translation
Pro  Inside global     Inside local       Outside local      Outside global
---  202.208.220.2     172.16.10.2        ---                ---
---  202.208.220.3     172.16.10.3        ---                ---
```

### Dynamic NAT With Overload

When the Public IPs assigned for the Global communication falls short of the Private IPs, NAT uses Port Numbers to identify and forward the request to the internet. Thus Router is able to negotiate with the port numbers identifying the machines using port number, as every machine in the network can't use the same port number to communicate with the same service. So Router says, *lets use another port number for the accessing the same service* for different machines.

Use `ip nat inside source list` *access-list-number* `pool` *name* `overload` for implementation of Dynamic NAT **Overload**.

On the broadband Connection, there is no IP configuration that has pool already configured on the broadband interface, instead there is specification of the interface itself that is to configured while you are configuring the Dynamic NAT overload.

The following chain below states the same point of configuring the Dynamic NAT on the interface instead of assigning the pool of addresses that can be tranlated:

```
A(config)# access-list 15 permit 172.16.10.0 0.0.0.255
A(config)# ip nat pool cdac 202.208.220.1 202.208.220.1 netmask 255.255.255.248
A(config)# ip nat inside soruce list 15 pool cdac overload
```

Instead of specifying the pool again and again, you can refer the below example, as suppose if your broadband is down, then it is possible that there is lost of **leased IP** by DHCP, in that case your address might not be the same after the startup of Router. In that case, it won't be possible to do that, therefore, there is this kind of configuration already configured.

```
A(config)# ip nat inside source list 15 int g0/0 overload
```

# IPv6

IPv6 has 64 bit in size, it was able to represent bigger number with lese spaces. 

```
003A:2B1C:0000:0000:0009:0101:0000:007C
003A:2B1C:0000:0000|0009:0101:0000:007C
<------------Subnet|Host-------------->
```

You can assign the IPv6 using the `::` when there us two cosecutive groups of **Zero**, Though you can see that there are total six groups are found in the hexadecimal.

It is veryful in representing the netwrok, if you wnat ot represent your netwoork, then 
it makes it easy to identify the *zeroes*. But remember that you can use the `::` only ones in the whole IP addressing, as it shouldn't be used **twice**.

There is no Subnetting in IPv6, there is fixed IPv6 subnets, i.e., `/64`. IPv6 Engineer while defining the IPv6, eliminating the DHCP and other protocols such as ARP, no need to ARP, when there is no need to broadcast within the network. 

**EUI-64** is the standard that specifies the change around 48th bit to `003A:2B1C:0000:0000:0009:0101:0000:007C` to **`003A:2B1C:0000:00FF:FE09:0101:0000:007C`**. ANycast is another term used in IPv6 for broadcasting, thought theorically there is no broadcast within the IPv6, but **Anycast** is another concept used for broadcast only in IPv6.

Commands to restart the IPv6 routing, you can use allocation of IPv6 commands on router, as given below:

```
A(config)# ipv6 unicast-routing
A(config)# int g0/0
A(config-if)# ipv6 address 3A:2B1C::/24 eui-64
```

In IPv6 there are `FEC0::` called as **Link Local** addresses, and another is `FE80::` which is called **Site Local** addresses.

- Private freguencies are to be used for personal belonging only, and that too they can't go ahead of the 40 - 100km. There are only two kinds of **2.4 GHz** and **5.0 GHz**.
- Next, 2.4 and 5.0 uses **802.11b** and **802.11g** respectively, and the importantly when it ocmes to IoT devices, they needs to be connected and working on same technologies and then it should be using **802.11b**.
- Now ther is also used **802.11n** standard that gives the backwad compatibility and is able to provide teh sped of 150 - 200 Mbps.
- Devices that communicates with each can be majorly divided into following parts:
  - **IBSS**
  - **BSS**
  - **ESS**
    - When working with channel number within 0-15, it is suggested that your should be using channel number 1,6,11, because when you'll cone into the subset area, the connection will be left behind and will be used to 
    - There is WLC (Wireless LAN controller), it will sense all the access-point and accordingly it will be able to divide the access-point

Basically there is need to assign them with **SSID**, *provide a name*, then there is **Channel**, mostly is is autodetected but has a range from *0 - 15*, then there is **Mode**, if the *Mode id* is *Infrastructure* then it has to be multiple connection connected to **Access point**.


 
