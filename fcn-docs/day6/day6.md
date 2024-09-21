### Cisco Commands

Let's start with **Routing** commands, which we'll see *how to configure, how to see the interfaces, and how to check what it the next networking device our router is connected to*.

- `show interface` *interface* - The message `GigabitEthernet0/0 is down, line protocol is down`, note that the first on **down** explicates the **physical** layer problem that has to be resolved, and another **down** says that there is problem in **Data link** Layer.
  - One major problem can be seen if there is a **physical** *up* and **data link** *down*, now that is the one which means that there is problem with the service, meaning there is some kind of mismatch, either **Clocking** or **Encpasulation**, or **Keepalives** 
  - Another situation is the one below, as if you didn't specifued the `no shutdown` you'll get **administratively down**

```
Router#show interface g0/0
GigabitEthernet0/0 is administratively down, line protocol is down (disabled)
```
  - You'll see another line `Hardware is CN Gigabit Ethernet, address is 0001.6422.a401 (bia 0001.6422.a401)` is the MAC address of the router, another is **BIA**, burnt0in address.
  - **Runt**, **Giant** - If the frame size is less that 64, meaning it is **Runt**, and if the frame is exceeds 1516 then it is **Giant**. 
  - Below is the output for **runt** and **giants**: 
```
Received 0 broadcasts, 0 runt, 0 giants, 0 throttles
```
  - **NIC Going Rouge** - Some times the NIC goes rouge, as it starts talking to itself, contineously sending 1s and 0s, in that case even switches will think of it the broadcast so it will think of these faults as **Broadcast**, so contineously they will keep sending the requests.
  - Either **Transivers**, meaning that there is some hardware fault in the NIC, or if there is some **virus** in the NIC, there will be situation where they'll go rouge.
  - Remember that in such case of runt and giants, you see two more parameters, **txload** and **rxload**.
```
reliability 255/255, txload 1/255, rxload 1/255
```

- `show ip interface` 
```
Router#show ip int
GigabitEthernet0/0 is up, line protocol is up (connected)
  Internet protocol processing disabled
GigabitEthernet0/1 is administratively down, line protocol is down (disabled)
  Internet protocol processing disabled
Vlan1 is administratively down, line protocol is down
  Internet protocol processing disabled
```
- `show ip interface brief` - it show all the ip configured or un-configured of all the interfaces
- `show protocol` - it list all the protocol working
```
Router#show protocol
Global values:
  Internet Protocol routing is enabled
GigabitEthernet0/0 is up, line protocol is up
GigabitEthernet0/1 is administratively down, line protocol is down
Vlan1 is administratively down, line protocol is down
```

**What is Configuration registration value?** Configuration register is found using `show version`, i.e., 
  - **Normal Boot** - `0x2102 - 0x210F` means everything is working in **Normal Configuration mode**.
  - **MiniOS Boot** - `0x2101` means the boot will happen through MiniOS
  - **ROM MON Boot** - `0x2100` means the boot will start from ROM MON 
  - **Ignore NVRAM** - `0x2142` tells router to **ignore** the NVRAM.

### Password Recovery

Before going ahead check [Router Architecture](../day5/day5.md#cisco-router), because **Cisco** propose the Password recovery procedure themselves which includes the skipping **NVRAM** such that our passwords are already saved within the `startup-config`, so we need to directly find our way into the `running-configuration`. 

**Password Recovery** could be performed using bypassing the NVRAM, i.e., startup configuration.

1. First you need to hit *Ctrl + break*
2. Enter the the **BIOS** or **ROM MON** CLI and you need to pass the command `configuration-register 0x2142`
3. Then enter *reset*, This will take you directly to the **setup**, becuase Router didn't find any **NVRAM**, follow [this](../day5/day5.md#cisco-router) to learn more.
4. Then you'll enter the **EXEC** mode and now reset the password starting with `enable`.
5. Then you need to `copy startup-config running-config`, so that you can recover the previous configurations stored before re-booting the router
6. Then go to **global configuration mode** using `configure terminal`
7. Enter the password, `enable password` *cisco*
8. Now restore the configuration register, using `configure-register 0x2101`
9. Now you need to copy the running configuration to the startup configuration as you've made changes to the password and this needed to be saved.
10. And you can `reload`.

### Cisco Discovery Protocol

Use `show cdp neighbour` to figure out the network diagram. It helps in troubleshooting **network topology**, you can check the networks and devices connected to the router or switches and can draw the network diagram. 

```
Router#show cdp neighbour
Capability Codes: R - Router, T - Trans Bridge, B - Source Route Bridge
                  S - Switch, H - Host, I - IGMP, r - Repeater, P - Phone
Device ID    Local Intrfce   Holdtme    Capability   Platform    Port ID
cisco        Gig 0/0          133            R       C1900       Gig 0/0
```

You can also check the `show cdp neighbour detail`, as it give furhter details about the devices you are connected to, meaning the **Version** of Cisco running, **Interface** that is connected, **communication type** as shown below:

```
#sh cdp neighbors detail

Device ID: A
Entry address(es): 
  IP address : 172.16.20.1
Platform: cisco C2900, Capabilities: Router
Interface: GigabitEthernet0/1, Port ID (outgoing port): GigabitEthernet0/2
Holdtime: 147

Version :
Cisco IOS Software, C2900 Software (C2900-UNIVERSALK9-M), Version 15.1(4)M4, RELEASE SOFTWARE (fc2)
Technical Support: http://www.cisco.com/techsupport
Copyright (c) 1986-2012 by Cisco Systems, Inc.
Compiled Thurs 5-Jan-12 15:41 by pt_team

advertisement version: 2
Duplex: full
---------------------------

....
```
You can also change the **CDP** as it could be a threat, so you can disable the CDP using `no cdp run interface` *interface*, and `no cdp enable`, and you can also the change the cdp timer using `cdp timer 90` and `cdp hold-timer 270`.

### Backup 

- Use `copy running-config tftp:` for copying the running configuration or  `copy startup-config tftp:` for copying the startup configuration to the **TFTP (Trivial File Transfer Protocol)** server.
- After you run above commands, it will ask for the **TFTP** server IP, Enter the *IP*, then next write the *file-name* that you want to save running-config/startup-config to. 
- Use `copy flash tftp:`, remember that in case of **flash**, you need to specify where you need to store the file as it might be possible that you need to store is elsewhere not on the root.

Saving your **backup** is the most necessary practice as you never know what may come up, so you need to save the **running-config** or **startup-config** to the Server. You can also go and check [creating backup](../exploring-cisco-router/creating-backup.md) where you can learn more using Cisco IOS, thus we've created a practical example on how to implement the whole process of backup using Cisco Packet Tracer.

You can **restore** the configurations using `copy tftp running-config` or `copy tftp startup-config`, it will ask for the IP of the **TFTP** server followed by the *filename* of the file that you specified while saving, and then the backup is initialised and configurations will be restored on the router.

But remember that when executing `copy tftp flash`, which is quite critical, as it asks for the saving the memory and this copying will ask for erasing the flash memory, but because **flash memory** is already is gone and if the router is restarted, then there is no comming, because first it is going to erase the entire flash. 

<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>Note: </strong> Don't restart the router <strong>if</strong> while <code>copy tftp flash</code> something goes wrong or the download is not completed from the server, as if you try restarting the router, it would delete the initial <strong>flash</strong> memory and will initiate the reload with the empty flash memory, so it possible that this happens. <br>
<i> what is better solution then?</i> Better can be done, if you can save the memory of the flash in the Cisco router only, that could help you while the download goes wrong. But don't <b>reload</b> the router and that could save you from trouble. 
</div>
<br> 
The simple solution is that you can go first and save the flash memory in the memory before upgrading the memory, and then you can perform the upgrade. Though if you switched the power off, then router will reload but won't find anything in the flash memory, becuase it is already erased.

### Telnet

- You can use `telnet` *ip-address* to create a session with the desired device and can create multiple instances by using telnet.
- Telnet uses **Shift + Control + 6* to move to another session
- You can check how many session are currently running or previously runned using `show session`

```
*0 C 192.168.1.1
1 A 192.168.1.2
2 B 192.168.1.3
```
- Now you can directly go and open the session using index specifies in the `show session` 
- Use `disconnect` *index* to end the session with the device.
- `show user` is going to show you all the *administrators* currently connected and doing the configuration.

```
0 192.168.1.1
1 192.168.1.2
2 console0
```
- If you find anonynemous person telneting through the router, use `clear line 1`
- But if you trying to clear a user, you first need to change the password first, as the anonynemous user might be having passwords and can change the password on his second return and can throw yo =u out as well, so first change the password.
- Remember that there only could be 7 administrators who can access the router and configure at the same time.

### Configuration of hosts

You can also make configuration of the hosts, using command `ip host A 172.16.20.2` meaning this is the **static** host configuration. If there are one host, there is no need for it, but in huge number of host, there can be a problem, upto 8 hosts can be configured.

Anothes is **dynamic** host configuration, where you need to configure the DNS server, as this allos you to directly telnet server. Use `ip domain-lokup` or `no ip domain-lookup` in order so that you need to tell router that domain server can be configure using `ip` *name-server* *ip-addresss*
- for exampmle, sunbeam.com.
- In order to create the **dynamic** configuration of the admisntrators you need to create the entries as given below:
```
A sunbeam.com ip-address
A delhi.com ip-address
A pune.com ip-address
A noida.com ip-address
A b.com ip-address
A a.com ip-address
A c.com ip-address
```

Now that it could beocme a hustle to refer tothe IP addres, you cna go a find the ip address using just the first


### Routing - Both way communication

Lets consider the example diagram below:

- `ip route 172.16.30.0 255.255.255.0 172.16.20.2` - configuration at Router A
- `ip route 172.16.10.0 255.255.255.0 172.16.20.1` - configuration at Router B

- Router A - ``
- Router B - `ip route 172.16.10.0 255.255.255.0 172.16.20.1`,
            `ip route 172.16.50.0 255.255.255.0 172.16.40.2`,
            `ip route 172.16.60.0 255.255.255.0 172.16.40.2`
            `ip route 172.16.70.0 255.255.255.0 172.16.40.2`

- Router C - `ip route 172.16.30.0 255.255.255.0 172.16.40.1`,
            `ip route 172.16.70.0 255.255.255.0 172.16.60.2`,
            `ip route 172.16.10.0 255.255.255.0 172.16.40.2`

- Router D - `ip route 172.16.50.0 255.255.255.0 172.16.60.1`,
            `ip route 172.16.30.0 255.255.255.0 172.16.60.1`,
            `ip route 172.16.10.0 255.255.255.0 172.16.60.1`

This is called **Stub** routes. But we can also implement **Default Routes** in the **Router D**, we configure the static route for the traffic to `.10.0`, `30.0`, and for `50.0` we specifically created a routing table, but we can do instead, `ip route 0.0.0.0 0.0.0.0 172.16.60.2`, meaning for *anything* with subnet *anything*, it has to be send `172.16.60.2`.

Thus similarly this could be done with the **Router B** also, we could use `ip route 172.16.10.0 255.255.255.0 172.16.20.1`, else for *eveything else*, we could specify the default route, `ip route 0.0.0.0 0.0.0.0 172.16.40.2`.

Don't use the **exit interface** as it could cause the problem in **Multiple Access** interface. **Multi-access** intrefaces are those that has more than one branches or WAN connected, in that case packet can't understand on which path it should carry on. Typically make a habit of specifying the **next hop** instead prevent using the *interface*, as it is possible to send the traffic through the interface rather than sending the traffic through the interface. 
