# Wifi Attack

What the scenario is? You need to crack the password of the Wifi. Either the passwords ar easily gussable or there are some numbers that can be cracked, if there are some complexity in the passwords, in that case you require passwords.

- First you need to connect the adapter that you are using should be connected to the Kali Linux. You can check this using the `ifconfig`, you'll be getting the status of the connected wireless wifi, *it is working like normal wireless adadpter*.

- Because we are trying to put this adapter into the network, we need to put out adapter in monitoring mode. This is called Promiscious mode. You can also look for the Promiscious mode, which can be seen in wrieshark as well. 

- `aircrack` is another monitoring tool that is used for this purpose.
  - `airmon-ng`
  - `airdump-ng`
  - `aircrack-ng`

- Start the monitoring mode:
  - `sudo airmon-ng start` - Now you can look inside the monitoring mode, 

- Specify the band of the adapter:
  - `sudo airmon-ng --band bg wlan0mon` and *Enter* and check for the adapter `airmon-ng`.

- At the time of the attack, you need the **Channel Number** and the **MAC Address** of the Router.

- Now we need to identify Monitor the traffic, and therefore, 

    ```
    sudo airodump -c 1 -bssid <mac-address> -w
    ```

- All the packets will be stored in Current Working Directory. 

- EAPOL means you've successfully captured the Three-Way Hacndshake. 
    ```
    sudo airodump -c 1 $CN -bssid $MAC -w $CAPNAME wlan0mon
    ```
- Now wtart yoir Vritual Machine and such that you need to get teh file inside teh choosen data,

    ```
    /usr/share/metasploit-framework/data/wordlists/ COPU TEH WORDLIST
    ```

# Creating the Password list

Generate your password list with `chrunch` method, you can do this using the following steps: