### BeVigil 

BeVigil is one of the sources that is used in order to test 

### `which theHarvester`

It is an open-source intelligence (OSINT) tool that is used for information gathering, developed in Python, and that is passive tool that uses public information to harvest the information. 



*Check for search engine hacking* to learn in deep about information gathering to go into more details about how different aspect of this come together. **The point is**, it gathers information from various resources such search engines, PGP, linkedin, google and others. 

```
sudo theharvester -d microsoft.com -l 500 -b duckduckgo
```

The above command means that the source is duckduckgo (which is the publicly available) and microsoft.com is the target, and it will execute upto 500 results.

Users can fine-tune their searches by specifying the target domain, data sources, and the type of information they seek. This flexibility allows for precise and targeted data retrieval.

You can use various sources to get more information and that when it comes to information gathering you change the source to get different information.

### IntelligenceX

It is one of the source that will give you the data that has breached. Go to [Intelx.io](https://intelx.io/?s=itsutkarshpratapon%40gmail.com) if you feel like looking into it.

###  `which nmap`

This is to identify the vulnerability in the infrastructure, or when you are working with network vulnerability, it is an open source tool for inspection of the infrastructure flaws. It is designed to scan large networks, while it is used by network administrators but sometimes it is used for auditing as well. 

Use the following command in order to s an the OS dependent services working over the network. It is the fingerprinting tool that leaves the footprints of the nmap and therefore it is not recommended.

```
nmap -A 192.168.0.116
```

Use the following command to ping without giving the ping or say without using for the discovery protocols.

```
nmap -Pn 192.168.0.116
```

Use the following ping command to know what are the devices that are active on the network, meaning it will list all the *pingable* device on the network.

```
sudo nmap -sp 172.16.0.0/21
```

# Information Technology Act, 2008

Every country has its own law and therefore it is important to know what kind of law the country is following in respective of the Cyber Security.



