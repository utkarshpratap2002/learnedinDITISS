# OpenVAS (kali Linux)

# SSH Password BruteForce & DOS Attack (Using MSF)

Cracking the passwords for the SSH login using the following the steps is quite easy. So you need to start the mfsconsole

```
mfsconsole
```

```
Use auxilary/scanner/ssh/ssh_login
```

Now you need to change few options, first check options using `show options`, now give USERNAME, RHOSTS (your target), and PASS_FILE. And then **exploit**. And hence *hacked*

# DOS Attack

The whole process is going to be same and then you need, use auxilary/dos/tcp/synflood. Now select the target and exploit. 

# File Password Cracking

Create a zip file with some content in it. 

```
7z a -p protected_password.zip original_file
```

Now you need to use the **fcrackzip** to crack the file password, so you need to create a password file and then you need to crack it.

```
fcrackzip -D -p another.txt protected_password.zip
```

After this command, it will return a password with which it got cracked.

# Wordlist using Crunch

Use the man page of the crunch to create the wordlist for your own. These wordlist are present in **/usr/share/wordlist**.

```
crunch 1 5 -o mywordlist1.txt
```

The first option after crunch means the minimum lenght and maximum lenght. You can also specify the character using the following command.

```
crunch 8 8 0123456789 -o mywordlist2.txt
```

# `recon-ng`: Recconaissance Framework

Recon-ng is a full-featured reconnaissance framework designed with the goal of providing a powerful environment to conduct open source web-based reconnaissance quickly and thoroughly.

Use the following command to see what modules and tools you've used before.

```bash
# To check past modules used
dashboard

# To check the commands
help

# Workspace management
workspaces list/delete/create/select
```

Creating and deleting and listing the workspaces is very easy and intuitive. You can create a workspace using the following command. 

```
workspaces create newone
```

lets talk a out thedatabses, we can create and manage the databases. Use the `db` command to manage the database settings, then there is options for modules.

```
modules load/reload/search
```

You can also take the snapshot of the current workspace and make changes accordingly.

```
snapshots take/list/delete
```

The command `marketplace` is to manage the required modules, meaning it is like the module manager in recon-ng.

```
# To install 
marketplace install <module-name>

#  To search
marketplace search whois
```

In order to install the module you need to install it by giving the full reference of the module, as showed below:

```
marketplace install recon/domains-contacts/whois_pocs
```

  