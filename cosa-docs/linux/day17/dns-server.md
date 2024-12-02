# DNS Configuration

This article we are going to install the [**httpd**](../day13/day13.md#apache) server and then we are going to host custom website, then we will setup our DNS server.

We first need to instal two utiliities **bind** and **bind-utils** using the package manager.

```bash
yum install bind bind-utils -y

# Check if is intalled
rpm -q bind
```

Then we need to make the configurations in **/etc/named.conf** is the file that stores the configuration of the **bind**. Another file is **/var/named**. So we'll start editing the configuration file for the DNS server but remember to take backup for the configuration file. 

```bash
cp /etc/named.conf /etc/named.conf_bkp
```

```bash
# You first need to make the IP entry in the options in listen-on.
listen-on port 53 { 127.0.0.1; 172.16.164.134; };
```

```
# Adding zone
zone "mrdhvi.in" IN {
        type master;
        file "mrdhvi.in.fzone";
        allow_query { any; };
};

# Save the file configuration and check if everything is ok!
named-checkconf
```

```
# Create the file mrdhvi.in.fzone inside /var/named/
vim /var/named/mrdhvi.in.fzone
```

```bash 
# Add following lines 
$TTL 2d    ; default TTL for zone
@         IN      SOA   ns1.example.com. hostmaster.example.com. (
                                2003080800 ; serial number
                                12h        ; refresh
                                15m        ; update retry
                                4d         ; expiry
                                2h         ; minimum
                                )
```

# Getting Into Basics

What is DNS server, its a name resolver, meaning it resolves the names to the IP addresses, I meed to talk about DNS, the its just a configuration that will allow us to make queries, meaning these queries should be maintained and should be configured well.









