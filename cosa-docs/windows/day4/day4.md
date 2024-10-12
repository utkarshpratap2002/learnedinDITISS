# Domain Controller and DNS

*You might ask why we are using DNS?* Think of it like this, if any of your DC failed, what as an adminstrator you would be required to make the configuration of the backup on every machine. Infact, if you logon to the machine and want to fetch any service, what and how you can get all those services from the **Domain Controller**. That is why **DNS**, becuase you don't want any one of the DC failing and then making configurations of the new backup of the servers. 

That is why **Primary DNS** and **Seconday DNS**. DNS would never know if the DC failed, therefore there are two DNS which are to be configured on the machine and therefore those two DNS servers are configured within the organisation.

# What are DNS Zones?

Everytime you make a service call, DNS provides you the required information. DNS therefore has three types of Zones.

1. **Primary DNS**
  - When Domain is created for the first time, it is created using the Primary Zone, it is also a database that is kind of service running on the server.
  - Either it is **Forward Lookup** or **Reverse Lookup**, it would be a part of Primary Zone only.
  - All the services and their IPs are handled here. 
  - Think if this fails, *if the server fails, what you would be doing in that case?*
2. **Secondary DNS**
  - It is the backup copy of the primary zone hosted on the seperate server.
3. **Stub DNS**
  - If you don't want the copy of whoe primary zone then in that case you can create a stub zone, it won't take the whole copy of the primary, instead only the one that is required, not whole.
  - *It only know where to point when there is a required information*, then in that case use stub zone.

This is called Data replication, refer to [Active Directory](../concepts/active-directory.md), and data replication works in two styles, one is push style, another is pull style.

### `dns.conf`

DNS records are updated every period of time, when every there is modification within the zone, the modification of the file will be updated, and the serial number within the file changes and this is how Primary server informs the secondary server.

DNS uses TCP and whenever you do DNS lookup it uses UDP. Becuase everytime there is any change made on the Primary, there is same change seen on the Secondary DNS also. You can also go to Secondary and make them Primary if you know Primary is not going up soon. Then you can go on with the changes that you need to make.

# Forest Functional Level

When you add a forest with Window Server 2016, this forest functional implementation of OS dicides what is going to be the minimum version of the Window OS, which can be configured as **DC** or **ADC** within the entire forest.

Remember if there is another forest, you can set any OS, unitl and unless there is only 

# LDAP (Lightweight Directory Access Protocol)

It follows a directory tree.

| C: | D: | / |
|----|----|---|
| Directory | Directory | Directory |
| ⬇︎  | ⬇︎ | ⬇︎ |
| SubDirectory | SubDirectory | SubDirectory |
| ⬇︎  | ⬇︎ | ⬇︎ |
| Files | Files | Files|


It is called **Directory Access Protocol** called as **X.500**. All the data is stored in some files with information related objects, such as printers, isers and computer. These are stored in files called leaf objects. 

When you say there are two domains within a forest, there are only queries that are to be decided by the **ldap**. It decides what objects permissions that are to be hold.

Remember ldap allows you to create objects such as OUs, Users, and Computer etc. Each object will have some properties for user and every property will have some value. These properties includes username, time restriction, logon to etc. This ldap is also a **schema**, Schema stores the data that has information about the object structure.

**LDAP** server hosts this ldap database , ldap clients perform operations using lsap queries, (Similar to sql query).

LDAP schema is the basic structure of each object and decides the properties of theat object. This ldap schema can be extended by adding and removing properties of an object.

LDAP uses distinguished names to identify any object distinguidhe name of user1. But remember that these distinguished name are stored in such fashion, CN (Comman Name)=user1, OU=sales, OU=pune, DC=cdac, DC=lab.

# Kerberose

It is an authenticatio protocol it procides ticjet based authentication. It provides **Single Sign On (SSO)**. It means user needs to login once same login works on all other computers.

Kerberose server creates a realm which maps to a domain name. ALl decices within this realm accept the tickets issued by the kerberose server. *You might ask, why we are using Kerberose?* It is because, kerberose is through which we are able to make forest boundaries, it allows trust to be created between the kerberose. This allows users form on realm to lgoin to computers in toher realm using the same credentials. 

Remember that both LDAP and kerberose both uses **timestamp** as the limiter. Therefore, time is very important, if the time doesn't match, it query will be rejected.

# How does Kerberose works?

Every DC contains elements such as **KDC**, **TGS**, and **AS**.
It is also called trusted third party communication. When the client sends the 

# FSMO (Flexible Single Master operations) Roles

It consists of two Roles, **Forest-wide** Role and **Domain-wide** Role. Forest wide roles means ther will be only one server in the entire forest performs this role, and another is **Domain-wide** is when there is only one server in each domain will perform these roles.

Lets discuss the roles within the **Forest-wide** Roles:

1. **Schema Master**
  - What Schema master does is it makes sure that active directory schema (ldap schema) is same in the entire forest .
  - Any new domain added in the forest, gets the AD schema from the schema master.
  - Any new updates to AD Schema should be first performed on Schema Master.
  - Then Schema Master will update it to all other domain controllers within a forest.

2. **Domain-naming Master**
  - It makes sure that there isn't any duplicate domains in the forest.

Lets discuss roles within the **Domain-wide** Roles:

1. **RID Master**
  - In a domain as the user account are created on DC and any ADC, ther is a chance that 2 uers get the same SID number. 
  - RID Master takes care of that duplication.
  - The Resource ID master allocated the SID number ot ADC's which they can assign to accounts created on them. This avoids SID duplication.

2. **Infrastructure Master**
  - It performs cross-domain information transfer. It basically communicates with the other domain for the exchange of information.
  - For example, **student1** (of sunbeam.cdac.com) is added to the *acts.cdac.com* by the domain administrator. 

3. **PDC Emulator**
  - It originally used for the backward compatibility with windows NT. It is Primary Domain Controller.
  - Now it works as a time server for the computers within a domain.
  - Also handles usr password changes - communicates other domain user password changes to PDC of that domain.

![alt text](pdc.png)

Now consider the below structure and give the roles that will be assigned to each of the server:

![alt text](roles.png)  

- Remember in case of **Schema Master**, the first domain will be assigned the **Schema Master**. Then, in case of the **Domain-naming Master**, it will be assigned to the same as Schema Master. 

- Thus in case of the srv6, there is no ADC yet created for the domain, so it will have all the domain-wide roles.

Now if you create a new role with only domain, as given below example, it will have all the roles of the forest and domain. Refer to [Day 5](../day5/day5.md) to learn ahead about the **Transfer of roles**.

![alt text](roles-2.png)

### `Netdom query fsmo`

If you look at the `netdom query fsmo` you'll find the RID master and all kinds of roles within it.

Now lets discuss about the infrastructure Master



