# Subnetting and IP addressing

The calculations for the given subnet, you need to calculate the **Broadcast ID**, **Subnet ID**, and **First or Last Host** in the Subnet.

### W.0.0.0/18
|Calculate| IP address|
|-------------------|-------------------|
|Br ID of First Subnet|**W.0.190.255**|
|Subnet ID of 2nd Subnet|**W.0.128.0**|
|100th host on 3rd Subnet|**W.0.192.100**|
|200th host on 3rd Subnet|**W.0.192.200**|
|300th host on 3rd Subnet|**W.0.193.44**|
|Br ID of the 8th Subnet|**W.2.62.255**|
|1st host on 10th Subnet|**W.2.128.1**|
|300th host of 30th Subnet|**W.7.129.44**|
|400th host on 50th Subnet|**W.12.129.145**|
|600th host on 100th Subnet|**W.25.2.89**|
|800th host on 300th Subnet|**W.75.1.34**|
|300th host on 600th Subnet|**W.150.1.44**|
|800th host on 800th Subnet|**W.200.3.35**|
|**Last host on last Subnet**| **W.255.191.254**|

<br>

- First you need to calculate the **subnet mask** for the **W.0.0.0/18**, i.e., **255.255.192.0**, meaning the third octet will go till **192**. For every completion of third octet, there will be shift to second octet, meaning the **first subnet** -> **W.0.64.0**, **second subnet** -> **W.0.128.0**, **third subnet** -> **W.1.0.0**, becuase if you take **W.0.192.0**, that will make the **subnet invalid**.Therefore, **W.1.0.0**, thereafter, **fourth subnet** -> **W.1.64.0**, and **fifth subnet** -> **W.1.128.0**. 
