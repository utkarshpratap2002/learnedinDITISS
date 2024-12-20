# Android Security

Before that we need to start with Android Build Proccess, which includes the packaging of your source code, resources and libraries in the .apk (Android Package Kit) file that includes following proccesses as listed below:

- **Source Code** - Source Code is where it all starts, therefore when it comes to package the code, the analysis tools are used to understand and identify the vulnerabilties such as SQL Injection and Cross-site Scripting (XSS).

- **Manifest File** - The minimum required permission are needed in order to make sure the app functionality is what is defined in the **AndroidManifest.xml** file, this defined the security permission necessary for the app functionality.

- **Resources** - Resources are asssumed to be images, files and other strings, thus if not maintained properly these can cause a major secutity risk, so these resources can't be hardcoded directly into the source code, therefore, as a standard practise these needs to be encoded properly with a seperate environment.

- **Compilation and Dexing** - This is the part where we talk about the Dexing process, where a Dalvik bytecode (DEX) in inserted into the code, and this is the part that make the reverse engineering difficult, thus, renaming the classes, methods, and variables makes it harder to crack the code for the attackers. *This is called Ofuscation*. 

- **Signing** -  In order to make sure that the app is properly signed in, you need to start with secure signing of the code. Basically, how this works is that your APK is signed using the private and public key. 

- **Packaging** -  This is where you start with the code deployment using different techniques of resource optimisation and APK Shrinking.

Lets discuss about the basics of Android App Development, where we'll and might get to the insights on what is required and what we need to understand about Android App Development.

- **Store Data Securely** - Never store sensitive data like Passwords, API Keys, and other sensitive user data in plain text, it is best practise to store these information in encrypted database or Android Keystrore.

- **Secure Network Communication** - Always communicate with the server over the HTTPS, implement network security, make sure you have implemented Certificate Pinning and always validate the responses such that there is no attacker can perform Malilcious Data Injection of code into the reponses.

- **Never Trust User Inputs** - Always validate the user inputs such that there is no SQL Injection or Command Injection or attacker is not able to perform File Inclusion.

- **Authentication and Authorization** - Make sure you implement proper authentication techniques to identify the users and make sure to implement strong passwords and multi-faactor authentication. Implement Authorisation to restrict the users to the data they are only allowed to access.

- **Code Obfuscation** - As we talked earlier we can implement DEX (Dalvik bytecode) for the hardening of the reverse engineering, as we can aslso use root detection and methodologies of debugger detection that make it harder for attacker in reverse engineering.

- **Security Updates** - It is about staying updated with the latest code exploites and using latest Android packages and SDK versions.

- **Penetration Testing** - Consider getting *involved* with the security proffessionals and test your app with the penetration testers.

## Certificate Pinnning

*How can you check if the certificate is Valid?* In order to identify that, it can vary problematic, therefore, to prevent the threats, Certificate Pinning is used in to filter all those certificates that are not in the VIP list. This VIP list, also called **truststore**,  is like the filter on the door of the app, where it filters about all the traffic is only comming from the certificated list mentioned in truststore.

Even if the hacker has the valid certificate, and if the certificate is not on your **truststoere**, the request will be dropped and connection will be prevented. This is called *Certificate Pinning*.

# Root and Debugger Detection

Root and debugger detection are security measures implemented within mobile apps to protect against unauthorized access and tampering.  Think of them as alarms designed to go off if someone tries to gain excessive control over the device or the app itself.

*Root detection* checks whether the device on which the app is running has been "rooted."  Rooting is a process that gives users administrative (or "superuser") privileges on Android devices.  While rooting can offer benefits like customization and access to advanced features, it also opens up significant security risks.  A rooted device is more vulnerable to malware and other security threats.  Therefore, many apps, especially those dealing with sensitive data like banking apps or DRM-protected content, employ root detection to prevent their use on compromised devices.  If root access is detected, the app might refuse to run, display a warning message, or restrict certain functionalities.

*Debugger detection* checks whether a debugger is attached to the app. Debuggers are tools used by developers to step through code, inspect variables, and understand the app's behavior. However, malicious actors can also use debuggers to analyze an app's logic, reverse-engineer its functionality, or tamper with its data. Debugger detection acts as a countermeasure, preventing unauthorized debugging and protecting the app's integrity. If a debugger is detected, the app might terminate, display an alert, or modify its behavior to thwart the debugging attempt.

# Android Security Hack

For the security of Android we are going to test the security of the Android Machine, for that we are going to setup our own environment. 

- Setup **Windows XP SP3** Machine:

- Setup **Android Machine (Virtual Box)**:
  - Take the Windows XP file from the 192.168.0.52/ditiss and try installing them on the Virtual Machine or VMWare. 

  - The Machine for Android needs with the respective Android Configuration but thats not the important part, the important part is the vulnerability. 

  - *How to setup*, you need to configure the andoired usin teh uinternal network , then you need to establelish the wifi on manuual IP meaning it will have the static IP, then you nneed to setup the proxy.

  - ON kali lilnux you need to have a normal adapter and the IP address will be assigned using teh DHCP of the Virtual BOx, it will be running on internal network, and will have teh mannual IP address. *
    - The configuration of the android macine shoul dbe 192.168.200.100 on the same port. 
    - Remember that the motive is to send the traffic to the Kali Linux, where it should be recieved on burp running on kali linux. 
    - The traffic from android should be intercepted on kali. 

  - Now you need to do the proxy settings where Default 127.0.0.1 and we will change it to 192.168.200.100 with port 8080, as if the traffic comes for the IP 192.168.200.100 it should connect to the same machine.

**Possible Vulnerability** as it is given in the below diagram, where you need make sure that firewall is not getting bypassed as there is possibility that if some changes the default gateway, it will directly go to the router, bypassing the firewall. Router is only restricted to routing only, meaning router is only doing the routing part.

    ```
    Tinku -> IP -> DHCP -> Firewall (Gateway) -> Gateway
    192.168.1.50 -> 192.168.1.10 -> 192.168.1.1 (router)
                    (Monitor)
    ```



