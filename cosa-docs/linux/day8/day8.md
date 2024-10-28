# Dvice Drivers

Operating system is the **interface program** that stands between the user and the hardware, operating system do have certain reponsibilities and some of them are mentioned below, but the we are interested in **device drivers**.

- Memory Mangement
- Process Mangement
- File System Mangement
- CPU Scheduling
- Hardware Abstraction

These are device specific **drivers** that are driven by users, meaning every device comes with the device drivers and therefore, every device has a **Device Driver**. It is the part of operating system management system that includes management of devices through 

# kernel

Kernel has everything, whatever the O[erating sytem do, it does it rhough Kernel.

# Memory Management

Memory pyramid looks something like this, Register> cache> RAM > Disk. As you go up to down , the cost decreases.

Register and Cache are fixec and RAM and disk are dynamic and therefore they can be replaces and therefore they are slow.

# Process Mangement

- Program is file containing executable code

- Process - running instance of the progam executed inside the Primary memroy.

- Operating system loader is used to create the programs into process, loader will load the program into the memroy and create aprocess.

# File system Management

Every Operating system has the File sytem.

#### Window
- FAT (File ALlocatio Table)
- NTFS (New Technolog file system), exFAT

#### Linux

- ext4, raiserFS, XFS (Express/Extended File system), ZFS

#### Mac

- APFS (Apple File System), HFS (Hierarchical File system)

#### Android 

- YAFFA V2, 

#### iOS

- xHFS+ (extended HFS+)

# CPU Management

The management of CPU Sche

# Hardware Abstraction

It handles the hardware abstraction layer, it is collection of device drivers.

# How you should use your Operating System?

- First, you shoul dbe an end user of teh any operating system, meaing knowing diffferent commands that willhelp you to do tasks.
- OS Administrator
- Be a developer of that operating system
- Designer of the Iperating system.

Thats the path to become an Master of the Operating system.

# OS Administration

- It is differfent from window admin, as an admin:]
  - the primary responsitbiltu will be mangeing differnet server, like DNS server, webs server, and more sereer, many times your would be needing to allocate servers to the clients.

  - Next, you need to **debug**.

  - Next, you need to develop the tools for the different OS environment and its uer, these tools will be needed for creating the secured environment that will protect the OS.

  - Working with the IT team and you'll be needing to go into the market check for best router, and check them, and analyse.

# Unix

*Lets see what exactly Linux and Unix?* Linux has distributions and Unix has flavours. Remember that linux is not the flavour of UNix, it is only inspired by Unix.

Unix has various flavours such as
- HP-UX,
- DunOS and Solaris, 
- IRIX (One of best OS of Linux becuase they were developed using silicon Computer OpenGL), 
- AIX (It was created by IBM)
- (BSD) Berkely Software Distribution, ut was developed y University of California, Berkeley. If we talk about BSD, it was the first one to create the 

    - **Redirection Pipe**, which is used to pass input/output of one command to another command.
    - **Socket**, which leds to the communication over the internet, they added socket and socket led to TCP/IP communication.
    - **Networking**, it introduced networking to the world, tcp/ip implementation of the network layer 4.
    - Many user level utilities.

It is not like that, there are many version of the BSD, there is NetBSD, OpenNSD, and FreeBSD. 

- SCO Unix
- NEXTSTEP and OPenStep another created by the Steve Jobs, it has whole story behind it and even today, Apple Mac is using NEXTSTEP and OpenStep, which is one version of Unix 64bit Unix. 

# Linux - Free Software Movement

It was led by Unix Developers, Linus Torvald developed the Linux kernel, not the whole system but theh kernel of LInux, it was possible basically becuase of the Tambern who was developing a MINIX operating systemw which has lots of issures.

### Open Source vs Free Source

Not every Open 

MacOS is itself us Unix, and Linux is inspired by Unix, and Windows is also a copy of First version of Mac which is called LISA.

Apple Kernel - FreeBSD Darwin + CMU XNU, whichis know as Hybrid Kernel. Aple OS us not FOSS, which us not Free Open Source. <Br>
Linux = Free + open Source

# Feature of Linux

Let's talk about the free (Freedom) of linux, some linux distribution are devided into two parts:

- Debian
  - Managed by **dpkg**, it debian package manager
  - Ubuntu is good for Clients, say End-Users
- RHEL
  - Managed by **rpm**, RHEL's package manager.
  - WHile RHEL is best for Server Managers.

# Linux Distribution

# What is WebServers?

A server is a software running a service, it runs contineously, listens to a specific port, deployed for solving specific problem. Servers has many types, such as,WebServers includes **Apache** which is used to host the websites, then other type is Database Servers **MySQL** which are to store the data permanenetly. Then there is File Server, such as **FTP** and **Samba**. Then there are Load Balancer, used to balance the load suhc as **HAProxy**, Highly Avaialable Proxy. Then there is DNS, Domain Name Server, converting domain names to IP such as **BIND**.

# Linux Deployment

**CLuster** is the group of Machines known as nodes or machine, those machine when we comabine we are able to group the nodes (Machines), it is the backbone for all the services like Prime, Netflix. This is the major reason every company is using the Cluster, because these are using Cluster behind, it is base of Network Load balancing.

# Interface

#### Windows: Aero/ Metro Interface

#### Mac: Acqua

There is non freedom to choose any of repective GUI and therefore we can't install any different environment. But we can do that in Linux.

#### Why Linux us called Zero UI



#### GNOME Borrows many Features from Mac

Becuase thre arenany feature that GNOME takes from the Mac, it is user-friendly and quite food performance, but if you want to go for the performance you need to go for the **XCE**.

# Command Line Interface

- The Actions in the CLI are reproducable, becuase if you know the commadn, there is no need to execute again and again.

- You can acheive **replication** quite quickly. 

- Installation of GUI is often optional, mostly Linux have the GUI less interface, therefore there are no GUI for better Performance.

- Performance is really good! Becuase in case of GUI the sytem itself take hige amount of data at the startup but that is not the case wtih the CLI.

- 

# What is Shell Script?

Shell is a file containing list of commands, file has an extension `.sh` and shell executes these commands sequestially. 

# What is Shell?

It is an program that interprets the commands. It is called as **Command Interpreter**, the one that interprets the commands. It uses and Kernel and other utilities to execute the commands. So whatever we require to execute the command, the shell pases it to the kernel and we can perform the operations using Shell. There are multiple Shell such as sh, zsh, and bash. 

# Understanding Commands

A command is an **program** which interacts with the kernle to provide the envirnoment and perform the function. All these command are written in C and partially in .. , there can be built-in commands and then there are external command which are not integrated with the Shell. 

- Use `compgen -b` to list all the command that

# Command Syntax

```
command [subcommand] [options] argument
```

- `who` will tell who is logged in what processes are running. 
- `cal` it gives calender of year also
- `type` it will show the file 
```
❯ type date
date is /bin/date
```
- `file` it will show the type of the file.
- `which`, it will show 

# Usefuls Shortcuts

- *Ctrl + r* - Very Useful utility that will search for the last executed command with the string.

# Working with Files

File us collection of files on a disk eve

# Types of executable files

There are few executable files:

- One **Self-Executbale files**
  - In windows, all the files, such as `.exe`, `.bat`, and `.com` which are used as self-executable files.
  - In 
- Another is **Dependable Executable files**
  - 
    - Static Executable Files `.lib`
    - Another is Dynamic Executable Files `.dll`

# File System Hierarchy

- It will store all the configuration files and thre

