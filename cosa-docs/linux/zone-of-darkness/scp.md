# OpenSSH

To transfer files from your Fedora server to your local Mac machine through **SSH**, you can use **`scp` (secure copy)** or **`rsync`**. Below are a few methods with detailed steps.

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


## **Method 2: Using `rsync` for Faster File Transfer**

The **`rsync`** command is faster and more efficient than `scp`, especially for **large files or directories**. It also allows **resuming transfers** in case of interruptions.

### **Syntax**:
```bash
rsync -avz username@remote_ip:/path/to/remote/file /path/to/local/directory
```

### **Example**:
```bash
rsync -avz sindhya@172.16.164.128:~/Sindhya/filename.txt ~/Downloads/
```

- **Explanation**:
  - `-a`: Archive mode (preserves permissions, symbolic links, etc.).
  - `-v`: Verbose mode (shows the progress).
  - `-z`: Compress files during transfer for speed.

---

## **Method 3: Reverse `scp` (Initiating Transfer from the Remote Server)**

If you are **logged into the Fedora server** via SSH, you can run `scp` to **push the file to your Mac**.

1. **On Your Fedora Server (logged in via SSH)**:
   ```bash
   scp ~/Sindhya/filename.txt your_mac_username@your_mac_ip:/path/to/local/directory
   ```

2. **Example**:
   ```bash
   scp ~/Sindhya/filename.txt sindhya@192.168.1.10:~/Downloads/
   ```

- **Note**: 
  - You may need to **enable remote login (SSH)** on your Mac via **System Preferences** → **Sharing** → **Remote Login**.

---

## **Checking Your IP Address on Mac (for Reverse `scp`)**

On your Mac, you can check your IP address with:
```bash
ifconfig | grep inet
```

Look for the **IPv4 address** (e.g., `192.168.1.10`).

---

## **Method 4: Using `sftp` for File Transfer**

You can also use **`sftp` (Secure FTP)**, which is similar to SSH but provides a **file transfer interface**.

1. **Connect to the Remote Server**:
   ```bash
   sftp sindhya@172.16.164.128
   ```

2. **Navigate and Download Files**:
   ```bash
   cd Sindhya
   get filename.txt ~/Downloads/
   ```

3. **Exit**:
   ```bash
   exit
   ```

---

## **Summary**

- **`scp`**: Simple and effective for copying files.
  ```bash
  scp sindhya@172.16.164.128:~/Sindhya/filename.txt ~/Downloads/
  ```

- **`rsync`**: Use for faster transfers, especially with large directories.
  ```bash
  rsync -avz sindhya@172.16.164.128:~/Sindhya/ ~/Downloads/
  ```

- **Reverse `scp`**: Initiate transfer from the server to your Mac.
  ```bash
  scp ~/Sindhya/filename.txt your_mac_username@your_mac_ip:~/Downloads/
  ```

- **`sftp`**: Use for interactive file browsing and downloads over SSH.

Choose the method that best fits your needs. **scp** is usually the simplest, while **rsync** offers more control and speed for larger data transfers.