# VPN

The basic Defination of the VPN is allowing the trusted-network to connect to another trusted-network over the non-trusted public network. VPNs create a tunnel that will encrypt your traffic going over the untrusted public network. 

Basically in order to access the network that of your office using the VPN server, this functionality of the VPN is called **Tunneling** or sometimes you can refer it to as **Encapsulation** of IP address. 

At every layer is adding the a different layer of encapsulation and so does the concept of GRE Tunnel, but the main difference betweent the GRE Tunnel is that it is applied on Layer 3 and 2 of OSI modal and VPN Encapsulation is applied on Application layer, this kind of encapsulation is WAN-based technology. 

Those are not the real IPs that the VPN provider is providing instead it is providing the medium, a secure medium to connect with the network that we want to connect. Now there can be classification made based on **Network-Architecture** and then based on **Implementation** of the VPN. 

When we talk about the **Network-Architecture** we say there are dail-up and site-to-site VPN.

- **Dail-up** VPN

- **Site-to-Site** VPN

Based on **Implmentation** of VPN we can say there are trusted and secure VPN.

- **Trusted VPN** - This kind of VPN implementation is about the fabricated the dedicated and isolated VPN connection based on existing architecture.

- **Secure VPN** - 

# OpenVPN

- Install VPN on both server and client machine.

    ```
    sudo apt-get install openvpn
    ```

- Now create a server.conf file.

    ```
    proto udp
    port 1194
    dev tun # using the tun for communication
    auth none # using no cipher
    cipher none
    ifconfig 10.8.0.1 10.8.0.2 # the ip-address of src and dest
    verb 3 # verbosity for verbose and debugging
    ```

- Now connect/start the server using the systemctl.

    ```
    sudo systemctl start openvpn@server
    ```

- Now you need a client, similar to the configurations but add the remote server and change the peer-to-peer IP address. 

    ```
    remote 172.16.80.139 1194
    proto udp
    port 1194
    dev tun # using the tun for communication
    auth none # using no cipher
    cipher none
    ifconfig 10.8.0.2 10.8.0.1 # the ip-address of src and dest
    verb 3 # verbosity for verbose and debugging
    ```

- Once the the connection are established, run using systemctl.

# ClearOS Firewall

- First create a folder for the ClearOS and create Virtual Machine for that. Select *Red Hat Enterpreise Linux x64*. 

- Next we need to configure the two virtual network from the vitual network editor, one adapter is suppose to be on NAT and another adapter is to be on Host-only. 

- Once the installation is complete there will be browser request, get that through the GUI Wizard.

- Check DNS server.

- Register your System with the Wizrd. 

# Message Authentication Code

Hashing is used in order to check the encryption basically to ensure the integrity and 

A MAC fucntion is an authentication scheme dervice by applying a secret key to a messge in some form. There are two basic types of MACs.

- **HMAC (Hash MAC)** - Basically in here, message is concatenated along with the secret key and then is ecrypted with the hash function. 

- **CBC-MAC**

But there is still a problem, meaning that you still can't find the **Confidentiality** as well as **Authentication**.

# Digital Signature

Hash value is calculated for the Message and the Hash value is encrypted using the private key of the Tinku, meaing only the Tinku's public key can resolve or decrypt the message, hence authentication is resolved.

Other than that, when the Pinky will decrypt the message, Pinky will verify the hash value for the message, hence the integrity is maintained. 

Digital signature is meant to solve the problem of Message Authentication code, where there is no authentication as well confidentiality. 

# Squid 

Refer to [Squid](../day4/day4.md#squid) to understand how reverse proxy works, basically what we did yesterday is demostrated how the reverse proxy acts as a gateway to the traffic comming for the backend servers. Squid has the same concept as that of the HAproxy, we need to do the same thing but today as well. We are implementing the load balancer and reverse proxy using squid.

Add the backend server in `cache_peer`.

```
cache_peer <ip-address-of-backend-server> parent 80 0 no-query originserver round-robin weight=1 name=one
cache_peer <ip-address-of-backend-server> parent 80 0 no-query originserver round-robin weight=1 name=two
```

# Nagios Monitoring 

In this lab, our purpose is to monitor the Linux machine. 

- Install the packages. 

```
sudo apt-get install wget libsqlite3-O
```

- Download the ncpa package from and install it using dpkg.

```
sudo dpkg -i ncpa-latest-1.amd64.deb
```

- We need to add the token inside the configuraion file.

```
# change the directory
cd /usr/local/ncpa/ncpa.cfg

# change the community_string
community_stirng-Password1234
```

- Now start the service.

```
sudo systemctl start ncpa
sudo systemctl status ncpa
```

- Now **Check the server**. Hence the ncpa is configured on the remote server and now you can go to server and check for the token.

```
cd /usr/local/nagios/libexec

sudo ./check_ncpa.py -t Password1234 -H 192.168.80.130 -M system/agent_version
```

- Now this is the step for creating the definations, 

```
define host {
    use                 linux-server
    host_name           deb_12-1
    alias               Debian 12 Sys 1
    address             192.168.80.130
    max_check_attempts  5
}

define service {
    use                 generic-service
    host_name           deb_12-1
    service_description Agent Version
    check_command       check_ncpa!-t 'Password1234' -p -P 5693 -M system/agent_version
}

define serivce{
    use                 generic-service
    host_name           deb_12-1
    service_description Virtual Version
    check_command       check_ncpa!-t 'Password1234' -p -P 5693 -M memory/virtual -w 50 -c 80 -u G
}
```


