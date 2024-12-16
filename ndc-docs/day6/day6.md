# Firewalls

It is basically a unit (hardware or software) that is used to allow the authorised traffic and block the unauthorised traffic, based on company's policy. Like a security gaurd who only permits the authorised traffic and deny everything else.

Firewalls too can be classified based on **Architecture**. There can be,

- **Single Tier** - A firewall that sits between your internal network and external network (usually internet). Single Tier firewall does nothing but packet filtering inside the NAT or internal network. 

<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>Note: </strong> Take a moment to understand what is the LAN and DMZ, what is the basic difference? DMZ is the internet facing zone that sits between the external as well as internal firewall, and LAN is internet accessible zone that allow users to access the internet but not internet facing. 
</div>
<br> 

- **Two Tier** - There are three cables connected, one internally to the LAN and DMZ and another firewall connected to internet. Thus, DMZ is nothing but another LAN with specific policies applied that seperates it with internal network. 


- **N-Tier** - A large enterprise might use an N-tier architecture with separate firewalls for different departments or security zones (e.g., HR, finance, research and development). This allows for very specific security rules to be applied to each zone, minimizing the impact of a security breach in one area on other areas of the network. Another scenario involves using multiple firewalls from different vendors to defend against vendor-specific vulnerabilities.

Another distinction that can be made is the based on **Type**. Basically Hardware Firewall and Software Firewalls. Both of the firewalls works on Network layer 

- Hardware Firewalls

- Software Firewalls

Firewalls can be differentiated based on the **Implementation Methodology**.

- **Permit all (by default)**
  - and explicitly denying

- **Deny all**
  - and explicitly permitting

Firewalls can be defined based on Filtering Techniques. 

- **Packet Filtering**, these are regular firewalls, meaning the one that are 

<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>Note: </strong> What if someone asks you about the Network and Transport layer. When it comes to network layer, meaning we are talking about IP addresses, and when transport layer, we are talking about Port numbers.
</div>
<br> 

- **Application Proxies**

<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>Note: </strong> Firewall that we are talking about is the concept, concept of restricting traffic and allowing the traffic, meaning it is functionality of device to do that. When it comes router, it's base functionality is to route the traffic. ACLs is just the firewall functionality inside the router. Router's base functionality is routing only.

When it comes to OSI layer, meaning when it comes to 
</div>
<br> 

# `iptables`

Linux has a built in firewall, technically it is known as iptables/netfilter, iptables works on user space modules and netfilter works on kernel space modules. This is related to 

Iptables consists of tables which are collection of chains, these chains are storing the rules, these chains collection make rules. Each 

There are five default tables. **Filter**, **NAT**, **Mangle**, and **RAW** and **Security** tables. Out of these **Filter** table is used for firewalls and packet handling.

**Filter** Tables - It consists of three chains, *input*, *output*, and *forward* chains.
  - **Input** chains configure the 
  - **Output** 
  - **Forward**

Lets now talk about the important rules of define the rules. 

- Once a rule is forwarded, the following rules are denied and won't be executed. 

- If any rules is not matched with the table, there are dfefault set of rules to make either allow or deny.      

# Stateful Packet Inspection

- Allows all outgoing connections

- Block all unwanted incomming connections

# Firewall LAB

We are going to connect two machine deb1 (192.168.80.128) and deb2(192.168.80.130). First you all have to six test.

- First test the self connnection test. deb1 -> deb1, deb1 -> deb2, and deb2 -> deb3.

```
ssh shuhari@127.0.0.1

ssh shuhari@192.168.80.130
```

- Second we'll install a link to check the browser client for deb1 and deb2.

```
sudo apt update  # Update package lists
sudo apt install links
```

- Install the apache2 on both the machine, change the default homapage of the deb1 and deb2. Check that there is no restriction deb1 and deb2 is able to connect.

- **Install iptables**, use the follwoing commands for the installation.

```
sudo apt install iptables

which iptables # check iptables is installed
```

- Check the default iptables, the default policies will be accepts, as we discussed. 

```
sudo iptables -L
```

- Change the default policy of the iptables. Though after this command the connection we are using which is the remote connection using ssh will be dropped.

```
sudo iptables -P INPUT DROP
```

- After the connection drops, move to the actual machine and carry on with the configuration ahead with that. Before going ahead check the iptables once more.

```
iptables -L
```

- Now change the Forwarding chain rule.

```
iptables -P FORWARD DROP
```

Now we will start writing the rules, because we need to append the 


- Add the rule to the INPUT for the loopback service, thus assign ACCEPT target for the loopback. 

```
iptables -A INPUT -i lo -j ACCEPT
```

<br>

<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>Note: </strong> We must know the basic of network establishment, where one machine first sends the SYN packages to destination machine, then dst machine sends the SYN/ACK thus, the after the src machine will sends the ACK message for the connection establishment.
</div>
<br>

# Stateful Packet Inspection

Using this method what we fullfil the required 

```
iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
```

Now we want to allow th traffic on destination port such that we can use ssh from our local machine.

```
iptables -A INPUT -p tcp -dport 22 -j ACCEPT
```

Use the `-v` verbose to see more details in order to inspect.

```
iptables -L -v
```

Another requirement is to allow the specific IPs only, in that case what can we do, is automation. Therefore, create the file fw.sh as done below and assign it the permission and run the file.

```bash
#!/bin/bash

iptables -F
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP

iptables -A INPUT -m state ... # done this earlier

# Allow specific IP only
iptables -A INPUT -s <base-machine-ip-address> -p tcp --dport 22 -j
```

You can also delete the rules using the following commands.

```

```

# Making Rules Permanent

- Create the directory with names iptables.

- Now save the iptables inside the rules.v4

```
sudo sh -c  "sudo iptables-save > /etc/iptables/rules.v4"
```

- Now install the iptables-persistence.

```
sudo apt-get install persistence
```

