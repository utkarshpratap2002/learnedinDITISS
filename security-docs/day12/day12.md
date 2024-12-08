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


  