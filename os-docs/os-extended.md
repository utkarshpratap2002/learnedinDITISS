# Why not FAT and NTFS?

Remember that during [Gparted configuration](os-partition.md#gparted-gnome-parted-edition) we were configuring the Gparted as zfs and ufs because we wanted that windown shouldn't be able to detect the partitioning which is out D: drive an E: drive and therefore we gave the partitioning that wasn't detectatble with your current drives.

Thererfore we gave the zfs and ufs so that it isn't detectable, becuase then it will directly detect the the Window 8 and Data partition.

You can say that before starting your operating system you can go and start the (DO SEARCH IT)

# `bdcedit` Command

This command is only available on user command prompt, *what you need to do?* 

- Open the Cmd Prompt
- Open as **admin** 
- and do `bcdedit` and you'll find two entries, one for windows 7 and another for window 8.

For every entry it would have four components:
- identifier, **GUID** a unique 128 bit is a unique id that unique in entire world, made using the NIC card number + current time stamp, has the structure of **boot mgr**, **current**, **default mgr**. Yes ofc, it is a long number, no need to remember but it does indicates the whole structure of boot mgr, current, and default mgr.
- device, this is device name that contains the partition information, say drive C
- path, it is the path of boot loader program
- and description, this stores the title to be displayed

The boot loader of the Window 8 and 7 will be exist on the D: drive, as this doesn't mean that the bootstrap of the Window 8 will remain where there is window 8, but tthe loot loader is changed, thus it existe on the C: drive only. 

#### `bcdedit /set`

This will help you edit all the entries of the option menu, now you can use the help menu to edit the GUID's path it description and then you edit and set the description using:

```
bcdedit /set {. . . .} "Sunbeam"
```

In order you need to set the description:
```
bcdedit /description { ... }
```
Now reboot the system and check *what options it is showing*. You need to know **bcdedit** and need to play around if you need to know it better.

# SuSE Installation

Never go for **automatic configuration**, and then you need to make the static configuration on your own. Remember how **linux** detects partitions and the partitions are called sad1, sda2, and sda3, and so on, and do remember that when the partition of the sda gets initialised in this way, the first partition has sda1, second wil sda2, and third will take sda3, and sda4 will be taken by the extended partition.

You should always remember that your boot loader should always go to the main, i.e., MBR, becuase you don't want to keep switching the boot loader again and again to run the **BSD** and threfore you need the boot loader of the **SuSE** at the front, i.e., MBR. Now the boot loader can see all the OSs that are installed on the Partition.

In SuSE **firewalls** and **SSH** bydefault on. 

# Windows Booting

The process of Linux Booting:

- Power ON
- Base ROM, basically **BIOS**
- **Power On Self Test** - It is a self test inspection that starts a self test, you might have observed that there were some kind of blinking of the CD that is basically the self test that check all the hardware and is called **Power On Self Test**.
- **Bootstrap** loader and this inspect the very first bootable program. This is done by the bootstrap only as per the boot device priority given to device. Remember that first 512B is empty that means it is not bootable, and it is necessry for a device to have first 512B of **Bootstrap**. 
-The other software that are used for making your pendirive **bootable** is basically doing nothing but they are **copying the files**, and also **bootable block**. You might ask *why the normal copy paste won't work?* This is becuase that won't copy your bootable block. This second 512B will be a readable file and it shows the option that you want to boot. This will give you the readable configuration.
- Lastly it will load the kernel into the RAM.
- Then there is **Hardware configuration**.

Then you can go on `fdisk /dev/sda` and configure the partitioning such that using certain commands. See and configure the partition, see if there are any duplicate or more than one partitioning active.

Windows booting process is same only that hardware changes.

# Fedora Installation

- The first thing that will come up is the **user session**, and this is the normal startup sequence and normal shut down sequence. 
- Windows fast booting process is only in the hybrid booting people

When we talk about the windows, there are three kind od states. We need to understand the below in order to understand **Hybrid Shutdown**.

- Sleep - This frozen RAM, thus, when 
- Hybirnate - This cuts the power and freezes the RAM and then copy the RAM contents to the hard disk and when next time it boots, it checks if it is in Hybirnating state and after that it takes the data and out it back to the RAM. And everything start working.
- Shutdown - It closes everything, all the services are closed, nothing is saved for the next time. 

Now lets understand what is *Hybirnate shutdown*, there are three kind of seesion, one is **Hardware session**, **User session**, and then there is **system session**.

- First the **user programs/sessions** are closed
- Second the system sessions are stored inside the disk as the backup and restore session is already created
- Third **Hardware session** is also closed.

Do not install boot loader, means do not install boot loader.

Remember till Fedora, there is only Bootstrap of the Fedora on the Fedora partition, but all the other partitions are on the MBR except **Fedora**. If you've looked into the **grub-config** file you must have seen that it identifies the linux using it name, i.e., **vmlinuz**, this is the name that uniquely identifies the **linux**.

# grup-config

The configuration of the grup-config is done in the respective manner:

```
menyentry 'Fedora Core 20 (Somename)' --class os {
    set root='hd0, msdos8'
    linux /boot/vmlinuz-3.11.10-301.fc20.x86_64 root=/dev/sfa8 splash=no
    initrd 
}
```
Now, when doing the entry for the **linux**, there are three entries to be done, one for **root**, another is for **linux**, then  another is for **initrd**, whereas `root=/dev/sfa8 splash=no` is called kernel boot parameters.

- *You might ask what is kernel boot parameter?* Thi stells kernle that where it is starting from and this also tells that there is no need for the splash. Next there is initial RAM Disk, this file path needs to be copied otherwise the kernel will never boot.

- **chainloader +1** is one that that tells the destination of the partitioning and therefore it is important the path and 
- **initrd** - initial ram disk won't be able to find the **kernel root parameter** until and unless you don't mention the **root file**, as if you don't add this **root parameter** file kernel won't recognise it, therefore there is need to **copy** the file path into the hard drive, and this initial RAM disk will be able to identify the the file **through `initrd`**.

Still the problem is not solved, therefore you need to make the changes to `/etc/grub.d/grub.conf` the main changes are to be made in this file only.

- In **Red Hat** based systems, use the command **`grub-mkconf`** to overwrite the configuration.
- Now in **Ubuntu**, you need to use **`update-grub`**.
- Now in **SuSE**, you need to use **`update-bootloader`**

This was all about **GRUB Tweaking**. 

# Virtual Machine

- Virtual Machines are used heavly in the industry and are best for development of software amd application
- Next, these VMs are used for learning netowrking and Security, as one of these machine are used for the security testing.

*You might ask where Virtual Machines shouldn't be uesd?* You can't use VMs for running games, for hardware intensive jobs, and don't use for **device drivers**, it is also a bad choice if you are using it for the 

- **XEN** or **KVM (Kernel Virtual Machine)** is another virtual machien that is use only to install Linux.
- **DOS** is another Virtual Environment that is used for the playing classic games.
- **Q Emulator** is another **qemu** based emulator that can emulate the hardware solutions such as **arm**, **mips**, **x86**.
- **WINE (Wine Is Not Emulator)** used for the running the application on the upper layer of the Operating system.
- **CygWin** - Linis apps on windows, system calls/APIs virtualisation.

There are two types of VIrtualisation:

- **Type 1 Virtualisation** - It is the kind that uses spereate **Hypervisor** that runs over the Hardware and this uses the full potential of the hardware if the OS is removed form the layer.
- **Type 2 Virtualisation** - This is another technology that is uses virtualisation over the host OS

# Containerisation







