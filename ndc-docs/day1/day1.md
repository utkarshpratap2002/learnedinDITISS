# Importance of Security

There is high amount of traffic that hits the application that is developed by IT proffessional, this traffic is not what you think it is. Basically these traffic can be human as well as bot traffic, currntly the reatio of traffic is 42.8% are humans and 52% traffi cis generaed by bots and therefore say WWW is not world Wide Web, but it is *Wild Wild West*. 

*How to define security?* Administrators are suppose to look for the state of well being for the security, next administrators are suppose to be prepared for any kind of unexpected situation.

*How do you define Information Security?* It involves **Policies**, **Procedure** and **Practices** to ensure the **Integrity**, **Confidentiallity** and **Availability**. 

# Case Study: Ariane 5

*The Developer didn't knew the secure Programming*. 

# Vulnerabilty

- **Design Vulnerability** - Such as TCP/IP Stack weakness and therefore we are developing IPSec, DNSSec.

- **Implementation Vulnerabilty** - This includes Buffere Overflow.

- **Operational/Configurational Vulnerability** - Instructional were clear, but failed to straight-a-way implement it.


### Quality-of-Service (QoS)

### Exposure

This is about the relvealing the sensitive information and that when it comes to 

### Counter Measure

### Fus Triangle

- **Security**
- **Usability**

### Defense in Depth

This is called the elsatic defense/ Castle defese. Military strategy which will remove the 

# Wireshark

Wireshark is basically using the Npcap Library that is being used for the installtion for and working Wreshark.

- **Linux** - Libcap

- **Wireless** - Aircap

- **Windows** - wincap, npcap

- There are three windows, one is packet list, packet details and packet bytes. 

- There are two kinds of filtering, one is **capture filter** and **display filter**. 
  - The Capture filter is one that matches the condition and allows and deny the traffic at the door incomming itself.

  - The Display filter displays the packets captured based on parameters applied. This is the one that shows the traffic.

# Hash Function

What is Hash Function?

You can send the file using the following comand.

```
md5sum * > hash.md5
```

If you need to check the file, you can do that using the following commnand.

```
md5sum -c hash.md5
```

Remember that this is only about generating the hash codes for files, these hash codes are for the files and only, they won't wok on the directories, becuase for directories they need to first zipped using **`zip`** command.  And then you can do the necesary hashing. 

# Hash Collision

Often when using the MD5, we can see that the hash value comes to be same, hash value can be similar and the hash value for two different files can be same. Therefore, it is not recommended to use the MD5 in real world. You can use sha256sum for the same. 

# What is `tcpdump`?

It is important to know that `tcpdump` extracts data from almost all the layer of OSI modal, and therefore it is important to know becuase it is capable of collecting data from all layers of OSI Modal.

```
/etc/apt/source.list
```

```
deb [trusted=1] htp://sunebam.shuharilabs.com/sw/repo/deb12/ bookworm main
```

Now install the `tcpdump`, you need to install this software and reach out to it. 

```
sudo apt-get install tcpdump
```

Now when we talk about `trusted=1`, we will be watching this in the future when we'll be looking at the **PKI** Module.

Use the following command to capture the traffic through the interface you  are using, it could be ethernet or wireless. 

```
sudo tupdump -i eth0 -v 
```

We studied about fiters in wireshark, in this case we don't have it. We need to understand that we can run similar in this case.

```
sudo tcpdump -i ens33 udp
```

Now you can also do the same thing in 

```
sudo tcpdump -c 2
```

When we go for the traditional paradigm we get to see the ssh, meaning it is looking for the name resolution for the identification of IP, but you can prevent that by doing the following.

```
sudo tcpdump -c 4 -n
```

Use the following command 

```
sudo tcpdump -c 2 -w hello.world

# Ping the domain
sudo tcpdump - 

# To accept the responses from a particular IP only.
sudo tcpdump -i ens33 host <ip-address>

```

```
tcpdump host 192.168.68.1

tcpdump dst host 192.168.68.134

tcpdump src host 192.168.68.134

tcpdump port 22
d
tcpdump src port 22

tcpdump dst port 22
```

```
# Basically it will be capture the traffic form the eth1 

tcpdump -i eth1 '((tcp) and (port 80) and ((dst host 192.168.1.254) or (dst host 192.168.1.200)))'
```

In order to look the **packet** in hexadecimal format, go for this.

```
sudo tcpdump -c 2 -xxe
```

The above gave the full packet, but you can filter that too, you can filter the packet based on size.

```
sudo tcpdump -c 2 --xxe -s 4
```

