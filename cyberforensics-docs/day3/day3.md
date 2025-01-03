# First Responder Procedure

- It is not about the crime, but in general, meaning if the server got hacked, the one is responsible for taking the immediate action, refer to [consider shutting down the system](../day1/considering-shutting-down.md), thus, it is important that the one us ready to take immeadiate action. 

- Physical evidences are important as they are needed to seperated, and wait for the forensics team. 

# Can you find the what was going on Virtual Machine

# Can you find out if something suspicious was running inside the Docker Container

Docker image are not downloaded as a single layer, therefore you can't just copy the file in a single file, there is layered type images, so what can you do to know or how would you perfrom the forensics. 

- **`bash_history`**. For sure, there will be user history inside the `~/.bash_history` where you might see the container command that were running. 

- **Dockerfile**. If Docker container is created, then Dockerfile will can be traced, meaning the traces for the Docker image will be found. Without Dockerfile one can't create a Docker image. 

- **Docker Images and Layers**. Docker images are built in layers, and each layer represents a change to the image. Examining these layers can reveal the software installed, configurations made, and files added by the unauthorized user.  The `docker history` command shows the layers of an image.

- **Container Logs**. Docker containers generate logs that can provide insights into the commands executed, applications run, and network activity within the container. The `docker logs` command retrieves container logs.

- **Docker Storage Drivers**. Docker uses storage drivers to manage container data. Analyzing the storage driver's data can reveal file system changes, deleted files, and other persistent data related to the unauthorized application.

- **Network Traffic**. Even within a container, network traffic can leave traces on the host system.  Capturing and analyzing network traffic associated with the container's IP address can reveal communication with external servers or other suspicious activity. Tools like `tcpdump` and `Wireshark` are useful for network analysis.


# Working on Live Systems and Dead Systems

A security administrator suspects an ongoing intrusion on a critical server. The server is hosting sensitive financial data, and the administrator needs to determine if data exfiltration is occurring and identify the attacker's methods.

### Arguments for Live Analysis in this scenario

* **Volatile Data Capture**.  Live analysis allows capturing volatile data from RAM, including running processes, network connections, open files, and encryption keys. This information is crucial for understanding the attacker's current activity and potentially interrupting an ongoing attack.  Tools like `Volatility` can be used to analyze memory dumps.  The `/proc` filesystem in Linux provides real-time information about processes and system resources.  Network traffic can be captured using `tcpdump` or `Wireshark`.

* **Process Identification**. Examining running processes can reveal malware or suspicious programs currently active on the system.  Commands like `ps aux` and `top` provide detailed process information.

* **Network Connection Monitoring**.  Live analysis allows real-time monitoring of network connections, which can reveal ongoing data exfiltration or communication with command-and-control servers.  `netstat` or `ss` can display active network connections.

* **Preserving Evidence of Ongoing Attack**. Live analysis can capture evidence of an active intrusion that might be lost if the system is shut down.

### Arguments against Live Analysis

* **System Modification**.  Any interaction with a live system, even by a skilled investigator, can potentially alter data.  This raises concerns about evidence integrity.

* **Complexity and Risk:**  Live analysis is more complex and requires specialized tools and expertise.  There is a risk of accidentally damaging the system or causing further data loss.

* **Anti-Forensics Techniques:**  Sophisticated attackers might employ anti-forensics techniques to detect or evade live analysis tools.


### Arguments for Dead Analysis in this scenario

* **Data Integrity:**  Creating a forensic image of the storage media ensures the preservation of the original data without any modifications.  Tools like `dd` and `dcfldd` create bit-by-bit copies.

* **Thorough Analysis:**  Dead analysis allows for a more comprehensive and in-depth examination of the entire file system, including deleted files, slack space, and other hidden data.  Tools like `The Sleuth Kit (Autopsy)` and `EnCase` are commonly used for dead analysis.

* **Reduced Risk of Contamination:**  Working on a copy of the image eliminates the risk of accidentally modifying the original evidence.

### Arguments against Dead Analysis

* **Loss of Volatile Data:**  Volatile data in RAM is lost when the system is shut down.

* **Delayed Analysis:**  The process of creating an image and setting up the analysis environment can delay the investigation.

# Imaging

Creating a forensic image, important to ensure that the original evidence is preserved. This process involves creating a bit-by-bit copy of the entire storage device, including all active data, deleted files, unallocated space, and even system metadata.  Several tools and techniques are employed to accomplish this while maintaining data integrity.

### Sector-by-Sector Copying

Forensic imaging tools like `dd`, `dcfldd`, and Guymager create a sector-by-sector copy of the original hard disk.  This means that every sector on the source drive is copied to the destination drive, regardless of whether it contains active data, deleted files, or unused space.  This comprehensive copying process is crucial for preserving all potential evidence, including hidden or deleted data that might be relevant to the investigation.  Other specialized commercial tools like EnCase and FTK also provide the imaging facility and are often preferred for their comprehensive features and reporting capabilities that enhance the integrity and documentation of the forensic process.

### Protecting the Original Device

Connecting a hard drive suspected of containing evidence to a standard Windows system can be disastrous. Windows might automatically mount the drive in read/write mode, potentially altering file timestamps and other metadata.  This compromises the integrity of the evidence and could make it inadmissible in court.  To prevent this, it's essential to use appropriate write-blocking hardware or software.

### Write Blockers

Write blockers are specialized hardware or software tools that allow read-only access to a storage device.  They physically or logically prevent any data from being written to the drive, ensuring that the original evidence is preserved.  Hardware write blockers sit between the drive and the forensic workstation, acting as a filter that allows read commands to pass through but blocks write commands. Software write blockers achieve the same effect through software control, typically at the operating system or driver level.

### Investigating the Image

Once a forensic image is created, all investigation and analysis should be conducted on the copy, not the original drive.  The image should be mounted in read-only mode to further ensure that no changes are made. Forensic tools like Autopsy, EnCase, FTK, and The Sleuth Kit provide powerful capabilities for analyzing disk images, recovering deleted files, examining file system metadata, and reconstructing timelines of events.  These tools are designed specifically for forensic analysis and include features to maintain the integrity of the evidence and document the analysis process.

### Bit-Stream Image Creation

A forensic image, also known as a bit-stream image or forensic duplicate, is a complete and exact copy of the original hard drive or other storage media.  The imaging process captures not only the file system's data but also the "free" or unallocated space, which might contain remnants of deleted files or other valuable evidence. This comprehensive approach is essential for thorough forensic analysis. Tools like `dd`, `dcfldd`, and Guymager are commonly used for creating these bit-by-bit copies in Linux environments.  Commercial tools like EnCase, FTK Imager, and X-Ways Forensics offer similar functionalities, often with additional features like integrated hashing and reporting.

### Protecting the Original Evidence

Directly connecting a suspect drive to a Windows system risks altering the original data.  Windows might automatically mount the drive, modifying file access times and potentially overwriting data.  To prevent this, write blockers are essential.

### Drive Protection and Native Devices

Some advanced write blockers offer drive protection features, which might include limiting the drive's read/write speed to minimize wear and tear during the imaging process, especially for older or fragile drives.  A "native device" write blocker uses the same interface for both input and output (e.g., SATA to SATA), ensuring compatibility and optimal performance.  This is important because using different interfaces or adapters could introduce potential points of failure or compatibility issues during the imaging process.

Note only this, once you are done creating the digital image, you need to make sure that the image are the exact *copy* of the **disk**. Use multiple hash algorithms, refer to [Hash Algorithms](hash-algos.md) through which you can check the integrity of the disk images. 


# If server is compromised, what steps are needed to investigate what happened?

- **Capture Volatile Data** using tcpdump, volatitlity tools to inspect whats going on, make sure you check for the **/proc** file system that will give insights on on goign process in the system. 

- **Process Identification**, checking for any suspicious traffic inside the machine, use the command `ps aux` and `htop` to see the processes running within the system.

- **Capture Disk Image** and finally capturing the disk image using `dd` command, make sure that you capture the image, creating *bit-by-bit* copy of the image. Making a master copy of the image and them further creating multiple copies of the image to investigate over it, make sure you are using multiple  [hash algorithms](hash-algos.md) to verify the image copies. 

When server is compromised, there is a concept called [Port Mirroring](port-mirroring.md) that is used in order to investigate the network traffic. Another Procedure is called TMP Module, that 

# Creating Image

# Introduction to `volatility`

`volatility` is written in python, and it has two version `volatility2` and `volatility3` and have many plugins that needs to be configured in order to perform memory dumps, 





