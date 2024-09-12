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
* What happens is that it creates a broadcast strorm.
* Routers seperate collison domains as they tend to seperate the collison domains into seperate networks, and this prevents the collison domain.

<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>What is collison domain?</strong>, A collison domain is where multiple frames collide within the same network. When two frames form the same network comes together, collison happens
</div>
<br> 
<br>

![alt text](Diagrams/day3.png)

