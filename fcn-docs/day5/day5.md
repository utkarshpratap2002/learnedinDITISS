### DHCP

There are few elaboaration within the DHCP. 

- If the person requested the IP and after few minutes he left the network, does that mean that IP will remain leased to that person for the three days?
- No, The leased period is to be defined based on **usage**, so the amount of usage defines what should be the period of the DHCP, or the leased time the IP will remain assigned.
- Back in 2000, when **DHCP** went blank and all the IP address were thrown away, as there wasn't any internet communication no machine were able to communicate across the local server. As there was local communication, all the **windows** machines they assigned themselves **APIPA**, and they were able to communicate with each other within the local server. But no other machine was able to connect with internet.

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
  - **ROM** typically has **BIOS**, that handles the basic input/output system. It consists of recovery CLI (a minimal operating system) called **MiniOS** or **ROM MON (ROM Monitor)**, if the Router boot-up fails, the failover OS starts.
  - **ROM** also has **POST (Power On Self-Test)**, meaning it checks the router's hardware components to ensure that all the functinality is working. 
- **FLASH (IOS Internetnetwork Operating system)**
  - **Flash** stores the **Cisco IOS (Internetwork Operating System)** image and other functionality softwares, which is loaded into the RAM in order to start the booting process, thus Flash is **non-volatile** memory, therefore, even if the Router is turned/switched off, the memory remains stored.
- **NVRAM (startup configuation)**
  - **NVRAM (Non-Volatile RAM)** stores the **startup configuration** while the router is booting up, router is able to reads it initial or startup configuration from the NVRAM as it storage remains even if the route ris turned off becuase it is non-volatile memory. 
- **DRAM (running configuration)**
  - **DRAM (Dynamic RAM)** stores the current running configurations while the router is running
  - The **Routing table** is stored in the DRAM
  - DRAM is like the working memory of the router, where all the working configurations are stored temporarily, such as Routing table, buffer and functionalities that router has to perform while it is powered on.
  - DRAM loses its memory when is shut down, so it loads the running configuration during the **boot up** process.
<br>

![alt text](router-arch.png)

If there is no startup configuration when booting up the router, that will start a GUI that will ask for question, like IP of something or other. Remember this happens only when unpacking the router doesn't find any NVRAM, this happens when startup conf is not there.

### Working of ROM, NVRAM, and DRAM

- **ROM (BIOS, ROMMON)** consists of basic instructions that runs **Sequentially**, meaning it can't get back once started, ensuring everything works as programmed, containing **BIOS** and **MiniOS**, and **ROM MON**, where **BIOS** runs the initial **boot-up** during the startup of the router.
  - If the startup file isn't available it'll open up the **MiniOS** where the startup can be proceeded using CLI.
  - Once the router is done with **boot-up**, router further move to **Flash memory** loading the **Cisco IOS** image and necessary functinality softwares
- **NVRAM (startup configuration)** is where the startup configurations are stored, when the boot process finishes, router loads the startup configuration from **NVRAM** to the **DRAM**, thus the memory is non-volatile, so it retains its data even after the router is powered off.
  - But Unlike BIOS, which is **Sequentially accessed**, it can be randomly accessed as the need to change the configurations while router is running, so in that case the memory needs to be **over-written** into the **NVRAM**
- **DRAM (running configuration)** stores the working configurations of the router. It loads the data from **flash memory** and **NVRAM** to run those programs and configuration during the router is getting operated. 
  - As the DRAM is **randomly accessed** like NVRAM, but it is **volatile**, meaning all configurations will be lost once the router go off, that means the data has to be **written** into the **NVRAM** manually, meaning it has to be **saved** manually into the **NVRAM**, if you want to persist with the configuration ahead.


<br>
<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>Note: </strong> The difference between the RAM and ROM is that the memories can be read and writen in both but the memory in RAM is <strong>randomly accessed</strong> and the memory in ROM is <strong>sequentially accessed</strong>, as it can't go back into the fixed point of time, and can't read the read part again, so it flows in sequential manner.
</div>
<br>

#### IOS (Internetwork Operating system)

Cisco always believed on CLI, because it directly interacts with the routers, as the instructions on **GUI** are processed to the **CLI** and then it takes those instructions further to the **BIOS**, then it get to the microprocessors. So directly connecting through CLI, there is no overload of operating system. 

- If you want an IP address to set on particular router, you can go to the prompt and there you open up another prompt where you can execute the prompt specific commands.
- You can also check for the help using `?`, say `enable ?`, or `show ?`, where `enable` is a command.
- If you don't remember the command, then you display all the commands using `e ?`, it will display all the commands starting with `e`
- You neeed to type the commands till the point they get unique, say if command id `enable`, you can use `en`, it will execute the `enable`, meaning it will execute the `enable` command.

*So how the prompts are arranged?* 

![alt text](cisco-router.png)

- The **line console** that is **con0**, **aux0**, then other is **vty** which can range 0-4, meaning that there can be 5 different types of routers line configuration ports, These ports are used for the configuration of Routers. So you can use `line console`
- At the first point of time, there can authentication called as **User-mode** password, it only through password, you'll be able to get into the router prompt.
- After `enable` you can give a **enable secret** password, which is privlegde mode password, it will ask for authentication to enter into the global config mode.
- You can find administration mode after the `enable`, where you can perform different commands.
- Router's global configuration mode is opened after the command `configure terminal`

Commanly there are three modes:

- `Router(config-if)#` - Interface configuration mode 
- `Router(config-router)#` - Routing Protocol  
- `Router(config-line)#` - Line Configuration mode

<br>
<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>Note: </strong> There are different commands in different modes, as you can check that using the <code>?</code> cmd. In Cisco IOS all the parts of router works differently as you need to turn the routers on by using <code>no shutdown</code> as by default it is off. 
So you need to specify or use the command <code>no shutdown</code> it takes 50 seconds to comme everything to the live. Note that <code>exit</code> will bring you back to prompt and <italic>control+z</italic> will bring you back to privlegded mode.
Another thing is that you need to remember that you yourself need to remember that you are in which interface, as when you use <code>int g0/1</code>, there won't be any clue to which interface you are logged in, so take a note of interface while you are making interface specific configuration.
</div>

### Cisco commands

- `configure terminal` - opens the prompt for global configuration mode.
- `hostname` *name* - it initialises a name of the user
- `enable secret cisco` - where **cisco** is your password that is to enable password
- `show history` - Give the last 10 commands
- `terminal history size 25` - it sets the desired size for the history commands 
- `show terminal` - Show the settings that are session related like **line settings**, **timeout settings**, and others. 
- `show version` - It shows all kinds of memory sizes, it displays IOS file name, ROM MON version, Interfaces, IOS file name, Configurational register value (0x2102), basically it defines your booting sequence.
- `show flash` - it display the IOS file name
- `show running-config` - It shows the running configuration
- `show statup-config` - It is to show the startup configuration
- **`login`**, after the configuration of the user and password, as it important to set a user verification at the terminal session, becuause login will allow only the users that have password and therefore you need to login.

*What is `show flash` cmd?* It is the command that shows the current status and file stored in the router's flash memory. It is very useful as it helps to see whether the **Cisco IOS** is installed in the memory and how much **storage space** is available in the memory. You'll see the list of files that there in the flash memory:

```
cisco>show flash

System flash directory:
File  Length   Name/status
  3   33591768 c1900-universalk9-mz.SPA.151-4.M4.bin
  2   28282    sigdef-category.xml
  1   227537   sigdef-default.xml
[33847587 bytes used, 221896413 available, 255744000 total]
249856K bytes of processor board System flash (Read/Write)
```
- **File number** - It list the sequence of files saved
- **File lenght** - This tells what is the size that the file is taking in the flash memory
- **File name/status** - This list contains the name of the file

The third section that specifies the name of file, `c1900-universalk9-mz.SPA.151-4.M4.bin` is the **Cisco IOS image** software running on the router, it specifies the lenght of the file that is `33591768` and some other security related files on file number 2 and 1.

The Security feature in Cisco router:
- First the `enable secret` is encrypted and no one can see it as it always encrpyted
- Another is that it when you going to type the password, it won't show the number of letter yo types, it will remain hidden.

Some other commands that Cisco supports are as follow:
- `exec-timeout` *minutes seconds* command interpreter wait for the time/interval you specify using this command until any user-input is not encountered. By default it is 10 minutes, but you can change it to seconds or minutes later using this command. Remember that this is **line configuration** specific command. This will open in **Line Configuration mode** only. 
- when you are trying to execute a command, if interrupted by any message, that command is basically restored and is given to you where yo got interrrupted, using `logging synchronous`.
- By using `service password-encryption` you can encrypt all the passwords, as you can go to the global configuration mode, once it is encrypted it is encrypted forever, even if you stop the encryption password, using `no service password-encryption`, this doesn't mean that now you can see password without encryption, this means now that the service of password getting encrypted is not working anymore, now you need to go and change the password in order to see it. 
- `ip address` *ip-address subnet-mask* is used to configure the IP address on the router, for example, `ip address 172.16.10.1 255.255.255.0`, as once you configure the ip address, you can go and save the configuration of the ip address configured.
- Now if you `ping` within the network, you see the **TTL** as if there would be no router to be cross or passed, the TTL would be 255. - - If you try `ping` in the CLI, the success id represented using **!** marks.

Remember when you use `no shut` command, this parameter doesn't hamper the other commands that you perform in CLI, as it just switches on or off the doors for router, which is important otherwise you won't see your routers getting on.