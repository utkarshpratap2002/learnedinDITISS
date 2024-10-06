# What are the jobs of an Adminstrator?

# Windows Server

Windows server are different and client are not expected to be that effiient and ther fore servers require:
- Efficient processing, so that services can be processed efficiently
- Strong hardware support, so that it could have good RAM

Server OS is designed for large or medium scaled organisations, one of the reasons it is used ot manage the services for all the **end users**. 

It is important to know the right edition currently in the market, i.e., currently there are 10 different editions:

- Windows 10 Home, Pro, Pro for Workstations, Enterprise, Enterprise LTSC, Education, Pro Education, S mode, IoT and Team.
- **Windows 10 Pro** and Enterprise are designed for use in cooperate environment where Central management of IT equipement is required.

### LTSC (Long-Term Servicing Channel)

THese system won't make any changes to the system configurations if any new updates are landed. Suppose if **ISRO** is going to launch the rocket, where the calculations are made upto 15 decimals, so at such critical places LTSC is used.

### Features of Windows 10 Pro and Enterprise

Feature of the Window 10 Pro:

- **AD (Active Directory)** - It is the most important feature, such that, IT staff can easily manage the PCs and end users, accounts and groups.

- **Group Policy**

- **Remote Desktop** - The fewature allows administrators or users to remotely accesss teh computer and work on it.

- **Hyper-V** - This allows to create VMs

- **Bitlocker Encyption** - It is full volume encryption.

Refer to **gpedit policy** for administrators and it is not available in Home edition.

### Difference between Window OS and Server

- **Expandable/Scalability**
  - There is much more RAM available for the organistion if they feel like exapaned
  - Windows server 2016 supports 24TB of RAM
  - Windows 2012 Datacenters and standard supoprt upt o4TB of RAM
  - Windows server 2008R2  supports 2TB of RAM.
  - Similarly, the num of processors are not limited to 2 CPUs
  - **Windows 10 Pro** workstation edition supports 4 CPUs
  - Server 2016 and 2019 supports 64 sockets, meaning 64 CPUs are supported, and these server editions support unlimited number of cores.

These high-end servers have high-end capacity and therefore these are used for running Virtual Machines.

You also need to check what servers are there, how many slots are ther, what kid of RAM is there and **Speed** is important, and therefore, you need to check all these information about cores and speed.

- **Window 10** support maximum of 10 incoming connections, but for server edtion thre could be unlimited incomming connections.

<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>NOTE</strong> Whenever you see a problem, you first need to check the server logs. You will find some information.
</div>
<br> 

- Server OS is customised for better performance.

- Support for lot of network services. It comes with lot of network services.

- Better storage support, becuae the Server OS has builtin support different protocols and technologies, also has **RAID** support within the hard disk.

<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>NOTE</strong> First you need to start with the what kind of slots and what kinds of RAM your system has, therefore you need to start looking into your own system. 
</div>
<br> 

Full Packaged Product **Retail** are available for Window 10 **Home** and **Pro**. Thus they are preinstalled by the **OEM**, windows 10 Pro, Window 10 Home.

Windows 10 licensing comes in to commercial licensing, such as Windows 10 Pro, WIndow s 10 Enterprise, Window 10 Enterprose LTSC.

There are two ore windows 10 Enterprise offers , windows 10 Enterpreise E3 and windows 10 Enterprise E5. Each of these can be purchased on a **per device** or **per user** basis and are available only through commercial licensing including the cloud solution provide program.

### Virtual Machine 

Hypervisor is a software that provides virtualisation. There are two kinds of hypervisor that are used for the Virtualisation.

- **Bare Metal**, also called Type 1 Hypervisor, installed as an OS on Hardware, for example, Linux KVM, Microsoft hyper-V, and VMWare ESXi Server.

- **Application** - Installed as an application on existing OS, also called Type 2 Hypervisor, for example, VMWare Workstation Pro, VMWare Player, Oracle VirtualBox.


To release the ouse thene eyou nedd use th folllow commamds:
- *Cntl+Alt+*  Shrink mode.


# What if File is not found?

If while operating system setup, you find that there is no Operating system file found, that means it is problem of **Hard driver**, such that it is not able to find the right path, therefore you need to set the path.

*Now what if the servers are not given the names?* Refer to [operating system partitioning](../../operating-system-doc/os-partition.md) to learn more about partitioning and hence you need to give names to the server which are manageable and rememberable.

Once you'll be started with Server OS you'll find all the services and groups running. You can also go to **Local Server** and then you can go to manage the **time zone**, and need to change the *data and time* as well.

Next you need to give IP address on *Ethernet0*, it is same old classic way of giving IP address. The moment you provide the IP address the internet will go off. Then you need to *restart*, otherwise you'll get any error, which tells you that *previous restart* is pending.

*Remember MBR*, it is the first track that stores the **Partition table** of the other partitions of the system.

### RAID (Redundant Array of Independent Disk)

There are lots of RAID, we will be seeing raid1, raid6. 

- **RAID 1** needs maximum 2 hard disk, such that same data is written on boththe files, even if one fails, there will be another to recover.
- **RAID 5** is called data striping with parity, becuae miimum three hard disks. The maximum you can add as your needs and requirement.
  - Divide into 2 stripe sets and parity information 
  - stored on 4 hard  disk

**WHat is difference between hardware raid and software raid?**