### Reserved Address Spaces

- **Private Address Series** 
  - 10.0.0.0/8 (10.0.0.0 - 10.255.255.255)
  - 172.16.0.0/12 (172.16.0.0 - 172.31.255.255)
  - 192.168.0.0/16 (192.168.0.0 - 192.168.255.255)

- **Multicast Address** - 224.0.0.0 to 239.255.255.255

- **APIPA (Automatic Private IP Addressing)** - 169.254.0.0/16

- **Loopback Addresses** - 127.0.0.0/8

### Port Numbers

- FTP 
  - FTP data - 20
  - FTP control - 21
- SSH - 22
- Telnet - 23
- SMTP - 25
- HTTP - 80
- POP3 - 110
- HTTPS - 443

### RIP 

- **Update timer** - Every 30 Sec routing table is sent to the neighbour to ensure the Network Topology remains updated
  - Updates send on **Broadcast address** **`255.255.255.255`** in RIP
  - Updates send on **Multicast address** **`224.0.0.9`** in RIPv2
- **Hold-on/Invalid timer** - If Update is not recieved within **180 Sec**, the router is marked to be invalid.
  - Hold-on timer in used in **Hold-down** time, waiting until 180 sec to confirm the decision to be taken on the network. After that the route is marked **Invalid**
- **Flush timer** - After waiting for 180 Sec, the network is flushed after waiting for any update in **240 Sec**, thus this 240 Sec also include 180 Sec from Hold-on timer.

### OSPF

- ***hello*** Timer - every 10 sec
- **Dead** Timer - every 40sec 
- **LSA** Age Timer - 30 min

- LSAs are multicasted as **`224.0.0.5`** to all the OSPF routers
- The updates to **DR** and **BDR** are send at **`224.0.0.6`**

### NAT 

- `ip nat inside`
- `ip nat outside`
- `ip nat inside source static` *inside local* *inside global*
- `ip nat pool` sunbeam *starting-address* *ending-address* `netmask`*subnet-mask*
- `ip nat inside source list` *number* `pool`*name*  

