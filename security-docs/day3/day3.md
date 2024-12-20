# Social Engineering

Whom you are sending the link, getting the location, getting the username and password with the friend and connected over the facebook, and the very reason why we are trying to do this is to let people reveal their credential, and therefore we can define, social engineering is the *art of convincing people to reveal their confidential information*. So social engineering is about identifying the people who are not aware of the technolgy and therfore we can use this. Another part of it is that **Information**, from where you are going to utilise the information, meaning you need to think and analyse from where you are going to get these information. 

The Impact of attack on organisation could be very serious as it could include Economic Loss, Loss of privacy, Lawsuit and arbitration and Dangers of Terrorism. We are are not only talking about the impact, but we are also talking about awareness.

- All our data is breached, but what we see is that we are secure on our individual devices, as that is not real. 

# Phases of Social Engineering Attack

The First thing is you need to consider each and every information where first you need to start the **research**, meaing **research of the organisation**. 

- You need to perform the few activities, such as visit the companies scenario.
- Select the Victim, meaning identify the frustrated employee of the target company.
- Then you need to develop the relationship withthe selected employees and therefore all of this to get the information out.
- Exploit the relationship and collect the information.
- Dumster driving
- Reverse social engineering
- Piggybacking 
- Taigating

# Computer Based Social Engineering Attack

Phishing has various names and you can also calle it branch spoofing and scan to seatl valuable infromation such as credit cards, social secirity numbner, user IDs, passwords. Official-looking emails sent to potential victims, that pretends as if their ISPs and retail stoers are sending these emails to them. 

You need to start by making an environement where you can decide what kind of information you need to build the story. So what you need to do is that you need to first gather information, and what kind of information would be needed in order to create.

# WireShark

*So can you see the Network Traffic from the wireshark?* 

*How can you capture the three way handshake?* YOu first need to capture for a particul IP address for the, say any website for the inspection.

- First take the IP address of the website, and then go and use the Browser and then try looking for the website.
- Go to the website, meaning when you'll be trying to making a connection with the website, you'll notice the first three messages are **SYN** messages, such that these are establishing the connection with the webiste on dst IP address.

Remember that you can also sniff the data if you are sending a website that is running on your localhost and then you can sniff the username and passwords from the website, using WireShark. 

```
# What does this do?
ss -antp
```

# Preferences in WireShark 

- You can configure your pane in wireshark with multiple options like, how you want to see the informations, which is devided into three Pane.

- You can also add **Delta Time**, meaning it tells what is the time gap between the two. 

- You can also add your coloring rules, for example for TCP SYN as well filter traffic using the following scenarios. 

1. **Using the filter box:**

   * The easiest way is to type `icmp` in the filter box at the top of the Wireshark window and press Enter. This will display only ICMP packets.

2. **Using more specific filters:**

   * `icmp.type == 8`: Filters for ICMP Echo Request (ping) packets.
   * `icmp.type == 0`: Filters for ICMP Echo Reply (ping reply) packets.
   * `icmp.code == 0`:  Filters for ICMP packets with code 0 (often used with Echo Request/Reply).
   * `icmp.type == 3`: Filters for ICMP Destination Unreachable packets.  You can further refine this by filtering on specific codes (e.g., `icmp.code == 1` for Host Unreachable).
   * `icmp.type == 11`: Filters for ICMP Time Exceeded packets.
   * `icmp.checksum_bad == 1`: Shows ICMP packets with invalid checksums.


3. **Combining filters:**

   * You can combine filters using logical operators:
     * `icmp and ip.src == 192.168.1.10`: Shows ICMP packets from source IP 192.168.1.10.
     * `icmp.type == 8 or icmp.type == 0`: Shows both ICMP Echo Request and Echo Reply packets.
     * `icmp and not ip.dst == 192.168.1.1`: Shows ICMP packets *not* destined for 192.168.1.1.

4. **Using the Expression Builder:**

   * For more complex filters, use the Expression Builder (from the main menu: Analyze > Display Filters > Expression...).  This provides a graphical interface to build filters using various fields and operators.

5. **Applying filters from the packet details pane:**

   * Right-click on a field in the packet details pane (the middle section of the Wireshark window).  Select "Apply as Filter" > "Selected." This applies a filter based on the selected field and value.


This can be an help for troubleshooting network connectivity, filtering for ICMP destination unreachable or time exceeded packets can help pinpoint network connectivity issues. Thus, analyzing ping traffic, filtering for `icmp.type == 8` (Echo Request) and `icmp.type == 0` (Echo Reply) is useful for analyzing ping traffic. Security analysis, filtering for specific ICMP types can be used to identify potential network reconnaissance or denial-of-service attacks.


# OSINT

It's a *resource* that organizes and categorizes publicly available information sources and tools that can be used for Open Source Intelligence (OSINT) gathering.  It doesn't perform any actions itself; it simply provides links and information about resources that security professionals, researchers, investigators, or anyone interested in OSINT can use.

The website ([https://osintframework.com/](https://osintframework.com/)) is a web-based interface that presents a structured collection of OSINT resources. It's organized into categories based on the type of information you're looking for (e.g., usernames, email addresses, domain names, IP addresses, social media profiles, public records).  When you select a category, the framework displays a list of relevant websites, tools, and databases that can be used to gather that type of information.

* Organization, The framework's primary value is in its organization. It provides a structured way to navigate the vast landscape of OSINT resources.
* Categorization, Resources are grouped by information type, making it easy to find tools for specific OSINT tasks.
* Free Resources, The framework focuses on free or partially free resources.
* Community-Driven, The framework is constantly updated with new resources and contributions from the OSINT community.

**How OSINT Relates to Breaches (Indirectly):**

While the OSINT Framework doesn't directly perform breaches, the information gathered through OSINT can be *used* in various stages of a security assessment or investigation, including:

* **Reconnaissance:**  OSINT is crucial for the reconnaissance phase of a penetration test or security audit.  It helps identify potential vulnerabilities, exposed systems, and information about the target organization or individual.
* **Social Engineering:**  Information gathered through OSINT can be used in social engineering attacks, where attackers use psychological manipulation to trick people into revealing sensitive information or performing actions that compromise security.
* **Phishing:** OSINT can help attackers craft more convincing phishing emails by providing details about the target, making the emails appear more legitimate.
* **Incident Response:** OSINT can be used during incident response to gather information about the attacker, the nature of the attack, and the extent of the compromise.

Refer to [**SquareX**](https://sqrx.com/about) to learn more about it.


# Basic Things Required Everywhere in Cyber Security

Below are the most important topics of the 

- IPv4 Addressing - Classes, Loopback ranges, Private IP ranges, and Subnetting and Calculation. Identifying IP, default gateway, DNS server, Alternate DNS server, DHCP.
- Alternate IP Configuration (In Windows).
- OSI, TCP/IP Modals
- Router, Switches, Repeaters. Networking devices.
- IPv4 Header and Ethernet
- Finger Commands
- Wireless Wifi, and Ethernet working.
- Public IP, Private IP and Static and Dynamic IP.
- IP, MAC, and Port Numbers

When talking about the Linux, you need to take all that there is about the FHS (File Hierarchical System), need to read from the resources *fhslinux.com*
