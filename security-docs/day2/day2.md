# Installation of Kali

- First what you need to do is that you are not suppose to trust anything that you are downloading from internet, and when you are working for yourself, you need to check the ISO file with the actual one, becuase most of the time you are getting the file from anyone, you first need to check.

- You need to check the **Hash Value** of the iso file. 

### How to do this in Mac?

You can check the SHA256sum using the command `sha256sum` command in mac or linux, run the following command to see the SHA256sum and check the SHA256sum with the official one.

```
❯ sha256sum kali-linux-2024.3-installer-arm64.iso
f1d59e1467f801ad9760d610db8d3f34256427fd720db68f6b2db7552f5edd6f  kali-linux-2024.3-installer-arm64.iso
```

This is how you can check that.

### *Can you download the Kali Linux Docker?*

*Perhaps you can*, all you need to do is either you go and check the ocumentation for the kali.org, there you will find the Docker container installation for kali llinux or you can just write the follwoing command.

```
docker pull kalilinux/kali-rolling
```
The above command will run the docker container installation and you can either choose to install the packages later into the docker container (kali linux) or you have the facility to install the **metadata* of the kali linux. The Metadata of Kali Linux is quite large so you need to good internet connection and *time*.

```
apt update && apt -y install kali-linux-headless
```

You can run this command to install the packages you desire.

```
apt get install <package>
```


Lets come back where we were, as we need to install the keep the snapshots of the Virtual Machine, and we are required to inspect the fact what are the different kind of Network Adapater.

---

1. **Internal Adapter**

    | | Virtual Machine 1 | Virtual Machine 2 |
    |----------------------|-------------------|-------------------|
    | Base Machine | VM1  | VM2 |
    | MacOS  | Deb01  | Deb02  |
    | 192.168.0.127  | 172.16.0.3  | 172.16.0.4  |
    | Connot connect VM1 VM2| Can ping VM2 but not base machine | Can ping VM1 but not base |

    In this case of Internal Network the Base Machine won't be able to communicate with the Virtual Machines as that can be confusing becuase there is no internet.

2. **Host-Only Adapter**

    | | Virtual Machine 1 | Virtual Machine 2 |
    |----------------------|-------------------|-------------------|
    | Base Machine | VM1  | VM2 |
    | MacOS  | Deb01  | Deb02  |
    | 192.168.0.127  | 172.16.0.3  | 172.16.0.4  |
    | Can connect VM1, VM2 | Can ping VM2 and Base but no internet | Can ping VM1 and Base but no internet |

    It is only to communicate with the Base Machine only, therefore you need to use only if you need to connect with base machine and no internet is tobe given to the Virtual Machine.

3. **Bridge Adapter**

    | | Virtual Machine 1 | Virtual Machine 2 |
    |----------------------|-------------------|-------------------|
    | Base Machine | VM1  | VM2 |
    | MacOS  | Deb01  | Deb02  |
    | 192.168.0.127  | 192.168.0.3  | 192.168.0.4  |
    | Can connect anyone | Can connect with anyone | Can connect with anyone |

    This will look like as if there are seperate machine on the server, as if there are two more machines on the local machine.

4. 
---

So what you need to do is that you need to start an Apache server on your kali linux, and make sure that you have a bridge network established over the network. Now you need to setup the server such that you need to host your server in such a way that you can fool someone with the fake one. 

Establishing a fake server that will provide the redirection 


# Phishing Attack - Zphisher

You need to log into the original page, or perphaps you need an actual link, that looks authentic, meaning it should be having a geniune link.

- For that you need to use the social engineering tool that you can get from the git **zphisher**.

- Then you need to start with executing the zphisher script using `bash zphisher.sh`, then select appropiate options to clone the website such as *Instagram*, or *LinkedIn* or whatever.

- Once done with the attack, you can go to `/auth/username.dat` which will contain the infomation for the users data.

# Social Engineering Toolkit

You missed several steps and explanations within your notes on the Social Engineering Toolkit (SET). Here's a more complete breakdown:

**Installation:**

* You mentioned installing SET, but *how*?  Specify the commands.  Typically, this involves cloning the SET repository from GitHub and running the setup script.  The commands would look something like this:
```bash
git clone https://github.com/trustedsec/social-engineer-toolkit/ set
cd set
./setup.py install
```

# Meterpreter Reverse TCP

Basically we need a windows machine that will revert the session to the meterpreter after we create a payload and insert it inside the windows machine. All you need to do is, create a **payload** using the social engineering toolkit and somehow get it passed to the window machine. The below are the steps:

- Open **SET**, and select option **1** to *Create Payload and Listener*

<div style="border-left: 4px solid #007acc; background-color: #f1f6f9; padding: 10px; border-radius: 5px;">
<strong>Note: </strong> Remember that this practical lab is using Windows 7 Machine for the exploitation.
</div>
<br> 

- Then select the Machine for which you need to generate Reverse TCP, which is *Windows Meterpreter Reverse TCP x64*, **5**

- Then *Enter* the Local IP address (LHOST), and LPORT, remember enter the IP address on which you need to listen to the reverse tcp.

- After **Enter** the payload will be generated, it will be saved to **/root/.set/payload** and you'll be able to find the payload on server running on the IP address.

- Now SET will provide a option to listen to the windows server ***now***, you just need to say *yes* and it will open meterpreter (multi/handler) for you, now this is will wait for any connection or incomming that are out there for our **payload**. 
 
- Now you need to get this payload to the windows machine, so in order to do that we need to set the up the server using **python**. Remember to do it in the same directory you are having the payload.

```python
python -m SimpleHTTPServer 80
```

- Then you need to go to windows machine and look for the local network on which actually *you will try phishing strategies* to trick the user to move to that website, and then once the payload a downloaded, the website will be hacked.

- You need to move to the meterpreter and start the session using the following command.

```
session -i 1
```

And then you can try looking for information around within the windows system, the *windows is yours*.
                