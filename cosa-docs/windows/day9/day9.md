# PowerShell

It is Scripting Language that allows the retrieval of information based on the specific commands, such as:

- `Get -`
- `Set -`
- `Install -WindowFeature`
- `Show -`
- `Now -`

PowerShell Scripting has `.ps1` extension that shows the PowerShell Scripting language.

PowerShell has various feature to manage the Active Directory operations but remember that most of its commands are like Linux. It allows various commands which are like Linux, such as **`clear`** and 

- `Get-` will give you all the extension features.
  - `Get-ComputerInfo` is another command that will list all the information about the DC, such as Role, TIme one, Installation details and others. These are called Command leds, these are helpful for **Auditing**.
  - `Rename-COmputer -NewName` *"UpdatedName"* to update the name of the system.
  - `Rename-COmputer -NewName` *"UpdatedName"* -Restart to update the name of the system.
  - `set-TimeZone` will expand various options for the Time Zone options. 
  - `get-TimeZone` will give you the current time zone of the AD.
  - *So How can you set the Time Zone?* First list all the Time Zones available
    ```
    Get-TimeZone -ListAvailable
    ```
  - Now you need to set the time zone:
    ```
    Set-TimeZone -Name "Your Desired Time Zone Name"
    ```
  - You use the select string option to generate the desired list of Time zone using the `Select-String`.
    ```
    Set-TimeZone -Name "Your Desired Time Zone Name" | Select-String "India"
    ```
  - Use `Get-NetAdapter` to all the network card interfaces, it shows the interface index of your device.
  - Use `New-NetIPAddress -InteraceIndex 2 -IPAddress 192.168.10.2 -Prefixlenght 24` to change the IP address of the machine.
  - `Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools` and remember that IncludeMangementTools are to incllude the services such as **DHCP** and **DNS**, otherwise if you don't include them, these won't be installed.
  - Use the below command to create a new forest:
    ```
    Install-ADDSForest -DomainName "yourdomain.com" -ForestMode "ForestFunctionalLevel" -DomainMode "DomainFunctionalLevel" -InstallDNS
    ``` 
    Then it will ask for the password and you need to adminitrator pasword and then you'll be able to install the AD DS after the system restarts.
  - Use the below command to add the Organsisation unit using `-Nmae` and `-path` for creating the path, such as `DC=sunbeam,DC=com`
    ```
    New-ADOrganizationalUnit -Name "OU_Name" -Path "DC=sunbeam,DC=com"
    ```
  - Use the below command to set the DNS client:
    ```
    Set-DnsClientServerAddress -InterfaceIndex 4 -ServerAddresses "192.168.100.1", "8.8.4.4"
    ```

Now let try writing a script:

- Use `notepad adc.ps1` to open the notepad file, this is is PowerShell script.

- Now write the below command for the configurations:
    ```
    Set-DNSclientServerAddresse -InterfaceIndex 4 -ServerAddresses "192.168.100.1"
    Install-WindowsService
    ```
- Now install AD DS using following command:
    ```
    Install ADDSDomainController -DomainName "sunbeam.lab" -InstallDNS
    ```
After you've comppleted the script, you need to save the script and then installation will start. You might want to give the password.

# Bare Metal Backup

This kind of backup is used to restore the backup of ServerOS, plus Application, plus Data, meaning full server backup. This include teh System state backup, includes AD database, Windows Registry, and window important files. 

In order to create the backup you need to install the **Window Server Bakup** and then yo need to go onto the Service and schedule your backup.

### 1. User Data Backup

- First go and create a file within the C: Drive.

- Then you need to create a backup for regular backup storage. 

- Open the Service Tools, and choose **Custom** and click *Next*.

- Then you can go and add backup for the scheduled time.

# VPN (Virtual Private Network)

Now it is used to provife secure remote access to internel network resources. This is to send data encrypted over the network. VPN encrypts the data travelling over the third party network and therefore in industry VPNs are used. 

### 1. Site-to-site VPN

It is also called gateway to gateway VPN, whatever traffic travelling through the *third-party network* gets encrypted.

### 2. Dial-up VPN

It is used to provide remote access to roaming users.  If we have multipl machines over the different network, we need to create the VPN (Dial-Up VPN), which will set the VPN on RADIUS server and therefore we would use VPN to join the network **remotely**.

# Installing VPN on Server

- Select the networl policy and Remote Network that will enable the VPN service on the Active Directoy.

- Next, then you need to check the VPN that will enable the Web Server. Remember in Production Environment you need to install these serviceson the member server, not on AD.

After the Installation complete, you need to check if there is *yellow flag* still showing, that means the service is yet to be deployed. After yo promote the installation, then

- Go to tools, and there you'll find **Remote Access Management** or **Routing and Remote Access**.

- Then you can *right-click* and then **Configure the VPN**, then you need to configure the VPN as **Custom Configuration**, and then select **VPN access**, then Next.

- Then you need to restart the service and your VPN server is created. After that, you need to configure the servers to the specific network.

You can't configure Network Policy in the VPN, there you need to move to **Network Policy** in the **Tools**. Now you need to 

- Create a new network Policy, becuase we are making it for VPN, you need to select VPN.

- Next, you need to manage the Specific Conditions, in our case we need to add it to the User Groups. Select the user groups of the Domain that you've created.

- Next, You can go and apply the Idle Timeout, if the user is idle for a specific time period the session will end. 

- Then, you need to go to the Encryption and provide atleast one encryption.

- Now you will see any one of the policy on the VPN server.

This is how the reote access is given using VPN. It is not solely based on the encryption, it is also used to provide connection over network such that remote connection to the network can be given. 

What VPN does? VPN on recieving the Packet with Destination IP address to the remote network (which is not the network known to the VPN) encrypts the whole packet and then adds an extra header to it. This is how the VPN is used for remote connection.