# Basic Commands

- **`ls`** is a command that will show all the directories and files within the file
  - **`-h`** means human readable format, listing all the dir and files with the unit associated with them
  <br>

    ```
    drwxr-xr-x   8 utkarshsingh  staff   256B Oct 17 08:07 cosa-docs`
    ```
  - **`-lR`** will list all the directories within the directory, meaning it list the directories and content *recursively*.
  - **`-li`** will show all list with the iNode number. 

- **`tree`** is a command that will show the hierarchy of the tree within the directory in a tree like structure.

- **`cp`** copies the file and copies it to the destination path.
  - **`-r`** is the option that allows the copy of dir recursivly, meaning contents within the file.

- **`mkdir`** is another file that will create the directory
  - **`-p`** is another option that will create the intermediate directories as required.

- **`cat`** used to create empty text file


# File System Globbing

The man page of the file can be found using `man 7 glob` and it is not to be confused with the grep. Lets what kind of characters or globbs we have.

1. There is **\*** and **?**, both means any character in between but **\*** means any character but the **?** means any character but one time only.

<br>

```
❯ touch roooat
❯ ls r*t
roast  roooat
❯ ls r?t
zsh: no matches found: r?t
```
2. Then there is quite a similarity in **[hg]** (Check for **h** or **g**) and **?**, both of them will check if there is only one character.

<br>

```
❯ ls [hg]ost
host
❯ ls [hg]*ost
ghost host
```

Now lets see if can get few examples for the above concepts:

- **`ls host*`** - it will list all the file starting with **host**. <br>

    ```
    ❯ touch host ghost roast toast frost
    ❯ ls *st
    frost ghost host  roast toast
    ```
- **touch file{1..10}`** will create file from file1 to file10. Now there can be different commands for the extraction of files and threfore we can use the following commands as given below. <br>

```
❯ touch file{1..10}
❯ ls file[0-10]
file1
❯ ls file[0-9]
file1 file2 file3 file4 file5 file6 file7 file8 file9
❯ ls file??
file10
❯ ls file?*
file1  file10 file2  file3  file4  file5  file6  file7  file8  file9
❯ ls file??
file10
```

# File Metadata

It contains the conventions for the statistics of the file.

- **`stat`** is the file that will include filename, size, block, inode, link count, permissions, file context, datas, owner uid, owner pid.

# Finding Files

There are multiple options for searching the file and can look for the following options:

- **ls** will list all the file in the current directory.

- **which** looks for the binaries in the $PATH, is used to list all the files to see the path of the file, it searches for the path in the environment variable, an environment variable is the file path that are running in the global scope of the system. For example, $PATH, $HOME, $SHELL are some of the environment variables. **printenv** prints all the environment variables.

- **locate** is another way to find a file which uses the database created with command **updatedb** which updates the systems index database.

- **find** is very useful to find a file in the following ways:
  - **find / -name passwd** searches for the file with name <br>

        ```
        root@localhost:~# find / -name passwd
        /sys/fs/selinux/class/passwd
        /sys/fs/selinux/class/passwd/perms/passwd
        /etc/passwd
        /etc/pam.d/passwd
        /usr/bin/passwd
        /usr/share/bash-completion/completions/passwd
        ```
  -  **find / -size +1G** searches for files more than 1G
  - **find / -user utkarsh** seaches for the files owned by the user utkarsh

Say you need to find the file of pattern, say **shadow** ...

# Understanding Symbolic and Hard Links

- One of major drawback of the symbolic links is that it will create a dangling link if you created symbolic link.

- When you create a Hard Link it will create a Hard Link

# Archive and Compression

- `scp` is called secure copy, copy the file from one location to another.

Archieving and compression both are different, archieving means that it is for combining the file to create one. Archieving is not combining the file and reducing the size of the file.

- `tar` is called tape archieving, there are few comman ways to doing it gzip, ...

Compression is the way of doing thi 

### Lossy 

Lossy is way of compression where some information isgetting lost.

### Lossless

Lossless is compression is when you archieve the files, meaning when you compress the file, the file is not getting reduced by data. No lost of data. 

As an example, practically if the byte file contain 10101110000111000111110010101, then all the contineous patterns of the file will be converted to something like this, 111 -> 00, 000 -> 01, and so on. This is placeholder data you carry.

# Understandig `tar`

The **tar** is the way to create the file 

```
touch file{1..100}
ls
tar -cvf my_file.tar file*
ls
rm -f file*
ls
```

# Compression Tools

Linux comes with different compression toolslike gzip, bzip, xzip compression and these kind compression is used as the gold standard, whenever the data us been send from server to your machine, it is sent using gzip.

```
gzip -k file.txt
```

# Users

Every user is expected to have a username and user id, a username has to be assigned by the one who is creating the user and user id will be created by the system. 

### Superuser

It is used for administration of the system, it is used as administrator, superusers name is root and superuser id will always be 0, this is called **root** user.

### System Users

These run behind the scene for example, when we use Apache, it is the program when it performs and app, it uses a user called apache, similarly, whenw e are using MySQL, it uses a user called mysql, generally they are assigned a non-priveledged accounts.

### Regular User

These are the normal, general, human users which is just an regular account.

# Password File

Column 5: GECOS Field which was used to store the user or employee information, when Linux was created back then, it was used fo 

Remember the passwords are not stored in the passowrd file, but tit is stored in the shadow file.

# Shadow File

The modern Linux, user's passowrd is stored in **shadow** file, this file stores the password in an encrypted format, the macOS uses the YES Algorithm and can be changes as well. 