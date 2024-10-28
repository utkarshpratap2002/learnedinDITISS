# DNS

First you need to install the bind and bind-utils, and then you need to go to the named.conf and need to comment the following lines.

```
options{
    // listen-on port 53 .. 
    // listen-on-v6 port 53 .. 

}
```

Now you need to change the `allow-query {localhost; 172.16.164.0/24}`, then you need to add forward zone configuration, so forward zone is used for providing the database information. 

Now you need to go to named.conf file and then you can configure the forward zone and backward zone, this can be done using the following command.

Now we need to update the forward zone and backward zone using the **named-checkconf** is going to contain the forward.

Now you need to add the actual server to the static entry, **/var/named/example.local.db**
.....

Then you need to change the chown, similarly we did in LDAP, because we need to change the default permission for the **system user** running the service. 

Now we need to enable the server and start the service. Go and look into the **status**, you need to check if the service is running successfully.

```
firewall-cmd --add-service dns --permanent
firewall-cmd --relaod
firewall-cmd --
```

Now after configuring you need to do client side configurations, you need to add the resolution ip address inside the resolv.conf.

```
nameserver <ip-address>
```

What is happening is that when we trying to nslookup to the domain name, it is getting fetched from the name server, that is, the server itself. We have had a DNS server. 

# SELinux

SELinux haveSecurity Policy base, it is a kind of database which is collection of policies that secures the files, ports, and entities.   policies contains three things, one is source, another is target, and the permission regarding the source and target. Baically there is server running that enforces those permissions on the source and target. 

# How to configure it?

The first thing you need to do is, taking the password and then you need to.

All the context will end with port number as assigned, we need to attach a context lable and we need to attach on the port. 