# Utilities

1. **Disk Manager** - It tell which utility is installed on the computer and therefore you check check which hardware, say a network card, device manager will tell who is the network card manufracturer. Whe it is about the **server** upgrade, you need to know what it is.

2. **User Management** - Administrator has all the user management access. You need to add users and manage users. OS gives you default users and therefore all the permissions are already given, if you need to change ther permission, administrator does that.
  - **User meta data** - There are policies for users, the permissions, all of these are saved on **database**, another if **SQL**, then **Excel**, and therefore it is called **flat databases**.
  - **`windows/system32/config`** - This file holds the username passowrds groups etc., it is called **SAM (Security Accounts Manager)** file, similarly in linux there is `/etc/passwd` where everything users password and information is stored.

<br>

# How do you add Users?

1. **Create a User** - Go to run and run command `compmgmt.conf`, from where yo can create a user and manage it.

2. **Change Password on Next Logon**
  - You can select the option that will *change the password on the next logon*, when the user will log in another time, the OS will ask user to change the passwords.
  - Then there is *Password never expires*, it is for s/w which has paswwords, then the username for that account is created. 
  
THough mostly you'd be looking at **Command Lines** for the same.

- `net user /`
- `net /?`
- `cls`

- `net user hacker * /add` - this will add a user 


### Windows WORKGROUP Mode

Remember that each computer follows its own security database and that is stored in **SAM** file, storing passwords and usernames and other details. Therefore, every system works independently, hence it is called **Workgroup** Mode, only those users created within the system will be available to use on the same system system only. Thus the user created on one coputer ca log on from that computer only, that user cannot log on to other computer.

- **Shared Folders**
    - Now if you need to give access to specific user, but the user isn't using the same Machine and therefore if he needs to access the file, he needs to run down to that machine only then he can, but there is solution to this problem, i.e., **Shared Folders**, **File Sharing service**.

    - The shared folders will be available to the machines on the same network. And thus, you can access the file, *if they are sharing the same network*.

    - **How to make sure the network is same ?** 
      - First you need to check whether the networks are on the same subnet.
      - Then you would need to write the password for the user authentication, as the windows being a secure system can't let any user in whoes entry isn't made inside the SAM file.
      - So, if you share passwords, there might be a possiblity that your password gets comporomised.
    
    - **How to make sure that there is no password sharing problem ?**
        - So you need to create one user on all the sytems having same name and same password, such that **SAM** can recognise the same user trying to access the **shared file** from differnt machine without authentication.
        - In this case if a **user1** password is changes on machine1, there the password on other machine with **user1** won't change, so again, management is a problem.

- **Central Security Database**
    - Instead of working in **Workgroup** mode, you will have only one account, through which you'll be able to manage all the users within the organisation.

<br>

# AD DS (Active Directory Domain Service)

It is the service that allows you to create a **centralised security database**. **AD** is where you create user directories and user accounts and passwords and store their data. You need a plan that you need to execute here you are going to configure **AD** on all 1000 machines, but only one. Remember that Active Directory is for administrators and therefore it eases the job of administrator, it stores the data of users and has a logical and hierarchical structure where adminstrator can manage all the users in the organisation.

Active Directory contains two concepts, **domain** and **forest** but remember that **AD** shows itself through a logical plane that consists **domain** and **forest** and **tree** but relies on the physical structure that is **database** and this database is stored on all the **domain controller** of the forest. Lets see the elements involved in **Logical Structure** of Active Directory.

1. **Domain**
  - It is logical group of computers or devicees which follow a comman security database, such that these logical groups are not fixed and can be changed as per requirements.
  - These domain names can be given in **internet** format, such as, ***sunbeam.com***, ***ditiss.lab***.

---

2. **Domain Tree**
  - It is collection of domanis which share a comman namespace and are bind with parent and child realationship.
  - If you create a name with *cdac.com* and *param.cdac.com*, then *cdac.com* becomes the parent of *param.cdac.com* and therefore it follows the tree structure, hierarchical structure.

---

3. **Forest**
  - Suppose there are multiple TATA groups, so in order to go into multiple groups there has to be only one account so that there are not multiple accounts wandering in multiple groups.
  - *Again*, It is also a **logical entity**.
  - It is colletion of domain trees, all the domains within a forest are bind with 2 way trusts.

---

4. **Domain Controller**
  - It is server whihc creates the security database for the domain and hosts it.
  - Each domain has its own **Domain Controller**.

---

5. **Additional Domain Controller**
  - It is server that copies the securty database feom ta somain controiller. It works as a backup for domain controller.
  - Becuase all the usernames and passwords are saved on **Domain Controller** and if it fails, **ADC** will verify the users and login the users.
  - **ADC** also does **Load Balancing**, meaning it manages the load based on traffic.
  - A domain may have any number of ADCs.
  - The purpose of ADC is to overcome the **load balancing** and manage the **trafficing**.
  - Also it allows security database management from multiple locations.



# Forest

- Collection of domain trees, and binds all the user database to it.
- Everytime there will be an user login to 
- Multiple ADCs can be created using this arhctitecture.
- There is only one server tha needs configuraiton. 
- If you need to add another password, so tha tdoesn't mean that thre is local management in the comapny.


# Add Roles and Features







    


