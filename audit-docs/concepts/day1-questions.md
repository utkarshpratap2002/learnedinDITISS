
### How do you know what kind of Partition is running when you install the Linux server? 

### What would be do if you detect a Virus in your system?

What you need to do is you need to start looking of CPU consumnption, using the **htop** or **ps aux** command, it might help to look for the users that are running those processes with the **$USER**, looking at what ports are there and what ports are currectly working. 

It might help to start searching for the open port number using the **netstat**, use the command to know what are the services are running and which user or IP is using the following services and following port.

For all these tasks you don't need to automate the processes of making sure that all thes service are shut down, for that you need to use IPS and IDS to make sure that you are able to mitigate it. You'll learn about all these in **NDC**.

Story doesn't end here, you need to **respond**.

- Use Antivirus, see if it is able to detect the Virus, scan the vulnerabilities. If that is not working then you need to use another Antivirus software.

### What are the popular kind of attacks are going on?

