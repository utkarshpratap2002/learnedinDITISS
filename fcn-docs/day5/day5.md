### DHCP

There are few elaboaration within the DHCP. 

- If the person requested the IP and after few minutes he left the network, does that mean that IP will remain leased to that person for the three days?
- No, The leased period is to be defined based on **usage**, so the amount of usage defines what should be the period of the DHCP, or the leased time the IP will remain assigned.
- Back in <>, there was the time when DNS went blank and all the IP address were thrown away and all the **windows** machines they assigned themselves APIPA, and they were able to communicate with each other. But no other machine was able to connect with internet.

Machines sends unicast until the 97.5% of time is over, because after that the machines start sending braodcast request to all the other machines and that was where the DHCP wasn't responding and that was where all the IPs were thrown away and all the Windows above 98 were able to assign themselves APIPA.

### what is Y-to-K Project?


### Tree Architecture

Tree architecture is very important as it tells on which transport layer protocol the configurations are to be made. 

- Remember that IP address is composed of three parts
  - ARP
  - RARP
  - BootP, basically it asks for the MAC address and sends the IP address, used by DHCP
- Proxy ARPs work in different fashion as they fool the PCs into sending them the packets so that it can finally go the routers instead of configuring the default gateway of the routers. Default gateway is to be configured on the PCs that if that router is down, the network won't send the message via another one, this is why, the **Proxy ARP** allows to packets to go through the router that is available and any router can carry onto the servers.
- `ping` and `trace` cmd is ICMP (Internet Control message protocol)cmds. On windows it is `traceroute`

*How does `trace` works?* `trace` is multiple pings that is forwarded in order to trace the multiple paths down, that to know what path the packet is going through. This is done using TTL, which contains the number the of routers it has passed as it contains the number of routers that it has passed. **TTL** ranges to **255**.

<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>Note: </strong> ICMP all these are INternet Protocol, as we are getting into the 
We started with ethernet, it works with collision detection and prevention system, then we checked out that as you introduce more number of machiens, therfore switches came into picture, they learns the MAC address of switches. Network started expanding and all the MAC learning switches as it became a hurdle, there came Routers, so that they can work with hierarchical address, IP have network and another is host part. Router only understand networks, as there came OSI reference modal, and there are network layer and trnasport layer. 
We checked different protocols working protocols working on Transport and Network layer.
</div>
<br> 

### Cisco Router

Cisco Routers are the main router that every one inthe industry uses, everyone copies the same architecture. So we'll see that in later section.

Routers can be **Modular** or **Fixed**. Fixed interface routers are getting outdatted, Modular router are having three ports

- **WIC**, called WAN interface card, also called **2T**, first interface is referreded as S0/0 and S0/1, along with that there are three more ports, FastEthernet, Console port, Aux, in which Console is used to configure the Routers and that FastEthernet is used to transfer data only not configuring.
- Routers do have **Adapter**, in higher end router there are mother board in baselines, there are also connection where interfaces are something like this S0/0/0, or S0/1/1, meaning slots are there that have interfaces like this as mentioned.

- **ROM (BIOS has MiniOS and ROMMON, POST)**
  - This is typically the BIOS that opens up the CLI (called MiniOS or ROM MON), if the Router bootup fails, this is basically the failover OS.
- **FLASH (IOS Internetnetwork Operating system)**
- **NVRAM (startup configuation)**
- **DRAM**

If there is no startup configuration when booting up the router, that will start a GUI that will ask for question, like IP of something or other. Remember this happens only when unpacking the router doesn't find any NVRAM, this happens when startup conf is not there.

#### ROM 

<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>Note: </strong> The difference between the RAM and ROM, the memories are read and write but the memory in RAM is randomly accessed and the memory in ROM is sequentially accesses, as it can't go back into the fixed point of time, and can't read the part again, so it flows in sequential manner.
</div>
<br> 

#### IOS (Internetwork Operating system)

Cisco always believed on CLI, because it directly interacts with the routers, as GUI signals processed to the CLI and then it further goes to the BIOS, then it get to the microprocessors. SO directly connecting through CLI, there is no overload of operating system. 

- If you want an IP address to set on particular router, you can go to the prompt and there you open up another prompt where you can execute the prompt specific commands.
- You can also check for the help using `?`, say `enable ?`, or `show ?`, where `enable` is a command.
- If you don't remember the command, then you display all the commands using `e ?`, it will display all the commands starting with `e`
- You neeed to type the commands till the point they get unique, say if command id `enable`, you can use `en`, it will execute the `enable`, meaning it will execute the `enable` command.

*So how the prompts are arranged?* 

- The first one is console named as **con0**, **aux0**, then other is **vty** which can range 0-4, meaning that there can be 5 different types of routers.
- Ther is also interprising routers IOS that is there.
- At the first point of time, there can authentication called as **User-mode** password, it only through password, you'll be able to get into the router prompt.
- `enable` gives you a **enable secret** password, whcih is privelegded mode password.
- You can find administration mode after the `enable`, where you can perform different commands.
- Router's global configuration mode is opened after the command `conf t`

Commanly there are three modes:

- `Router(config-if)#` - Interface configuration mode 
- `Router(config-router)#` - Routing Protocol  
- `Router(config-line)#` - Line Configuration mode

<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>Note: </strong> There are different commands in different modes, as you can check that using the <code>?</code> cmd. In Cisco IOS all the parts of router works differently as you need to connec the routers as it is by default it is off. 
Remember that every cmd opens up with new prompt, the interface is shutdown so you need to open the interface to <strong>up</strong>, so you need to specify or use the command <code>no shutdown</code> it takes 50 seconds to comme everything to thr live. Note that <code>exit</exit> will bring you back to prompt and <italic>contorl+z</italic> will bring you back to privlegded mode.
Another thing is that you need to remember that you yourself need to remember that you are in which interface.
</div>
<br> 

### Cisco commands

- `show history` - Give the last 10 commands
- `terminal history size 25` - 
- `show terminal` - Show the commands that gives last 10 or configured commands
- `show version` - It shows all kinds of memory sizes, it displays IOS file name, ROM MON version, Interfaces, IOS file name, Configurational register value (0x2102), basically it defines your booting sequence.
- `show flash` - it display the IOS file name
- `conf t` - opens the prompt for interface configuration mode.
- `hostname _` - it initialises a name of the user
- `enable secret cisco` - where **cisco** is your password that is to enable password
- `show running-config` - It shows the running configuration
- `show statup-config` - It is to show the startup configuration

- let's talk about `login` after the configuration of the user and password, as it important, becuause lgoin will allow only the users that have password and therefore you need to login.

<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>Note</strong> There is info on routers that goes soemthinglike this, <strong>"flash:c1900" ... </strong> that say about the file that is there on the system as it 
It tells about the D-RAM, processor identification and lisence infor, and lastly there is configuration register value, that is booting up sequence. 
<code>show flash</code> is the command that allows you to see the IOS file name during tthe booting sequence.<code>hostname a</code> that is the user mode confuguration.
You are not suppose to forget enable secret password. 
</div>
<br> 

The Security feature in Cisco router:
- First the `enable secret` is encrypted and no one can see it as it always encrpyted
- Another is that it when you going to type the password, it won't show the number of letter yo types, it will remain hidden.

Some other commands that Cisco supports are as follow:
- there is a session timout command that allows the session timout configuration, using `exec-timeout 0 0`
- when you are trying to execute a command, if interrupted by any message, that command is basically restored and is given to you where yo got interrrupted, using `logging synchronous`.
- You can encrypt all the passwords, as you can go to the global configuration mode, and use `service password-encryption`, once it is encrypted forever, and you can also stop the encryption password, using `no service password-encryption`, but this doesn't mean that now yo can see password without encryption, this means that password is been encrypted but now that the service of password getting encrypted is not working anymore, now you need to go and change the password in order to see it. 

IP addresses can be configured on the interfaces of the Routers using cmd, `ip address 172.16.10.1 255.255.255.0`, as once you configure the ip address, you can go and save the configuration of the ip address configured.

Now if you `ping` within the network, you see the **TTL** as if there would be no router to be cross or passed, the TTL would be 255. If you try `ping` in the CLI, the success id represented using **!** marks.

Remember when you use `no shut` command, this parameter doesn't hamper the other commands that you perform in CLI, as it just switches on or off the doors for router.

