# `dnf`

It is the packet manager in Fedora called as **Dandified YUM**, thus replacing the older tool `yum`. It manages all the packages of the fedora and help and **`dnf`** is the **package manager** for Fedora, responsible for managing software packages on your system. As a **server administrator**, mastering `dnf` is essential because it helps you install, update, and manage software efficiently across your servers. Let’s dive into the details. 

So, *What is dnf?* `dnf` (short for **Dandified YUM**) is the default package manager in Fedora, replacing the older YUM tool. It allows you to install, update, remove, and manage software packages from **Fedora repositories** and other third-party sources.


*And How `dnf` Works*, When you run `dnf` commands, it communicates with **repositories** (collections of packages) to download and install the necessary software and dependencies.

*Why `dnf` is important for Server Administration*, it is super important for the server management and becuase in order to run different application you would require **dnf** to install different dependencies and therefore it helps in:

1. **Automated Software Management**: Easily install or update software without downloading source code manually.
2. **Dependency Resolution**: `dnf` automatically resolves dependencies (other packages required for the software to work).
3. **Secure and Verified Software**: Packages are verified using **GPG keys** to ensure integrity and security.
4. **Scalability and Automation**: Using `dnf` commands in **scripts** enables you to automate deployments on multiple servers.


## **Basic `dnf` Commands for Server Administration**

You can **Updating the System**, as a best practice, always keep your server up to date. <br>

```bash
sudo dnf update -y
```

This command updates all installed packages on the system. The `-y` option automatically confirms the updates, useful in automation scripts.


It helps in **Installing a Package**, For example, Install the **Apache web server**. <br>

```bash
sudo dnf install httpd -y
```
Thus, `dnf` installs the Apache web server along with any required dependencies.


Basically when **Removing a Package**, say you want to remove the Apache web server. <br>

```bash
sudo dnf remove httpd -y
```


You can also **Search for Packages**, sometimes, you need to find a package name or version. <br>

```bash
sudo dnf search nginx
```


You can also **List Installed Packages**, check what software is currently installed on the server. <br>

```bash
sudo dnf list installed
```


When you require to **Enable or Disable Repositories**, if you need software from non-default sources (like EPEL or custom repositories). <br>

```bash
sudo dnf config-manager --add-repo <repo_url>
```
You can also enable or disable repositories for specific operations:
```bash
sudo dnf install <package> --enablerepo=epel
```


If you want to **Clear Cache**, this command clears cached metadata and package files to save space.
```bash
sudo dnf clean all
```


It can also **List Package Info**, you can view detailed information about a package. <br>

```bash
sudo dnf info httpd
```

Lets see how the real world works with *dnf**, it is not just a package manager but a lot more than that, it will help you automate servers, in patch management, software repo management, and version control, lets see what we mean by this.

**Automated Server Setup**, You can write shell scripts with `dnf` commands to install a web server, database, and other tools automatically.
```bash
# Setup script
sudo dnf update -y
sudo dnf install nginx mariadb-server -y
sudo systemctl enable nginx mariadb
```

**Patch Management**, Regularly use `dnf update` to keep your system secure with the latest patches and updates, preventing vulnerabilities.

**Software Repositories Management**, For advanced setups, you might manage additional repositories (like **EPEL** or **Remi**) to install non-standard software packages.

**Version Control**, If your environment needs **specific versions** of a package (for compatibility reasons), you can lock packages at certain versions using `dnf versionlock`.


**dnf** is more than just a tool to install software, its a core utility for managing and maintaining servers. As a server administrator, you’ll rely heavily on it to **Deploy services** (like Apache, Nginx, databases), **Apply security patches and updates**, **Manage dependencies and repositories**. Mastering `dnf` helps you **automate tasks, maintain security, and manage software** across your Fedora systems efficiently.