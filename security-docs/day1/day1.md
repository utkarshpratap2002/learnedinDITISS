# Basic Networking

- Default gateway is what when youneed to communicate outside the network.
- When you try to ping outside the network, it takes more time. This is what called **Latency**.
- **TTL** Time to live, the number of hop count that means *what is the time-period of the packet*. After this time-period it gets dropped.
- For Linux server, default hop count is 64.
- `traceroute` is the command for check the path that the packet takes.
- Now do you know what is that thing that is defining your network, it is the subnet that we inside

# How Communication works?

- There are five elements in communication, one is *sender* and another is *reciever*. In every communication there is also *message*, now there is *transmission medium* (could be wire, could be VPN), then there is *protocol*.

- For example, when you using `ss` utility to learn what are the ports that are listening

- Private IP address range
  - **Class A**: 10.0.0.0/8 (10.0.0.0 - 10.255.255.255)
  - **Class B**: 172.16.0.0/12 (172.16.0.0 - 172.31.255.255)
  - **Class C**: 192.168.0.0/16 (192.168.0.0 - 192.168.255.255)

- OSI Modal and TCP/IP

- **What is Physical Address**, It is MAC Address, used in Data Link Layer. 

- Get to know the *Family tree* of the Linux. 

- Manu Sir also has developed **Matriax** operating system.

- Port uses the Transport layer, IP addresses uses Network Layer, Data Link layer uses Switches, traditional layer works on L2, but now there are L2 and L3 Switches. Routers works on Network Layer. 

- The Basic defination of the server is *any device that is providing services to the requests* are called servers.

- Servers doesn't necessarily runs on the high-computation power, as it is providing the service doesn't necessarily need huge resources. So servers are anything like EC2 instance.

<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>Note: </strong> What is the purpose of the attack, therefore, you need to consider the end result as well as purpose of attack.
</div>

<br>

# Private IP Addresses

Let's delve into some advanced concepts surrounding private and public IP addresses, it is important to understand how private IPs and Public IPs go hand in hand in order to deal with multiple problems like IP exhaustion and all. 

* **Overlapping Private Address Spaces:**  While the RFC 1918 private address ranges (10.0.0.0/8, 172.16.0.0/12, and 192.168.0.0/16) are well-known, different organizations or branches of a large company might use the *same* private IP ranges internally. This doesn't cause conflicts *as long as those networks remain separate*.  The magic happens with NAT and routing, which ensure that traffic is correctly directed based on the public IP and port translations.
* **Carrier-Grade NAT (CGNAT):**  Due to IPv4 address exhaustion, ISPs are increasingly using CGNAT.  This means *your home network might be behind *another* layer of NAT*. Your router receives a private IP from your ISP, and then performs NAT for your devices.  This can cause issues with some applications that require inbound connections or specific port mappings.  It also complicates things like setting up VPN servers or game servers.
* **Private IP addressing within virtualized environments:** Cloud providers and data centers extensively use private IPs for internal communication between virtual machines and services within their infrastructure. They leverage technologies like Virtual Extensible LAN (VXLAN) to create overlay networks that allow overlapping private IP addresses to coexist across different tenants and availability zones. This enables flexible and scalable network virtualization.

# Public IP Addresses

* **Dynamic vs. Static Public IPs:** Most home users receive dynamic public IPs, meaning their IP address can change periodically. Static IPs remain the same, which is crucial for services that need a consistent address, such as web servers or email servers.
* **Anycast Addressing:**  Anycast allows multiple servers in different locations to share the same IP address.  DNS directs traffic to the "closest" server geographically, improving performance and redundancy.  Content Delivery Networks (CDNs) often use anycast to distribute content efficiently.
* **BGP (Border Gateway Protocol):** BGP is the routing protocol that governs the internet.  It's how different networks advertise their IP address ranges and determine the best paths for traffic to flow between them.  Understanding BGP is critical for large organizations that manage their own IP address space and need to ensure their network is reachable.
* **IP Address Leasing:**  In cloud environments, public IPs can often be leased and associated with different virtual machines or services on demand. This allows for efficient utilization of IP addresses and provides flexibility for scaling resources up or down.

# Private and Public IPs Working Together

* **NAT Traversal Techniques:**  Applications that require inbound connections (e.g., peer-to-peer file sharing, VoIP) often struggle with NAT. Techniques like STUN, TURN, and hole punching are used to overcome these limitations.
* **VPN (Virtual Private Network):** VPNs create a secure tunnel over a public network, allowing you to access a private network remotely. This extends the reach of a private network and allows devices with different public IPs to communicate as if they were on the same LAN.
* **SD-WAN (Software-Defined Wide Area Network):** SD-WAN uses software to control network traffic and optimize connectivity across multiple locations.  It can intelligently route traffic based on application performance, cost, or security requirements, and it often involves managing both private and public IP addresses across different WAN connections.

Understanding these more advanced concepts of private and public IP addressing provides a clearer picture of how networks operate in the real world, especially in complex environments like cloud platforms, large enterprise networks, and the internet itself.


# Web Security

- First thing that you need for hosting a website is *domain name*, say mrdhvi.in, so what we need is that we need domain name that will be mapped with an IP address of the web server but it is not complusory to have a domain name, domain name only provides an sense of identification for the website, though it can run on IP alone also.

Note* You can go through internetarchive.org is the website, meaning it is where data will always be there if once there was data on the internet. 

Note* You need answers to the question such as authentication, and how to achieve the authentication and how you ensure comliance and ***File Permission sticky bits***. Now how do you ensure data integrity and therefore you need to use ***Checksum or Hash Algorithm***, in linux there are utilities to check te value of file.

Note* Non-Repudiation, meaning that whatever action a user is performing, he cannot deny that all those operations wern't perforemd by him. This is basically sed in backing sectors, the frameworks that are used are called ***Data Non-Repudiation***.

- Next, big thig is when we talk about **Network-based Attack**, another could be **Host-based attack** or it can be an **Application-based Attack**, it could be deskotop app, mobile app, or these multiple kindo of attacks are called, Arrack. THen thre is **RFID plannner**, that projects the employee after

Note* If you want to see what is gttign downloaded from the **torrent** and you can see this using the website whatdidyoudownload.com that will give you the information. 


# Network Adapters: Basic Concept

Let's break down the differences between NAT, Bridged, and Host-only networking in the context of virtual machines (VMs).  These options determine how your VM connects to the network and interacts with other devices.

**1. NAT (Network Address Translation):**

* **Basic Idea:**  NAT creates a private network for your VMs, isolated from your host machine's network.  It acts like a router, sharing your host's internet connection with the VMs while shielding them from direct access from the outside world.
* **Logical Implementation:**  Your VMs get private IP addresses (typically in the 10.0.0.0/8, 172.16.0.0/12, or 192.168.0.0/16 ranges). When a VM wants to access the internet, the NAT device translates its private IP and port to the host's public IP and a different port.  Incoming connections are similarly translated back to the correct VM.
* **Connectivity:**
    * **VM to Internet:** Yes (through the host)
    * **Internet to VM:** No (unless port forwarding is configured on the NAT device)
    * **VM to Host:** Yes
    * **Host to VM:** Yes
    * **VM to VM (on the same host):** Yes
    * **VM to other devices on the host's network:** No (unless port forwarding is used)
* **Use Case:** Ideal for general internet access from the VM, testing software, and development where external access to the VM isn't required.

**2. Bridged Networking:**

* **Basic Idea:**  The VM acts as if it's a completely separate physical device on the same network as your host. It gets its own IP address on the LAN and is treated like any other computer.
* **Logical Implementation:** The VM's virtual network interface card (vNIC) is directly connected to the host's physical NIC.  The VM obtains an IP address from the DHCP server on the LAN, just like your host and other devices.
* **Connectivity:**
    * **VM to Internet:** Yes (directly)
    * **Internet to VM:** Yes (if firewall rules allow it)
    * **VM to Host:** Yes
    * **Host to VM:** Yes
    * **VM to VM (on the same host or different hosts):** Yes
    * **VM to other devices on the host's network:** Yes
* **Use Case:** Best for situations where the VM needs to be a full participant on the network, such as running a server, accessing network shares, or interacting with other devices on the LAN.

**3. Host-only Networking:**

* **Basic Idea:** Creates an isolated network between the host and the VMs on that host.  The VMs can communicate with the host and each other, but they are completely isolated from the external network.
* **Logical Implementation:** A virtual network adapter is created on the host, and the VMs connect to this virtual network.  No routing or NAT is involved.
* **Connectivity:**
    * **VM to Internet:** No
    * **Internet to VM:** No
    * **VM to Host:** Yes
    * **Host to VM:** Yes
    * **VM to VM (on the same host):** Yes
    * **VM to other devices on the host's network:** No
    * **VM to VM (on different hosts):** No
* **Use Case:** Useful for creating a secure and isolated environment for testing, development, or running services that should not be accessible from the outside world.


**Summary Table:**

| Feature        | NAT             | Bridged         | Host-only        |
|----------------|-----------------|-----------------|-----------------|
| IP Address     | Private        | Public (LAN)   | Private (isolated)|
| Internet Access | Yes (via host) | Yes (direct)   | No              |
| Network Visibility | Limited       | Full            | Host & VMs only |
| Isolation      | High            | Low             | Very High       |


Choosing the right networking mode depends on the specific needs of your virtual machine. Consider the level of network access, security requirements, and interaction with other devices when making your decision.


### Concept on Apache2 web server

- If you need to see the log of the requests that were send to the server, you can do that using the follwoing file **access.log**.

```
cat access.log
```

If you check the request when you accessing the website

# Activity

- Need to perform the social Engineering such that people could recognise it and click the link. See what kind of information are getting displayed.
- Another is create a basic website that accepts the login credentials and then redirect the page infront.
