# Subnetting and IP addressing

The calculations for the given subnet, you need to calculate the **Broadcast ID**, **Subnet ID**, and **First or Last Host** in the Subnet.

### W.0.0.0/18
|Calculate| IP address|
|-------------------|-------------------|
|Br ID of First Subnet| **W.0.190.255**|
|Subnet ID of 2nd Subnet| 
|100th host on 3rd Subnet| 
|200th host on 3rd Subnet| 
|300th host on 3rd Subnet| 
|Br ID of the 8th Subnet| 
|1st host on 10th Subnet|
|300th host of 30th Subnet|
|400th host on 50th Subnet|
|600th host on 100th Subnet|
|800th host on 300th Subnet|
|300th host on 600th Subnet|
|800th host on 800th Subnet|
|**Last host on last Subnet**| **W.255.191.254**|

<br>

- First you need to calculate the **subnet mask** for the **W.0.0.0/18**, i.e., **255.255.192.0**, meaning the third octet will go till **192**. For every completion of third octet, there will be shift to second octet, meaning the **first subnet** -> **W.0.64.0**, **second subnet** -> **W.0.128.0**, **third subnet** -> **W.1.0.0**, becuase if you take **W.0.192.0**, that will make the **subnet invalid**.Therefore, **W.1.0.0**, thereafter, **fourth subnet** -> **W.1.64.0**, and **fifth subnet** -> **W.1.128.0**. 
