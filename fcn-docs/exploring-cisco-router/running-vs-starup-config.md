### Running v/s Startup Configuration

The **Current** running configurations of the router is stored temporarily in **DRAM**, it requires manual saving of the configuration to the **startup configuration**, which is stored in **NVRAM**, in order to save the configurations for the next boot that will take place. The differences can be seen after you open your router CLI. You can go and check [Working of ROM, NVRAM, and DRAM](day5/day5.md#working-of-rom-nvram-and-dram) for further details.

- Go to CLI and `enable`, then go to global configuration mode using `configure terminal`.
- Create a `hostname` *name* and `enable secret` *password*.
- Now check your running configuration, using `show running-config` and `show startup-config` in the privlegde mode.
- You can see the running configuration saved to **DRAM**, you might not see the startup config as it isn't created yet.
- Make few more interface specific configuration on the router's interface, use `ip address` *ip address* *subnet mask* and `no shutdown` and then `exit` the **interface configuration mode**, see [IOS (Internetwork Operating System)](day5/day5.md#ios-internetwork-operating-system) to know more about the three major configuration modes in Cisco IOS.

Remember that these are basic configurations that you've made and these are saved to **DRAM** temporarily. If you **turn off** the router by going to **Physical** section, and turn off the router, and then again turn on, you'll find the router reloading, and once its done reloading, it will come back to start menu.

Thereafter, if you `enable` it won't ask you for password as you didn't saved the configurations to the **startup configuration**, which is why, your routers configurations will also dissapear because it didn't got saved.

So, you need to save the configuration using `copy running-config startup-config`, as you will see a verification message `Destination filename [startup-config]? `, press `Enter`, that will save your running configuration into the **NVRAM**, such that router will remember those configuration when it will boot up again. 

```
cisco# copy running-config startup-config 
Destination filename [startup-config]? 
Building configuration...
[OK]
```
These configuration are now saved to **startup configuration** so check these configuration using command `show startup-configuration` or `sh startup-config` to see the saved configuration. Explore deeper depths of  **volatile** and **non-volatile** memory in the [Cisco Routers](day5/day5.md#cisco-router) and [Working of ROM, NVRAM, and DRAM](day5/day5.md#working-of-rom-nvram-and-dram).

