# Storage

Storage is defined as the four parameter as given below:

- Types
- Partitioning
  - Physical volumes 
  - Logical volumes, it is what we called LVM (Logical Volume Mangment)
- Format/ Creating File System on disk
- Mounting

# Administrative Storage

Administrative storage refers to the dynamic and flexible storage choices that an adminstrator might make to ensure or resolve the storage requirement within the organisation. There can be traditional storage mediums that work well for partitioning and there can be Logical Volumes for the efficient storage management.

1. Mangement involes the management of disk, understaning hardware such as PATA (Prallel ATA), SATA (Serial ATA), and SCSI (Small Computer System Interface). It basically means how you can change or manipulate the storage options.
2. Sysadmins needs to know the hardware very well, because until you don't you won't be able to [understand the data](#understanding-storage).

Storage are multiple types, one is **electornic** medium, such as SSD, Flash Drives (containing USB sticks), these are called electronic medium, data gets stored in **resultant** currents. For example, SSDs nowadays.

The second type is called **magnetic** medium, for example, HDDs, here data is stored in magenetic poles, such as North pole and South pole. Thus, this means unlike the resultant current where there are either 0 or 1 representing the current, but here in magnetic disk, it is north pole and south pole, north pole represent the 0 and south pole represent the 1.

The third one is called **Polycarbonate** medium, for example, CD/DVD storage mediums. It has two parts **pit** (representing 1) and **land** (representing 0). The concept of pit and land is simple, they are unchangeable, once the CD is burned, there is no way of going back, and therefore you need to think before you go for the storage options.

*So, there are few consideration*, if you need performance you should consider the electronic medium such as SSDs. If you are going for the large storage, you should go for the HDDs, medium, thus it is for **Database** storage.

Network-based storage, such as NAS, SAN, and cloud technologies, may also be used.

# Understanding Storage

*Now we need to see multiple options for storing the data.* It could be **Capacity** or **Durability**, **bugdet** or **performance**. The hardware decision should be made based on the certain criteria. The certain criterias can be classified in different aspects. 

#### Aspects of storage

HDDs are inexpensive and budget friendly, and have good capacity to store the data. Thus, SDDs are expensive and do give good performance, then, USBs, they are used as the connection devices to connect different devices including storage devices. So there are different interface that allows you to store different kind of data.

|Interface|.extension|
|---------|----------|
|USB| Mostly uesd in Printers, Hard Drives|
|M.2| Used in Internal SSDs|
|SATA| HD/CD Drives |
|PATA| HD/CD Drives|
|Firewire| Cameras, iPods|
|eSATA| Express SATA: Way Faster|

# /dev

It contains all the device files and after the recognistion the linux gives names to the dev. This directory contains all the connected device information and devices can be classified as below.

|Devices||
|-|-|
|**dev/sda** | Any **HDD Driver**/**SDD Drivers** based or could be **SATA** based devices are mentioned as dev/sda, dev/sdb and so on.  |
|**dev/nvme0n1**| It is called **Non-volatile memory express**, any Non-volatile storage options such as modern SDDs are mentioned inside dev/nvme0n1, dev/nvme0n2 and so on.  |
|**dev/hda**| It is called the old-school hard drives that are very slow, uses magnetic disk and are very cheap |
|dev/vda| Called **Kernel-based Virtual Machine**, these are called KVM |
|dev/xvda| When Virtual Machines are running on the Xen, then xvda is used|

# Types of Storage Design

There are storage mediums such as storing data in File Storage, it must be scaled our rather thatn scaled down. It is also called Network File System and Service.\

Then there is block storage, these are stored and given in two methods, it is very quick an reliable, it is basically used in cloud storage, it is also called **NAS (Network Attached Network)**. 

Then there is Object storage, where the data is stored over the static data because it difficult to manage the storage your self, both of them are used on clud.

```
zram0           252:0    0  1.9G  0 disk [SWAP]
```

This is called the SWAP memory.

# Partition

Prtition is the partitioning or speration of the disk that is to be used by end users, For example in windows the **: (colons)** are called partitions, such as **D:** or **C:**. 

- Boot Sector stores the information of the partition, generally it is called MBR (Master Boot Record), when we talk about MBR, it is also called zeroth sector of the disk. These sectors can be read using the foirst 440 Bytes that us called bootcode, it loads the bootloader into the memory. It is the MBRs first 440 bytes that contains the **bootcode** it tell that this disk is bootable. It is like a pointer that points to the bootloader, becuase bootloader can be huge cannot sits within the disk.

- After the first 440 bytes of the disk, it contains the partition table in next **64 bytes** and therefore all the information of the partition is kept in this. Not the partition but the information about it.

- MBR was designed in 1980s, so MB was so big memory, was too much. Therefore, MBR is capable of creating only four primary partitions. 

- Becuase there is oly one boot sector this makes it very risky place to place the information and therefoere it is very crucial place to put the information.

# Partitioning Commands

The first we are going to perform is **partition the disk using the fdisk**.

```
sudo fdisk device/path/for/the/disk
```

You can go and choose the following menu that will privide you with certain amount of information. For example, if you choose **F**, it will list the partition space.

```
Start      End  Sectors Size
2048 23068671 23066624  11G
```

Then there is **add a new partition**, which will create a new partition.

```
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
```

Then it will ask for the partition number, meaning it will create the type of partition, we want to create the partition of the primary so type *p*, the it'll ask for the following.

```
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (1-4, default 1): 1
First sector (2048-23068671, default 2048): 
Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-23068671, default 23068671): 

Created a new partition 1 of type 'Linux' and of size 11 GiB.
```

If you need to check the partition, then use the **p**. But yet nothing is commited, so you need to write the partition table using **w**. 

Now you can go and check and see the partition in the follwoing manner.

```
nvme0n2         259:4    0   11G  0 disk 
└─nvme0n2p1     259:5    0   11G  0 part 
```

This has created the partition of the **one** disk. Now we need to go and delete the existing partition and use **d** to delete the partition we previously created.

```
Selected partition 1
Partition 1 has been deleted.
```

Now we need to add the partition, use **n** again to add new partition.

```

```

```
Partition type
   p   primary (1 primary, 0 extended, 3 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (2-4, default 2): 2
First sector (9766912-23068671, default 9766912): 
Last sector, +/-sectors or +/-size{K,M,G,T,P} (9766912-23068671, default 23068671): +5GB
```

Now you can save the changes and quit using the **w** and now if you check the partition using the `sudo lsblk` command.

```
nvme0n2         259:4    0   11G  0 disk 
├─nvme0n2p1     259:5    0  4.7G  0 part 
└─nvme0n2p2     259:8    0  4.7G  0 part 
```

# Adding a File System

As you need to first format the file system, as you need to initialise the file system using the following command:

```
sudo 
```

# Mounting the Partition

First you need to create the partition using the following command.

```
sudo mkdir /part1
```

```
/boot                 /dev/nvme0n1p2          xfs        rw,relatime,seclabel,attr2,inode64,logbufs=8,logbsize=32k,noquota
```

# Making the Mount Persistent

The persistence of the mount file is important, if you shutdown your system and then restart the mounted points will gone while you go and check on them. So in that case, you need to mount again when you login. 

Making the mount permanent using the following commands. Go to the **/etc/fstab**.

```
sudo vim /etc/fstab
```

Then make the changes in th entry.

```
/dev/nvme0n2p1  /mnt/disk1      ext4    defaults        0 0
/dev/nvme0n2p2  /mnt/disk2      ext4    defaults        0 0
```

# Auto-Mounting 

First you need to know that yo can check the default mounting using done by systemd. 

```
sudo systemctl get-default
```

Now, you need to creating the file

```
sudo vim /etc/systemd/system/p1.mount
```

The  you need add th follwoing entry in the file. 

```
[Unit]
Description="This is a test mountused to mount first partition"

[Mount]
What=/dev/nvme0n2p1
Where=/p1
```

# LVM 

Logical Volume Management is the concept of using the distinct hard drive, say 10GB each, but you can't create a 25GB of partition on the Hard Drives. Thus, LVM provides a better storage meangement and this enables you to create associated logical disk, not real, but you can utilize the storage of three different disk into **one** logical Storage. That is called **LVM**.

You can find the logical creation of the disk inside **/dev/mapper**.

Lets see the steps again, we are going to do the mounting 

### Physical Volume

```
nvme0n3         259:8    0   10G  0 disk
nvme0n4         259:9    0   10G  0 disk
```

Check the default Physical VOlume created at the time of booting

```
root@localhost:~# pvs
  PV             VG     Fmt  Attr PSize  PFree
  /dev/nvme0n1p3 fedora lvm2 a--  18.41g 3.41g
```

Now we need to create th physical voleume

```
root@localhost:~# sudo pvcreate /dev/nvme0n3
  Physical volume "/dev/nvme0n3" successfully created.
root@localhost:~# sudo pvcreate /dev/nvme0n4
  Physical volume "/dev/nvme0n4" successfully created.
```

You can also check for the information of the disk created

```
root@localhost:~# pvdisplay /dev/nvme0n3
  "/dev/nvme0n3" is a new physical volume of "10.00 GiB"
  --- NEW Physical volume ---
  PV Name               /dev/nvme0n3
  VG Name               
  PV Size               10.00 GiB
  Allocatable           NO
  PE Size               0   
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               0UwAuo-u7F5-pCxw-0iYl-pNhf-wekl-q46qJN
```

You can see that it is not part of any virtual group. Now we nee dto create the virtual group.

### Virtual Groups

We now need to see the existing virtual group.

```
root@localhost:~# vgs
  VG     #PV #LV #SN Attr   VSize  VFree
  fedora   1   1   0 wz--n- 18.41g 3.41g
```

lets create a new virtual group using two phyical volumes.

```
root@localhost:~# sudo vgcreate myvg /dev/nvme0n3 /dev/nvme0n4
  Volume group "myvg" successfully created
```

Now you can check if the vg got created or not

```
root@localhost:~# vgs
  VG     #PV #LV #SN Attr   VSize  VFree 
  fedora   1   1   0 wz--n- 18.41g  3.41g
  myvg     2   0   0 wz--n- 19.99g 19.99g
```

Now you can see the vg information using the `vgdisplay`.

```
VG Size               18.41 GiB
```

Now all that is left is the creation of logical volume. 

```
root@localhost:~# lvs
  LV   VG     Attr       LSize  Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root fedora -wi-ao---- 15.00g
```

We can create using the following commands.

```
root@localhost:~# lvcreate -n lv1 -L 15GB myvg
  Logical volume "lv1" created.
```

Now you can check whether the lv got created or not.

```
LV Path                /dev/myvg/lv1
```

Now how do you format this partition. 

```
mkfs.ext4 /dev/mapper/myvg-lv1 
```

Now you need to maas

### Logical Volume