# LDAP

LDAP is a way of creating multiple users within the global directory that can be accesses amoung multiple server using LDAP, becuase it has its own database and therfore, it is similar to that of the Domain Controller. This is done using the **Open LDAP**.

It is standard **protocol** that is designed to maintain the multiple services, used for sharing the entities. Mainly users and group. 

What do you think is difference between *authentication* and *authorization?* LDAP service provide both authentication and authorization, thus when you create a new user, everyday there will be data for the user and it will be getting authenticated daily, that is why the philosophy for LDAP is *if you want to authenticate daily, you'll*

Microsoft is using **DAP** in Window Server for creating Active Directory. 

# How LDAP Works?

Database is stored in different files, it enables search of those records and therefore, there are three main aspects of it.

- Update, this includes adding, deleting, modifying directory information.

- Query, this is where it will search for  desired directory records from the database.

- Authenticate, this checks if the user is available, checking if the user exists.

It maintains all the information in DIT (Directory Information Tree) that starts with the root called **root DES** node, it depends on the what hierarchy it is being used, where you decide what resources are to be used and what kind of attributes are stored inside thoe resources iniside the database, thes records/entries will have collection of attributes, those attributes will be collected by the LDAP server which steres in heirarchical orfer.

There is **Comman Name** is the name that is provided in order to show the reources that are defined. 

- Entry

- Attribute, it is stored data in two parts tsuch that we'll havedifferent entries, the vaialable attributes are called Objectclass. Orgaisations uses more than one ObjectClass, it is used in a way that you can store multiple resources ro attribites will be defined in terms of kindo f information yo've stored in one entry,/

- Schema defines the atrributes it will intoruce th default schema. 

- Distinguished Name
  - DNs are format using the rever path, statt might start with the leaf nodea and parent node for the same.

There is differnvce between DN and CN, what makes DN from CN is that it will search for the leaf node of the organistional node.

Thus the user can store and see the authentication and authorization between them. Practically.

# So what is difference between LDAP and AD?

_ Microsoft has many serice witihin isself and therefore LDAP has more of cistomized implementation of the LDAP protocol 


### How the Protocols gets standardized?

When a new feature is to be created, the peoople will start seding the RFC, it they find it good to be implemented as the standard.


# How do we do it?

First you need to install the 

# Passwordless Login

In order to login without entering the password into the server, you need to do **ssh** configuration that will involve making **private** and **public** key on the client server, in order to make server recognise the client, as client is the one making the connection or say initiating the connection. Use the below command to create private and public key.

```
ssh-keygen
```

