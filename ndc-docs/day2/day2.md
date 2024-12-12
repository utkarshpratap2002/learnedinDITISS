# `tcpdump` Is The First IDPS

Lets get into the basics, when any packet is comming and filtering them and inspecting them and all, that is called Intrusion Detection and Preventaion System. Now the policies in the organisation decides what is intrusion and that is decides by organisation. 

We use **Snort** and lets get into this. We'll be installing Snort.

- Look for tthe C drive and initialiiy there won't be any Snort Application.

- **Snort Setup** requires WinPcap, so need to install WinPcap.

- **Adding exception**, so first decide a folder where you are going to install that file, so go to **Virus thread protection**, you'll find **Exlusion**, **Add an Exclusion**, and then add an folder to it. 

- If you want to check whether it got installed, you can go to **Add and Remove ..** and will find it.

- Snort can run in different modes, snort can be run in packet capture mode to test whether snort is working or not. After that we might to into the IDS. 

- So open CLI in Windows and run it as Administrator. 

- Multiple directories can be found, suh as preproc_rules, docs, bin, rules and all. So you need to go to the location **\Snort\bin**.

- Now we will be using the same concept as tcpdum and threfore we nee dto first check the interfaces supported by it or not. Run the command.

    ```
    snort -W
    ```

- Now you won't find the same output that you'll get the inside the **Control Panel**. Therefore, you need to mechanism to fund out and therefore, you need to run the command.

    ```
    getmac /fo csv /v
    ```
- The above command will give you the right format for the identification of the ethernet port.

- Now you need to run the command to start the snort with the ethernet.

    ```
    snort -i 3
    ```
- For mode details, you can put options like `-d` (application layer data), `-e` (link layer data), and for verbose `-v`.

    ```
    snort -i 3 -dev
    ```

Snort is like an engine that will only do something when you provide it rules for which it will start performing and reacting based on those rules that will define how it is suppose to perform. Basically it is the concept of **rules** and **signature**

- Write your own rules or you can use the developers file for the file.
  - First Unzip the file and then extract it to the **Snort** folder by unchecking the block below the path, and override without prompt.
  - Now you need to Snort in IDS mode.

Note* One of the dangereous file is browser-ie.rules, which OS tries to delete it again and again.

Now you need start the command using the following sequence. 

```
# Specify the following
snort
interface
config
log
output
```

Now run the command inside the snort. Now you need to understand

```
snort -i 3 -c c:\Snort\etc\snort.conf -l c:\Snort\log -A console
```

Run the following command in order to test the snort.

```
snort -i 3 -c c:\Snort\etc\snort.conf -l c:\Snort\log -T
```

# Troubleshooting the Errors

Now when you'll run the last command, you might get the error, lets discuss these errors and this is how do we understad the outputs and problmes.

### `ipvar`

The First error that we'll get is the ERROR: `ipvar`, which specifies that there is different version of IP running, we need IPv4, but IPv6 is running. In order to trouble shoot, you need to find the ipvar and replace it var. 


If you try finding `ipvar` and it is important that there should be 11 occurences for the same string. Once you make changes to the file, always save the configuration file after every change. Always verify the errors and always pay attention on this one.

### snort_dynamicpreprocessor

This is path to dynamic preprocessor libraries which is having the linux path and this shouldn't be, so what we'll do is we'll change the files names with the one below:

```bash
# Go to snort.conf and change the path
dynamcipreprocessor/
```
```
Basically the file with the path C:\Snort\lib\snort_dynamicpreprocessor\filename.llb
```

### snort_dynamicrules

This is the folder that is allowing you to change the rules file that is associated eith it. 

Now Comment out the first five lines from the snort.conf file. 

# Change

```
var RULE_PATH ../rules
var SO RULE_PATH ../so_rules
var PREPROC_RULE_PATH ../preproc_rules
```

# to

```
var RULE_PATH C:\snort\rules
var SO RULE_PATH C:s\snort\so_rules
var PREPROC_RULE_PATH C:\snortpreproc_rules
```

# Change to WHITE_LIST_PATH
```
var WHITE_LIST_PATH ../rules
var BLACK_LIST_PATH ../rules
```

# To WHITE_LIST_PATH
```
var WHITE_LIST_PATH ../rules
var BLACK_LIST_PATH ../rules
```

# Change whitelist

```
whitelist $WHITE_LIST_PATH/while_list_path
```

# To whitelist


include 

# Create new text user

Make sure you are managing i they that you get all the onfguatio changes., it will tell that thre isone file misssin. 

Now you need to create new txt documentation order to make few changes tnd therfore **the final goal is let that snort cliet let in*.

# Writing Snort Rules

Lets start with an empty file, the first keyword that we need is the following.

```bash
# alert protocol src-ip src-port direction dst-ip dst-port (msg: "IP address")
alert ip any any -> any any (msg: "IP Packet Detected"; sid: 100001;)
```

- These rules files are to be saved inside teh rules file, with the extension *.rules*.

Now go to the nsort.conf file and include the file

```
include $RULE_PATH/anyname.rules
```

<br>

# What Actually we are doing?

The `.md` file you've provided documents the process of installing and configuring Snort, an intrusion detection system, on Windows, along with setting up a Debian virtual machine.  The "Troubleshooting the Errors" sections describe common problems encountered during this process and how to fix them. Let's break down the specific issues mentioned:

**Snort on Windows Troubleshooting:**

* **`ipvar` Error:** Snort uses a variable called `ipvar` to determine the IP version (IPv4 or IPv6).  The error occurs when Snort expects IPv4 but encounters IPv6.  The solution is to find all occurrences of `ipvar` in the Snort configuration file (`snort.conf`) and replace them with `var`.  This ensures Snort uses the correct IP version.

* **`snort_dynamicpreprocessor` Error:** This error arises from incorrect paths to dynamic preprocessor libraries.  Snort expects these libraries in a specific location.  The solution is to correct the paths in the `snort.conf` file to point to the actual location of the `snort_dynamicpreprocessor` directory, which contains the necessary `.dll` files.  The correct path should be `C:\Snort\lib\snort_dynamicpreprocessor\` (assuming Snort is installed in `C:\Snort`).

* **`snort_dynamicrules` Error:**  Similar to the previous error, this indicates an issue with the paths to dynamic rules. Snort needs access to the directory where custom rules are stored. The solution is to update the `snort.conf` file to point to the correct directory for dynamic rules.

* **Incorrect Rule Paths:** The configuration file uses variables like `RULE_PATH`, `SO_RULE_PATH`, and `PREPROC_RULE_PATH` to specify the locations of Snort rule files.  The initial configuration might contain relative paths (e.g., `../rules`), which can be problematic. The solution is to change these to absolute paths (e.g., `C:\Snort\rules`), ensuring Snort can find the rule files.

* **Whitelist and Blacklist Paths:**  Similar to the rule paths, the paths for whitelists and blacklists (used to allow or block specific traffic) also need to be corrected to absolute paths.

* **Missing Files:** After making configuration changes, Snort might report missing files. This usually means there's a typo in the path or the file doesn't exist. Double-check the paths and file names in the `snort.conf` file.

<br>


# Debian Installation

Lets start with the installation of Debian machine, for that install theh stack machine of Debian 12 and then start with the [Configuration Entry for the `apt`](../day1/day1.md#configuration-entry-of-debian-based-linux) in order to create the configuration entry.

Then, you need to install the packages such as vim, ssh, and other utilities to make the debian server working. Make sure that when you are installing a stack debian, you need to make the static configuration for the network interfaces and therefore you need to make configurations for that inside `/etc/network/interfaces`.
