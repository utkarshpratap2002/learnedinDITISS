# What is /run ?

`/run` is a **temporary, volatile filesystem** in Linux, mounted as `tmpfs` (a virtual memory-based file system). It **stores runtime data** that is **only available while the system is running**. Once the system is rebooted, everything inside `/run` is **cleared**. It's mainly used to store Process IDs (like `/run/nginx.pid`), Sockets and temporary state information, and the NetworkManager’s DNS settings.

***Why Use `/run/NetworkManager/resolv.conf`?*** Because NetworkManager dynamically generates DNS configuration when NetworkManager manages the system’s network, it needs to keep DNS settings up-to-date, especially when switching between networks (e.g., Wi-Fi and Ethernet). These DNS settings are written to `/run/NetworkManager/resolv.conf`.

Next, the **default place for DNS configuration** on most Linux systems is `/etc/resolv.conf`. Since **NetworkManager dynamically updates DNS settings**, it creates the actual DNS configuration in `/run` and uses a **symbolic link** to point `/etc/resolv.conf` to `/run/NetworkManager/resolv.conf`. This ensures that **applications** querying `/etc/resolv.conf` get the latest DNS settings managed by NetworkManager.

```bash
sudo ln -s /run/NetworkManager/resolv.conf /etc/resolv.conf
```

Here, `ln -s` creates a symbolic (soft) link, **`/run/NetworkManager/resolv.conf`** is the **real DNS configuration file** managed by NetworkManager. Thus, **`/etc/resolv.conf`**, this is the standard location where programs look for DNS configuration.

This command makes sure that the DNS settings managed by NetworkManager are available system-wide through `/etc/resolv.conf`.

**Why Does This Matter?** Because of the **Dynamic DNS Handling**, if you connect to different networks (say, via VPN or SSH), **NetworkManager** dynamically updates DNS settings in `/run`. This link ensures that all programs on your system always **use the latest DNS configuration**, even when network conditions change.

When **Replacing systemd-resolved**, if you disable **`systemd-resolved`** (as we discussed earlier), linking `/etc/resolv.conf` to `/run/NetworkManager/resolv.conf` ensures that **dnsmasq** or other resolvers managed by NetworkManager are correctly used for DNS queries. Therefore, remember:

- **`/run`** is a **temporary filesystem** that stores **runtime data** for the current session.
- **NetworkManager** writes its DNS settings to `/run/NetworkManager/resolv.conf`.
- The symbolic link to `/etc/resolv.conf` ensures **applications always use the latest DNS configuration**, dynamically managed by NetworkManager.

This is an essential part of server administration, ensuring that your **network services and DNS queries remain reliable and up-to-date**, especially in dynamic environments.