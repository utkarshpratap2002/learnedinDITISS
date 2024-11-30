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
    | 192.168.0.127  | 172.16.0.3  | 172.1