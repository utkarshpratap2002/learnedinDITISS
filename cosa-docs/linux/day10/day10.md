# User and User Management

Check if the user exists, there are multiple ways for it.

1. using **id**
    ```
    root@localhost:/home/reva# id reva
    uid=1000(reva) gid=1000(reva) groups=1000(reva)
    root@localhost:/home/reva# id sindhya
    id: ‘sindhya’: no such user
    ```

2. Using the **/etc/passwd**

### Useradd

Now you can use the follwoing command to create the user. <br>

```
root@localhost:/home/reva# useradd --comment "Sindhya - Developer" sindhya
```

Now you can check whether the user got created or not, use the **/etc/passwd** to check if you have that user. <br>

```
sindhya:x:1022:1022:Sindhya - Developer:/home/sindhya:/bin/bash
```

Thus, there are different ways of creating user, such as, use **-g** to set the primary [group](#group) to the user, then use **-G** to set the secondary group to the user, you can also use **-d** to set different home directory of the user.

### Password

Now you need to be able to change the password and there are two ways.

- **passwd** changes the password of the root, meaning the current user. So do it if you want to change the passwd for the root or the current user.

- **passwd username** changes the passwd of the user that you are refering to.

Thus, **passwd** can use used with different options, some of them are:

- **-d** will delete the password of the user.
- **-e** will expire the user account.
- **-l** will lock the user account.
- **-u** will unlock ther user account.



### Sudoers 

If you want the user to be the part of administrative group such it can perform the system admin commands, then you need to add the user to the sudoer list. Adding user to sudoer will give the user super user priveledges temporarily. <br>

```
visudo
```

Then, you need to go to the file and mention your users name below the root, so that the system can recognise the user as sudoers. Thus, you can execute the commands that are executbale only on **root user** using **sudo** before the command, **sudo** means *switching the user and do ..*, then you use the below to change the user.

```
su - root
```


### Userdel

If you need to delete the user you can use the **userdel** to delete the user, however there are two options with it. If no options are used by default the user will be deleted but the backup of the user will remain on the home directory. <br>

```
userdel username
```

If you want to delete the user even from the home directory, you can use the **-r** options.

```
userdel -r username
```
To delete the user from the home directory: <br>
```
userdel -r username
```

Thus, if the user isn't deleted from the home directory, because it is a directory you can delete it using **rm** along with **-r** to delete the user from home directory.

```
sindhya@localhost:~$ sudo userdel reva
userdel: user reva is currently used by process 1577

# Kill the session of the user
kill -9 1577
```

Mostly the above scenario would happen if you are not logged out or the seesion with the user is still active so in that case you either need to logout of the session or you need to kill the process of the session of user running. 

### `#` and `$`

<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>Note:</strong> A <strong>#</strong> identifies as the super user and <strong>$</strong> means the regular user. When you create a session, you can look at the prompt and notice as who you are, is it a super user or a regular user because this help in knowing which kind of commands you can run within the terminal. 
</div>
<br> 

- **cd ~** is used to get to the home directory of the user, more specifically **current logged in** user, where **~** is called **tilda**.
- **cd -** is used to go the last visited directory, remember is is not a recursive command which will keep on returning to the previous directory.

The **alias** is another name convention that can be used for running the file. <br>

```
mrdhvi@localhost:~$ alias lo="exit"
```
And remember aliases are temporary, thus the alias are used within the same sesssion until and unless you define them in global environment variables.  

# System and User Profiles

There are certain variables that are needed to be created in the environment specific domains such that when user logs in, they already have the required environment set and pre-configured for the development.

### `/etc/profile`

The **`/etc/profile`** file stores the system-wide configuration that are avaialable globally, these environment variables are to be configured in order to make the user avialable all theconfiguration that he might need, these can be configured by moving to **/etc/profile** then creating the entry using:

```
export $PATH=/opt/bin
```

Such that when the user will login the packages for the user will be available. 

### `/etc/bashrc`

The **`/etc/bashrc`** stores all the configuration that will store configuration that are specifc to the shell







### User Settings Defaults

These are user files that will have all the files that will store the default configuration.

### `/etc/skel`

This is the file that will 

# Managing Passwords

### /etc/security/pwquality.conf

# Group

It is created from the securtiy perspective and therefore when it comes to assigning a set fo pemissions to the set of users, giving certain resrouces to the set of users, we need to work with Groups.

Every user when it is created is given a group, called primary group, and a user has to be a part of on primary group. Other than a primary group, a user can have a supplement group, it can be part of more than one group, 

# Group Management


# Managing Permission


