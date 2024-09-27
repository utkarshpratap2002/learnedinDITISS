# What is Operating System?

For any system to be called Operating system, it needs CPU, and all. 

To define the operating system, you can say tat OS is an interface between **End-User** and **Hradware**. Though having an general defination for OS is impossible. Mostly we are using an apllication over the OS, application programs, used to communicate with the operating system.

To tell more about the Operating system, you can say that there is interface between the **application software** and **hardware**.

To me even more precise, we can say that it is a contolled program, controlling the execution of all the softwares running over the operating system. Operating system is a **resource allocator** or say resoruce manager, which allocated hardware resources to the programs running over the operating system, **one-by-one**.

# What lies in CD/DVD IOS file?

It containes the Core Operating sytem software, along with additional application sofrtware, and system utilities (installed by default with the ISO file). The Core operating syustem is also called **Kernel**, becuae eventually all the other are controlled by Kernel, meaning it controls application s/w and system utilities.

# OS is like Big Elephant

Every aspect of the operating system is true but in order to the look at it hardware perspective, it is resource allocator, if you are looking at it using the software, you say it is a application contoller, an every aspect of the operating system is true, becuase it has different agents working in differenet aspect.

# Functions of Operating System


- Process Management
- CPU scheduling 
- Memory Mangement
- File & IO Mangement
- Hardware Extraction
- User Interfacing
- Networking
- Security and Protection

Out of which the Compulsary functionality are the first five and rest is optional. 

*What is Process?* Any Program loaded into the memory is called Process. So all the programs we run are the processes. IPC (Inter-Process Communication) handles all the coomunication between the processes. Thus this can be seen using `ps` cmd in Linux.

*CPU Scheduler* does the scheduling of the Processes. THe OS manages what process should be put into the CPU for processing, for example there is **Round-Robin Algorithm**, **First Come First Serve Algorithm**.

*Memory Management* is done using the RAM, when you need to manage and load the process, every plot of memory is dicided in the memory management. Use `free` cmd or `kill` cmd.

*File IO & Management* is the mangement of files and folder within the operating system, as we use `ls`, `mv`, `mkdir`, and `rmdir` to perform ops on files.

*Hardware Extraction* is the part that is the OS ensuring what part of Hardware is to allocated to the processes. 

*User Interfacing* is the part which provide application programs that helps in dealing with the Hardware components of the machine, importantly our **CLI** through which are are able to perform valrious operations on files and the folders.

*Networking*, basically this layer takes care of the network connection, implementation of TCP/IP, routing, and network security. You can perform networking `ipconfig`, `netstat`, and `ip` commands to configure the network.

*Security and Protection*, is where the OS takes care of the user authentiation, access-control lists, and encyrption of data, this can be performed using the `chmod`, `chrown`, and `sudo` cmds that you might use to implement the security of OS.

# File Management

File is simple collection of data, but with the perspective of Operating system, it see it in data and meta data, one is data that contains the data (actual data), another is meta data that contains the information about the file, operating system sees what the file is about, *what kind information is stored in meta data?* 

- **name/path**, OS stores the data name and the path to the file
- **size**
- **timestamps**, OS stores the create, access, and modify actions 
- **permission** given tothe files, there are three types of permission, read, write, and executable, managed at three levels, user/owner, group, and others
- **types**
- **user/owner**
- **group**
- **link count**
- **data block information**

# File System

Whenever a file is created id first created in data block, then the meta data is stored in **FCB (File control block)**, both these file are stored in different blocks. Remember that data block is by default has size of **4 KB**, this can be changed during the foramtting of the disk.

WHen file is beyond the file size of 4 KB, then there is multiple blocks are allocated to the file. Thus the meta deta (FCB) contains the information about the data block, menaing how much space is manged to the file and what is its size, it is called **Master File Table**, that store all the information about the volume and partition containing **label**, **size**, **filled/empty**, and **information about free data block**.

Partition is also called Boot Sector, containing Boot strap program and Boot loader program.

All these organisation of the files over the disk is called the **File System** on **partitions**, meaning there are partitions, one is for data, then meta data (FCB) called is Master File Table, then there is Volume Control Block, containing the partition and size of the file created, then there is Boot Sector, containing the boot starp and boot loader.

The file sytem used is linux is called Extended File System. The conventions are given below:

- FCB -> iNode
- Master Contol Block -> iNode List
- Volume Control Block -> Super Block
- Boot Sector -> Boot Block

# How Linux manages files?

Liux creates files in **Tree Like Structure**, all the files are manges in Tree data structure, aranging data in multiple array. It is called **Root File Structure**. Linux contains the **root** defined as **`/`**. All the data is organised within the root folder itself.

```
❯ ls /
❯ ls /
Applications System       Volumes      cores        etc          opt          sbin         usr
Library      Users        bin          dev          home         private      tmp          var
```

- **boot** dir - this contains the booting related information of the operating system, information of the kernel that id stored inside the boot. It also contains kernel config file.
- **bin** dir - stands for binary files, all the files are in binary, containing executables of all the existing commands. Think of the `ls` command, when you use `ls` command, the executbales of `ls` is stored in bin directory.
- **sbin** dir - there are command that are only executable by the administrators only, therefore other users cannot execute them, so all those admin cmds are inside the **sbin**. It is also called super user
- **etc** dir - all config files are kept, for example, user configuration files and netowrk config files etc., such as hostname related information, passwords related information etc.
- **root** dir - is for root user or super user, also called home directory of **super** user. All the files that downloaded by root user are saved and stoered here.
- **home** dir - contains all the regular users in the home directory, where repective data or files of the user is saved in respective directories, one user cannot make dir in other users directory.
- **media** dir - all the removable devices are saved here, such as hard disk, pendrives etc., to save the data inside those devices are saved in media directory.
- **mnt** dir - 
- **tmp** dir - data of this directory is tmporary directory, remember that the files in this directory will be removed if the system is shutdown. Only store such data that has to be stored or used temprory.
- **var** dir - variable data files are kept in var directory, used to maintain the log of the activities can be stored in the var directory. For example ther is `dmesg` show the kernel log messages ans these command are used to store the log messages. Check for the **var** directory to check out the logs to troubleshoot the system.
- **usr** dir - all users application data is stored in the usr directory, remember that there is difference as it stores the user application data.
  - bin
  - sbin
  - lib
  - share 
- **lib** dir - 
- **opt** - all the third party data goes to the opt directory, as those s/w not provided by the OS.
- **dev** dir - it has all device files, remember unlike media dir, it stores all the device files.
- **proc** dir - stores all the system processes and system related information, captures memory related information. All the information regarding teh process is stored inside the proc directory.
- **sys** dir - all kernel modules information is stored, as kernel doesn't do anything itself, so all those inforamtion about the modules are stored here.

Remember that **dev**, **proc**, and **sys** directories are the one that are not created during the runtime of the system application, it is called Virtual File System, becaues they are not present on the hardisk.

# Accessing Directories

In order to access the file you need to use the path to the file, the path to the file is a string that contains the path tot the file, for example `/proc/533`, meaning there is **root** -> **proc** -> **533**.

There ar etwo kinds of path, **absolute directory** and **relative direcotry**.

1. **Absolute directory** goes with `/` always, for example, `/home/ditiss/python/demos/demo2.py`
2. **Relative directory** goes with respective to the **current working directory**, for example, `python/demos/demos2.py`

There are two kinds one is GUI and CLI, that user-interface is called **Shell** and the commands are given using CLI, command prompt to interact with operating system.

1. **CLI** <br>
Windows - cmd.exe, powershell.exe <br>
Linux - bsh, bash, esh, ksh, zsh

2. **GUI** <br>
Windows - explorer.exe <br>
Linux - GNOME (GNU Network Object Modal Env), KDE (Kimman Desktop Env)


# Shell

Mostly the `bash` shell is used by default, called **Born Again shell**. You can open the shell using the GUI application called Terminal that uses CLI on in the backend.

1. Use `echo $SHELL` to see the default shell your are using. Because the shell being used is `zsh` and it is stored in **bin**, which means it can be used by any user.
    ```
    bash-5.2$ echo $SHELL
    /bin/zsh
    ```
2. Use `ls` *path* to see the directory within the path specified.
    ```
    bash-5.2$ ls /
    Applications	Users		cores		home		sbin		var
    Library		Volumes		dev		opt		tmp
    System		bin		etc		private		usr
    ```
You can also check the the proc directory, see there is **cpuinfo** and **meminfo**, now you can see that there are memory 

3. You can check and change the date. Use `date` cmd along with options to change it.

```
❯ date
Thu Sep 26 12:20:45 IST 2024
```
Go an explore different types of the options and **FORMAT** you can use in the commands.

4. You can see the calender using `cal` cmd.

```
❯ cal
   September 2024     
Su Mo Tu We Th Fr Sa  
 1  2  3  4  5  6  7  
 8  9 10 11 12 13 14  
15 16 17 18 19 20 21  
22 23 24 25 26 27 28  
29 30                 
```

5. Use `pwd` to see the current working direcotry. 

```
```

6. Create multiple directories using `mkdir` *file1* *file2* *file3*.

7. Use `-p` as option for creating the directories in the hierarchy within the directories.
```
❯ mkdir -p create/dir/within/the/dir
❯ ls
create
❯ ls create/
dir
❯ ls create/dir/
within
❯ ls create/dir/within/
the
```

8. Use *Ctrl + L* in Windows and *Cmd + L* in the Mac for `clear`.

9. Use `-R` for seeing the content within the directory recursivley.
    ```
    ❯ ls -R
    create

    ./create:
    dir

    ./create/dir:
    within

    ./create/dir/within:
    the

    ./create/dir/within/the:
    dir

    ./create/dir/within/the/dir:
    ```

10. Create an empty file using the `touch` command.

11. Use `cat` commands to **show** the contents of the file and **create** a file with content. 
    ```
    cat > file.txt 
    ❯ cat file.txt
    Testing DITISS-LINUX
    Sunbeam Information
    ```
    Remember if you tried using the command on the pre-existing file, then in that case the file content will be overidden. If you need to append the content, you can use `cat >> file.txt` meaning that you can append the data.

12. Simply use `rm` to remove the file from the machine.

13. Use `cp` *src*  to create a copy of the file as well to copy the file to the *path destination*, if you want to copy the direcotry to the directory, use the 

14. Remember that using `mv` command you don't need `-R`

15. Use `rmdir` along with the `-r` followed by the file name, if the directory is not empty.


The below are the convention that are followed in the Linux.

| | |
|-----------|-------------------|
|Hard Disk  | sda, sdb, sdc, ...|
|Partitions  | sda1, sda2, sda3, ...|


