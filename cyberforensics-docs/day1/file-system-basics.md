# File System Basics

FAT file system supports a maximum volume soze of 32GB. 


# EXT3 File System

It was build on the jounaling file system, initially the file created are given up to the RAM, later, when time alloted to CPU, OS will send these files to the hard disk, this is a problem, as if system unexpectedly shuts down, the updates and records will be gone. 

# General Concepts

- All users history can be find inside the ~/.bash_history.

Refer to [Linux File System](../../cosa-docs/linux/concepts/linux-file-system.md) to learn more about files and directories in linux, and what they contain. In order to mitigate few problems where you might need to investigate with some logs, say user investigation, files access/modification, process information, or network information, hardware devices or other such information.

Let's illustrate how to retrieve the 30 pieces of information listed previously, along with example scenarios for each:

# User Information

1. **UID/GID:** `id username` (Scenario: Verify user's privileges)

2. **Home Directory:** `echo ~username` or `getent passwd username | cut -d: -f6` (Scenario: Locate user's personal files)

3. **Shell:** `getent passwd username | cut -d: -f7` (Scenario: Troubleshoot login issues)

4. **Creation Date:**  No direct command; often requires checking system logs or user management databases. (Scenario: Audit user accounts)

5. **Last Login:** `last username` (Scenario: Investigate unauthorized access)

6. **Last Logout:** `last username` (Combined with login time)

7. **Login Status:** `who` or `w` (Scenario: See who's currently using the system)

8. **SSH Keys:**  `ls -l ~username/.ssh/` (Scenario: Manage user access credentials)

9. **Authorized SSH Keys:** `cat ~username/.ssh/authorized_keys` (Scenario: Review allowed SSH connections)

10. **User's Groups:** `groups username` (Scenario: Determine file access permissions)

# File Access/Modification

11. **Files Accessed:** `auditctl` (for auditing) combined with `ausearch` (Scenario: Track file access for compliance)

12. **Files Modified:**  `find / -user username -type f -mtime -7` (finds files modified in the last 7 days) (Scenario: Identify recent changes made by a user)

13. **File Permissions:** `ls -l filename` (Scenario: Diagnose access problems)

14. **File Ownership:** `ls -l filename` (Scenario: Determine who controls a file)

15. **Hidden Files:** `ls -la ~username` (Scenario: Find hidden configuration files)

16. **Recently Accessed Files:**  `find / -user username -type f -atime -7` (finds files accessed in the last 7 days) (Scenario: Analyze user activity)

# Process Information

17. **Running Processes:** `ps -u username` (Scenario: Monitor user activity)

18. **Started Processes (Recent):**  `journalctl _UID=$(id -u username) -S` (using systemd journal) (Scenario: See what commands a user recently ran)

19. **Command History:**  `.bash_history` in the user's home directory (Scenario: Reconstruct user actions)

20. **Resource Usage:** `top -u username` (Scenario: Identify resource-intensive processes)

# Network Information

21. **User's IP Address:** `who -u | grep username` (if currently logged in) or examine logs (Scenario: Track down the source of network activity)

22. **Network Connections:** `ss -u | grep username` (Scenario: Identify open connections by the user)

23. **Open Ports:** `netstat -tulnp` or `ss -tulnp` (Scenario: Security audit)

24. **Network Traffic (by User):**  Requires `tcpdump` or `Wireshark` combined with filtering by user's IP (Scenario: Investigate suspicious network activity)

# Hardware/Devices

25. **Connected Devices:** `lsusb`, `lspci` (Scenario: Identify attached hardware)

26. **Loaded Drivers:** `lsmod` (Scenario: Troubleshoot hardware issues)

27. **System Uptime/Downtime:** `uptime`, `/var/log/boot.log` (Scenario: System administration)

# Application/Software

28. **User-Installed Applications:**  Depends on how applications are installed.  Check user's home directory or package manager logs. (Scenario: Software inventory)

29. **Installed Packages:** `dpkg -l` (Debian/Ubuntu), `rpm -qa` (Red Hat/CentOS/Fedora) (Scenario: System administration)

30. **Running Services:** `systemctl list-units` (systemd) (Scenario: System administration)

These are practical examples, and you might need to adapt commands or combine techniques depending on the specific scenario and the Linux distribution.  Remember to use `sudo` where necessary for commands requiring root privileges. Using `man command` (e.g. `man find`) can offer invaluable information about a command's usage and options.  Developing proficiency with these commands and understanding where to find system information is essential for Linux administration, security, and forensics.

In [Linux File System](../../cosa-docs/linux/concepts/linux-file-system.md), the directories are responsible for providing the data regarding events, if it is about the regular user infromation, where you need to find out the files modified by the specific user, that kind of information is saved in **`/home`**. 

```bash
find /home -user username -type f -mtime -7
```

Refer to [Principles of Cyber Forensics](day1.md#principles-of-cyber-forensics) and [File System Basics](file-system-basics.md)  in order to understand the various systems and procedures that are followed using the commands and linux file system to identify the problem while investigation. 





