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

# Purpose 

- What is the purpose of the attack, therefore, you need to consider the end result as well as purpose of attack. The Email and Phone Number of Educator: *acharya.nisarg.a@gmail.com*, *+91-9722805484*.

- You can go to haveibeenpawned.com so that you can know what is going on with your data.

# Difference between Private IP and Public IP

# Web Security

- First thing that you need for hosting a website is *domain name*, say mrdhvi.in, so what we need is that we need domain name that will be mapped with an IP address of the web server but it is not complusory to have a domain name, domain name only provides an sense of identification for the website, though it can run on IP alone also.

Note* You can go through internetarchive.org is the website, meaning it is where data will always be there if once there was data on the internet. 

Note* You need answers to the question such as authentication, and how to achieve the authentication and how you ensure comliance and ***File Permission sticky bits***. Now how do you ensure data integrity and therefore you need to use ***Checksum or Hash Algorithm***, in linux there are utilities to check te value of file.

Note* Non-Repudiation, meaning that whatever action a user is performing, he cannot deny that all those operations wern't perforemd by him. This is basically sed in backing sectors, the frameworks that are used are called ***Data Non-Repudiation***.

- Next, big thig is when we talk about **Network-based Attack**, another could be **Host-based attack** or it can be an **Application-based Attack**, it could be deskotop app, mobile app, or these multiple kindo of attacks are called, Arrack. THen thre is **RFID plannner**, that projects the employee after

Note* If you want to see what is gttign downloaded from the **torrent** and you can see this using the website whatdidyoudownload.com that will give you the information. 

# Installation of Kali

- When you need to download the Kali Linux, you are to download the linux server that will 

# Network Adapter in VMWare

Go to the Help Mannual page of the VMWare, and three yo can find the network adapter in VMWare.

### Network Adapter in Virtual Box

1. Internal Adapter
  - All the virtual machines within the same Virtual Machine, say Red Hat and Ubuntu, than that means only the Virtual machines can be 
2. Bridge Adapter
  - A bridge is the kind where all the machines will be treated as individual network adapter. The the Router providing the IP addresses to the local machine, the Virtual machine will start acting as individual machine.
3. Host Only
  - If you only want to communicate with the local machine only. Thus, it could be on that you only want to make communication between Virtual Machine and Host Machine. 
4. NAT
  - In case of NAT there is internet connection between the Virtual Machines, thus this is how it differs from the Internal Network.
5. NAT Network

### Concept on Apache2 web server

- If you need to see the log of the requests that were send to the server, you can do that using the follwoing file **access.log**.

```
cat access.log
```

If you check the request when you accessing the website

# Activity

- Need to perform the social Engineering such that people could recognise it and click the link. See what kind of information are getting displayed.
- Another is create a basic website that accepts the login credentials and then redirect the page infront.

# Try Performing

- MySQL Injection
- Brute Force Attack
- 