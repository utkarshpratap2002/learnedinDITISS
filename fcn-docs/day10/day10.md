# ACL (Access Control Lists)

In this section we are going to discuss the foundational blocks of security, the security starts right fromthe **routers**, i.e., ACLs, the mini Firewall within the router. Now within the ACL there are two majorly:

#### Standard ACLs

- Create a list of rules, and then apply them on interfaces, say **traffic comming to g0/1**.
  - It is important to imagine the direction of the traffic, as if you are permitting the traffic through **g0/1** on A, meaning if there an interface you have to decide whether the traffic comming to the network or it is going out of the network. A simple exapmle, If you need to allow `192.168.10.10` into the network B, then you need to permit it at interface **g0/1** of Router **B**, and if you need to restrict it, you need to visualize on which interface of router it will try to come in, such that you need to deny the IP on the **router interface**. 
  ```
  A(config)# access-list 10 permit 192.168.10.10 0.0.0.0
  ```
  - Remember that Standard ACLs are only reserved betweem **1 - 99**.
  ```
  A(config)# int g%
  A(config-if)# ip access-grop 10 in 
  ```

  - Remember that `deny any` is by default on, meaning any other network or IPs will be discarded. 

If you need to restrict `192.168.10.10` form communicating with the other network, you need to deny it, but remember that you also need one **permit** statement in order to tell the router that what to do if any other address comes in, so the following commands to configure the rule on router for interface **g0/1** goes like below:

```
A(config)# access-list 10 deny 192.168.10.10 0.0.0.0
A(config)# access-list 10 permit 192.168.10.0 0.0.0.255
```

Remember that in order to understand the 

```
A(config)# int g%
A(config-if)# ip access-group 10 in
```

You can configure the rules by simple feature of the commands, you can replace `192.168.10.10 0.0.0.0` with the `host 192.168.10.10` and also you can use `permit any` in case you need to permit all the traffic going into the g0/1, the on facing the network in the network diagram. 

ACLs have sequence, meaing if you need to assign the rules to the router, it would mean that there is need to sequence, you need to define the sequence. Again, Router will go on mathcing the rules, it will permit or deny according

Three golden rules

- **Per interface Per direction**, meaning only one access-list could be assigned that means if there is an interface g0/1, then you can make one access-list, say **access-list 10** on an interface g0/1, then there can't be another rule list for the same interface. 


#### Extended ACLs

Extended ACLs can be configure the interfaces for the other networks also, as you can define what destination IP would be in order to make rules based on IP address of another network. Consider you need to make a rule for the host in network A who should be **only** able to connect with `192.168.30.10` only in the other network. So that can be done using **Extended ACLs**.

Sytax for configuring the Extended ACLs wull be:

```
A(config)# access-list 110 deny ip host 192.168.10.10 host 192.168.30.10
A(config)# access-list 110 permit ip any any
```

Remember that after the `access-list 110 deny` ***protocol*** ***src-host*** ***dest-host***. Here in the command, you can **permit** or **deny** any protocol, meaning **IP** or **ICMP**, followed by the *soruce* ip-address and *destination* ip-address.

|Network | IP | ICMP |
|--------|----|------|
|Transport| TCP | UDP|
|     | HTTP, HTTPs, FTP etc. | POP3, TFTP|

You can add an `eq` that wil tell router to apply the rule on the specific port or service, meaning you can define the particular sevice that you want to allow or permit. So in that case the complete syntax of Extended access-list will become something like this below:

```
access-list [number] permit/deny [protocol] [source-address] [wildcard-mask] [destination-address] [wildcard-mask] eq [port-number]
```

Remember that Extended ACLs are reserved on **100 - 199** and Standard ACLs are reserved on **1 - 99** and therefore, if you tried using Extended ACL number defining the Standard ACL, it won't work. Therefore remember the number range while defining the ACLs **(Extended or Standard)**.

### Example 

Cosider the below requirement and perform the Access-list.

- All the machines in the Network **Red** should be able to commuincate with `172.16.30.100` in Network **Yellow** only on specific service **HTTP**
- Only Machine `172.16.10.0` should be able to communicate normally with `172.16.30.0`.

```
access-list 10 deny ip any host 172.16.30.100
access-list 10 permit tcp any host 172.16.30.100 eq 80
access-list 10 permit ip any any  

int g0/1
ip access-group 10 in 
```

Remember in this case sequencing and the what specifically is to be blocked is very important, as you need to remember what is to be allowed and what is to be permitted, if you didn't specified `deny any 172.16.30.100`, then eventually any traffic will be able to get through the `172.16.30.100` which isn't wat we want.

### Named ACls

You can assign the name foe the acls in given below syntax:

```
A(config)# ip access-list extended blockweb
A(config-ext-nacl)# permit tcp any host 172.16.30.100 eq 80
A(config-ext-nacl)# deny ip any host 172.16.30.100
A(config-ext-nacl)# permit ip any any
A(config-ext-nacl)# exit
```

Thus, with `A(config-ext-nacl)#` a new prompt opens up with the name of the access-list where you can configure the rules for the sepcified access-list, remember that you can also change the `extended` with `standard` and then assign the **named access-list** using the below syntax:

```
A(config)# int g0/0
A(config)# ip access-group blockweb in
```

You can use `show access-list` or followed by the specific **number** of **name** of the access-list to see the specific access-list created and you can also use command `show ip access-list` to see the access-list created for the specific services. Remeber you can also see the access-list applied to the specific interfaces using `sh ip int` and `show running-config`.

Now when working with firewall, there could be various kind of parameters and lots of arguments that you use to specify, but in **firewall** there are **policy objects**, but the logic remains the same as there are inbound and outbound traffic needed to be configured. The idea is to identify what traffic and what specifically is to be restricted before we **`permit any any`**.

### Another Example

Consider the below access-list that we are to apply:

- PC1 shouldn't be able to communicate with `172.16.30.0/24`
- PC2 shouldn't be able to communicate with `172.16.10.0/24`

```
access-list 10 deny host 172.16.30.10
access-list 10 permit any

int g0/1
access-group 10 out
```

### ACLs for Telnet

When applying ACLs to the **Telnet**, you need to apply it in the `line vty 0 4`, go to `line vty 0 4` and assign the access-list to the line using `access-class 50 in`, meaning accoriding to the given rules the router will decide what IPs should be able to telnet.

```
A(config)# access-list 50 permit host 172.16.30.10 
A(config)# access-list 50 deny host 172.16.30.10 
A(config)# line vty 0 4
A(config-line)# access-class 50 in
```

# WAN

There are three major connection in WAN:

- **Dedicated Line**, also called leased lines, which were the one that were giving the direct commection through the distance, as if there is 10Mbps line, then throughout ther will be same speed.

- **Circuit Switching**, it was the line that was called ISDN, meaning the ISPs use to charge for the individual connection that the company use to ask for.

- **Packet Switching**, it was the paradigm which use to take care of customers by providing the individual network and throughout the distance they had their own infrastructure and throgh tha line infras* the whole connection was established.

  - Within Packet Switching there are few terminologies and concepts on how the ISPs are giving the services and how eveything works? 
  - Baiscally there is **Demarc**, a demarakation point till where the ISPs are providing the network connection, it is till the point where the line starts getting used by the customers. 
  - The part used by customers is called **CPE (Customer Premises Equipment)**, where the end users use it and if ther is any problem, ISPs are not responsible for any that problem.
  - Next within the Demarc, there are lines of ISPs, which is called Local Loop, these loops are the main infrastructre lines of the ISPs connected to their main control Centre which is called **Control Office**, from where the lines are extended to the destination connection.
  - The misery is that when thes ISPs are making the connection establishment for th Customers, these lines are not only the **local lines**, but ther are is **last mile**, these are the lines taken by ISPs from another ISPs, many times there could be any local ISPs, already taken the lines over the infrastructure and this is taken by ISPs.

*What is HDLC?* It is a *link control*, one that IBM created was SDLC, which was copywrite of the IBM. It adds a **LLC (local link control)** that is to fullfil the need to be able to identified by the network. Now it has three things associated to it:

- First, it is the by **default on the Cisco**
- Second, it is **vendor specific**, as every other company started making their own LLC
- Third, It uses Synchroneous links, meaning it uses Clocking.

```
A(config)# encapsulation hdlc
```

The solution to the problem, as it was vendor specific, so **PPP** was introduced. 

- **NCP (Network control Protocol)**
  - Performs the single link erroe detection
- **LCP**
  - Multilink, meaning there were multiple connection established within the two hosts and then it gets packed up into one connection, all the various link into on single connection.
  - Error Detection, though there were quality contorl and magic numbers
  - Cpmpression, used to make the **zip** or say packing of the info and then again at the end there was unpacking og the info.
    - Stacker
    - Predictor
  - Authentication
    - PAP, after exhanging usernme and password te link is established and if someone hijacks the connection, then connnections won't even recognise it. Though, there's another thing, it checks the username and passwords in plain text.
    - CHAP, uses MD-5 (message digest-5), there is sequence of number that are shared btween the established connection, so there is a contineous exhange of values and sequences that has to be known by the other connection, so if someone tries to hack in between, he won't be asble to do it becuase he is expected to come up with the **hash value (# value)**.
    ```
    interface s0
    A(confif-if)# encapsulation ppp
    A(config-if)# ppp authentication chap pap
    A(confif-if)# exit
    ```
    - You can configure the uername and password for chap and pap, using below command, but remember the username need to the HOST and password on both the machines should be same:
    ```
    A(config)# username B passowrd cisco
    ```
    - You need to configure the same password on Router B also:
    ```
    B(config)# username A password cisco
    ```

- **HDLC**

  - HDLC are still working with frame relay. This is becuase the connectivity betwene router is caled PVC (Permanent Virtual Circuits), now we have only PVC.
  - **Frame relay** works with PVC. It establishes the connection regularly with all the cliens and maps their  connection using DLCI (Data link connection identifier), it is also called NBMA (Non Broadcast multi access) network. 
  - Frame-relay uses the **DLCI** for mapping the one end host from another, this mapping can be done using a se of number from 16 - 1007, except these other numbers of  DLCI can't be allocated to the hosts or to ends. 
  - Remember *why they are called NBMA network paradigm?* Because there are no Broadcast in the DLCI.
  - Can be configured using the follwoing commands:

  ```
  A(config)# int s0
  A(config)# encapsulation frame-relay
  A(config)# frame-relay interface-dlci 16
  A(config)# frame-relay map ip 172.16.20.2 17
  ```



