# DNS Bind Configuration
Here's how you can configure BIND on `deb3.shuhari.local`, `rootca.shuhari.local`, and `subca.shuhari.local` to handle DNS for `root`, `subca`, and `www` including reverse DNS:

```bash

# Change hostname

# Install BIND9
sudo apt update
sudo apt install bind9 bind9-utils dnsutils

# Configure named.conf.local
sudo nano /etc/bind/named.conf.local

# Configure named.conf.local
sudo nano /etc/bind/named.conf.local

zone "shuhari.local." IN {
        type master;
        file "/etc/bind/shuhari.local.db";  # Zone data file
        allow-update { none; };
        aloows-query { any; };
};

zone "164.16.172.in-addr.arpa." {  // Reverse zone for 172.16.164.0/24
        type master;
        file "/etc/bind/shuhari.local.rev";
        allow-update { none; };
        aloows-query { any; };
};


# Create the forward zone file (shuhari.local.db)
sudo nano /etc/bind/zones/db.shuhari.local

$TTL 86400
@ IN SOA deb3.shuhari.local. admin.shuhari.local. (
        2020011800 ;Serial
        3600 ;Refresh
        1800 ;Retry
        604800 ;Expire
        86400 ;Minimum TTL
)

;Name Server Information
@ IN NS deb3.shuhari.local.

;IP Address for name server
deb3 IN A 192.168.80.156
rootca IN A 192.168.80.155
subca IN A 192.168.80.157


# Create the reverse zone file (db.164.16.172)
sudo nano /etc/bind/zones/shuhari.local.rev

$TTL 86400
@ IN SOA deb3.shuhari.local. admin.shuhari.local. (
        2020011800 ;Serial
        3600 ;Refresh
        1800 ;Retry
        604800 ;Expire
        86400 ;Minimum TTL
)

;Name Server Information
@ IN NS deb3.shuhari.local.

;IP Address for name server
deb3 IN A 192.168.80.156
rootca IN A 192.168.80.155
subca IN A 192.168.80.157

;Reverse lookup for name server
156 IN PTR deb3.shuhari.local
155 IN PTR rootca.shuhari.local
157 IN PTR subca.shuhari.local


# Check configuration and restart BIND
sudo named-checkconf
sudo named-checkzone shuhari.local /etc/bind/shuhari.local.db
sudo named-checkzone shuhari.local /etc/bind/shuhari.local.rev

sudo systemctl restart bind9

# Test DNS resolution
nslookup deb3.shuhari.local
nslookup subca.shuhari.local
nslookup rootca.shuhari.local

# configure firewall
> sudo firewall-cmd --add-service dns --permanent
> sudo firewall-cmd --reload

# change /etc/resolve.conf
nameserver 192.168.80.156 # <dns-server>
```