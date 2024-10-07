# Installatin of the Operating system

The first thing that need yor concern is not installatin, but the Booting sequence and BIOS and different important factors that are used while the **partitioning**. Wht is MBR and Booting process, and **GParted**, all thes concepts relating to **Boot tweaking**. *You might ask what is UEFI*, and *mounting*, and several other concepts that are important for the Operating system.

# The very first question?

You can't just use multiple OS as virtual machines as there are lots of pros and cons and every machine is limited by its hardware and software, you can't efficiently test it. Even **JAVA** on different machines have different outputs and ther fore you can't just install java on multiple OS and except the same output. 

- PXE - Pre execution environment, a CDDVD on different machine and through network you can install servers and OPerating system.
- Post-install troubleshoot - After installation you can ruin that system, but that is not part of the workshop.

We'll be installing Windows 7, Ubuntu, Solaris, PC-BSD, Red Hat, SuSE, and Window 2012, and Windows 8.1. Remember that there is **Lunux** (Red Hat, Ubuntu, Mac OS X), then **Windows** (Window 8.1, Window 2012, and Window 7).

Red Hat is popularly used in US, and it provide great infrastructure for enterprises. SuSE is good for all task such as development and administration popularly used in UK. Ubuntu is another popular Linux OS nowadays. Ubuntu has a strong community support. 

*You might ask what Solaris?* Almost every company has solaris server, the most popular **UNIX server**. On solaris, **Java** is highly efficient. It cam e with special file system, called ZFS (ZetaByte File System), a foundational network file system designed by Solaris Community. There are two version of **Solaris**, designed for **SPARC (Sun Processor Architecture)**, later it was called **Scalable Processor Architecture**. It wasn't supported for other verion of PCs, so community created another system called **Open Solaris**, it could be easily installed on **AMD**, and **Intel** systems. The version came out in **2009**. InidanaOS is another project that is getting developed by **Solaris Community**.

**PC-BSD**. University of callifornia got all the source code of the **UNIX** and later we came to know about **Linux**, one flavour is **PC-BSD**, other than this ther is BSD, a unix server. BSD got five flavour. Few things that we got from 

- `Vi` editor was developed by **Bill Joy**, one of researcher in Berkely. Great guy!
- **CShell**, is one of the shell that is close to the C language.
- **Text-based Graphics**, one popular example is TurboC.
- **Concept of Virtual Memory**, it gave the concept of **demand paging**.
- **Socket Programming** - the lowest level fo communication. 
- **TCP** - the first protocol was developed on **BSD** unix.
- **Mac OS X** - consists of the mach and unix.

# BIOS 

Bios has several information among which one of the options **Intel@ Virtualistion Technology** should be enabled. Another important thing is **Boot Menu** Type. The order of booting goes something like CD/DVD -> Pendrive -> Hard Disk. This is recommended priorty, and third choice is **PXE** (Boot Network). 

# How to give Partition?

We are using the Ambier Partitioning, maximum of 4 partitioning. 

- The very first partition is to be given to the Window 7.
- Then second has to be Solaris
- Another is BSD

Basically there are three partitioning and then there is extended partitioning and therefore you can create multiple small partitioning in the extended partition. In extended you can use:

- Windows 8.1, we'll be installing an Virtual Machine we can isntall **Ubuntu**.
- Then, SuSE, in SuSE, there is going to be Virtual Machine, i.e., Windows 2012.
- Then, S
- Then, Red Hat
- After that, Fedora
- On a different hard disk you can install a Mac OS X

Remember that earlier there was used Partition magic number which was available on Hiren Boot Series. **Partition Magic Number** is a Window based software. You can't do it all, you need to use the Third-party software. 

But it is better to go for Linux based software called **GParted**.

# GParted (GNOME parted Edition)

Once you'll load the GParted, you get the interface where you need to give the partitioning, one for Windows, then solaris, if doing BSD partition, ***don't take the fat or ntfs***, now you need to make other partition for extended partition. All these are primary partitioning.

When you start creating for extended partitioning, there has to be **logical partitioning**. 

# Solaris

When you start the **Solaris**, you might see a terminology **VESA (Video Electronics Standard Association)**, this is becuase your system is able to understand what it is about the graphics, therfore **VESA** is an standard. The basic minimal staandard that is followed by all graphic card that is understandable by system. All the companies supports this VESA standard.

*You might see* **KDE (Komman Desktop Environment)** or **GNOME** as your GUI standard. THe GUI that your see other than this could be **CDE (Comman Desktop Environment)**. 

*What is Live CDE?* This is the when you are able to access different resources without installing the Operating system. But there are two problem, it is running on CD/DVD we can't send our data to it, we cannot install any other software, memory management and all, thus it will be very slow. Remember that the first **Live CDE** was developed by **KNOPICS**.

# The rules why we have this paradigm

There are two kinds, one is MBR and another is GPT

*Why and How we do it?* It basically starts with **File System**, when you talk about *NTFS* file system, there is different management, when talking about *ZFS*, it is different logically. Every File System has different *logic* of management. 

Logically there are different section of file system:
- **Boot** block contains all the info regarding the booting process (Boot loader and Bootstrap).
- **Data** block that stores your actual data, divided into small blocks.
- **iNode** block stores info of the files, such as permissions, what kind of data and all.
- **Super** block already stores the information about the spaces, it also stores which data blocks are free.

# Bootstap and Boot loader

The one that loads the kernel to the memory, and **bootstrap** is always specific for Operating System. Bootstrap for Windows is different and for Linux is different. *Whereas*, Bootstrap gives you option which OS is to be installed in case you've installed multiple OSs. It also give the control of respective OS. **That's GRUB**. 

- Whenever you boot OS, you might see the **Boot Loader**, which ask for what OS you might choose to run and respectively it gives you the respective OS command.

- Windows older verison before the Vista was **NTADR (New Technology)**, the new one was called **Boot NGR**. The **boot configuration file** is saved in **boot ini**, **bc (boot config data)**, and the kernel of windows is saved in `ntoskrnl.exec` called NT kernel.

- Solaris which is the original Solaris, has the boot loader named as **Silo**.

- **GRUB** is Grand Unified Boot Loader. All the linux operating system has GRUB, another is **LILO**, one another is **U Boot**. The name of GRUB boot loader config file is **Menu .lst** file. And for the GRUB2, **grub.cfg** and for **U Boot** is called **uboot.txt**.

- BSD uses the **BTX (Boot Extended)** as their boot loader. 
- Mac OS has two boot loader **Darwin** and the boot loader for the **Chameleon**, and another is **Chimera**.

All these names are stored in **boot loader configruation** files, at least you'll see some configuration files. 

# What is CRON?

It is scheduler, every configuration file that needs deletion or need changes to be made, then that is **CRON**.

- ATA (Advance Technology Attachment)
  - SATA (Serial ATA)
  - PATA (Parallel ATA)

# What is MBR (Master Boot record)?

In 1980s when PCs came out, there were Floppy disk, the whole operating system used ot reside on that disk and the basic minimal program that is saved on flash memory to active the hardware was called the **firmware** that firmware is called **BIOS**.

- The very first limitation of BIOS was the maximum size of the BIOS was **2TB**.
- The disk partitioning scheme was called **MBR**.
- There was no **secure boot concept**.
- There was no OEM (Original Equipment Manufracture) looking concept.
- There was no programming support.

There were rules for MBR partitioning scheme:

- The maximum possible partition was **4**.
- Out of 4 one partition, you can make one as an **extended primary**
- Thus inside the extended you can create multiple logical partition.

The **Boot Section** is divided into two parts, one is composed different section starting with:

- 440KB - that stores the Boot Strap
- 4KB - stores the Vendor disk signature
- 2KB - this has a null value if it is not null that means it is corrupted.
- 64KB - this is partition table

Remember for other primary partition there won't be any other partition table becuase those first **512KB** file is ***super important*** and hence, there it is called MBR.

# Partition Table

- **64Kb** Partition table
  - **16KB** - is the size of every entry
  - Every partition is given a partition section that stores the Partition system ID, thus at a time there is only allowed that will tell which system was running previous and therefore there need to be only one.
  - **startchs** and **endingchs**
  - Remember that if you tried booting without making change in the partition table with the one that was previously enabled as active partitioning.


Remember the rules that PC-BSD cannot be installed on any other partition, therefore you need to understand that you can't give partition to any OS, becuase of the rules and needs of specific OSs. And Original **Solaris** rule says that it only need the partition withint the first **8Gb** of partition. Therefore, after Windows we gave the **Solaris**. But Open solaris can be given any primary partition. 

Windows can't be on second partition, but with multiple verison of window, the lower version of window should be on first primary. Windows with multiple versions, it should be installed sequence. If you tried intalling multiple version of windows you won't be able to install the higher verison after the lower version.

