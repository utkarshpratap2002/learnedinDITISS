# OpenSSH

To transfer files from your Fedora server to your local Mac machine through **SSH**, you can use **`scp` (secure copy)** or **`rsync`**. Below are a few methods with detailed steps.

## `scp` 

The **`scp` (secure copy)** command is a simple way to copy files between your remote Fedora server and your local machine, meaning it copies the files from the host on the network. The syntax for it is given below:

```bash
scp username@remote_ip:/path/to/remote/file /path/to/local/directory
```

Assuming you are on your Mac terminal and want to copy `filename.txt` from your Fedora server to your Mac. This works the same way as your copy command but it is using the authentication same as ssh and providing security like ssh. When you execute the command it will ask for password and will use authentication.

```bash
scp sindhya@172.16.164.128:~/Sindhya/filename.txt ~/Downloads/
```

Here, `sindhya@172.16.164.128` which is the username and IP address of the Fedora server, then there is a file named *filename.txt* that has path `~/Sindhya/filename.txt` on the Fedora server and `~/Downloads/` is the path on the local Mac machine where the file will be saved.


If you wish to transfer the directory you need to use options **-r**, thus, rest will be same, here it means that directory will be copied recursively.

```bash
scp -r sindhya@172.16.164.128:~/Sindhya ~/Downloads/
```

Remember this happens both the way, either you can use the local server, which in our case it **utkarshsingh**, and the server is **sindhya**. Both of the machine can copy the files from one server to local server. All the above commands as executed on local machine but you can do `scp ~/Sindhya/folder/file.txt utkarshsingh@192.168.1.8:~/Documents/folder/` to copy the files from server to the local machine. 


## `rsync`

The `rsync` command is faster and more efficient than `scp`, especially for large files or directories. It also allows resuming transfers in case of interruptions.

```bash
rsync -avz username@remote_ip:/path/to/remote/file /path/to/local/directory
```

To understand this lets understand what **-avz** stands for, thus, `-a` is reponsible for archive mode (preserves permissions, symbolic links, etc.), then `-v` is Verbose mode (shows the progress), and lastly there is `-z` which compress files during transfer for speed.

<br>

```bash
rsync -avz sindhya@172.16.164.128:~/Sindhya/filename.txt ~/Downloads/
```

## Reverse `scp` 

This is Initiating Transfer from the Remote Server, it is similar to **scp** but instead from the local machine, we are trying to trasfer the file using the server. If you are logged into the Fedora server via SSH, you can run `scp` to **push** the file to your Mac.

Think you are logged on to your fedora server via ssh, and on the server you have file *filename.txt* and you need to send it to the local machine, so will do the following to transfer it to local machine.

<br>

```bash
scp ~/Sindhya/filename.txt your_mac_username@your_mac_ip:/path/to/local/directory
```

You may need to enable **remote login (SSH)** on your local machine, so that you can do the sharing using ssh and you also need to check for the IP address on your Mac, you can check your IP address with:
```bash
ifconfig | grep inet
```

Look for the **IPv4 address** (e.g., `192.168.1.10`).

## `sftp`

You can also use **`sftp` (Secure FTP)**, which is similar to SSH but provides a file transfer interface. This will give you the file interface of the server and then you use **get** to download the file to your local machine.

Basically, first **Connect** to the Remote Server. <br>

```bash
sftp sindhya@172.16.164.128
```

Then, **Navigate** and Download Files.
```bash
cd Sindhya
get filename.txt ~/Downloads/
```

Then you can **Exit**.
```bash
exit
```

<br>

Thus, we can say that **scp** is a simple and effective for copying files. 
```bash
scp sindhya@172.16.164.128:~/Sindhya/filename.txt ~/Downloads/
```

And, **rsync** is used for faster transfers, especially with large directories.
```bash
rsync -avz sindhya@172.16.164.128:~/Sindhya/ ~/Downloads/
```

Also, Reverse **scp** initiate transfer from the server to your Mac/local machine.
```bash
scp ~/Sindhya/filename.txt your_mac_username@your_mac_ip:~/Downloads/
```

Lastly, **sftp** is used for interactive file browsing and downloads over SSH.
```bash
sftp sindhya@172.16.164.128
```

<br>

# Troubleshooting

Sometimes it might occur that you've modified your .bashrc file because of which there can't be a proper transfer between the networks, this occurs because sftp only allows the transfer of protocol, hence if any additional messages such as echo messages or any welcome messages are found in between you might get the below output while doing sftp or scp. 

``` 
Received message too long 1416128883
Ensure the remote shell produces no output for non-interactive sessions.
```

This typically happens because there are additional messages in you .bashrc file. You need to open the .bashrc file on the server and you need to remove all those additional commands that produces unnecessay outputs.

Choose the method that best fits your needs. **scp** is usually the simplest, while **rsync** offers more control and speed for larger data transfers.