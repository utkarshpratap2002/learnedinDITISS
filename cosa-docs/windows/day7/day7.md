Remember when it comes to WDS, you first need to install the WDS

# Troubleshooting of WDS

One side you have the client and another side there is server. You need to consider that New virtual machine with no OS, so there can multiple reasons for that:

1. Client and WDS are not in the same network. Meaning it is possible that there is another network that is giving the DHCP response, meaning it could be that your Virtual Machine is giving a DHCP response, not the Domain Controller.

2. Another problem can be DHCP is not able to give the response. So you need to do the complete configuration of DHCP.

3. Check is DHCP is running or not, if not running you need to go to the Daashboard and check if the DHCP server is running, whether the Service box has tuned Green or not.

4. See if there is client response is given to all the connected computers. There can be possibility that you havn't enabled that response behaviour of the WDS.

5. Next, Possibility is that there might be problem in the boot images, you might have not configured the right boot image or might be possible that there is no boot image.

Remember that there is nothing but trobleshooting concepts that are needed because *they* will only come after you for the troubleshooting processes. 

# FSRM (File Server Resource Management)

Mostly you need apply the restrictions to the users where you can provide the restriction over the file and user is allowed to use the resources within the specified limit.

1. **Quota Management**
    - Restrict how muhc data user can save in a folder.
    - Soft limit is for users, which allows to store more data than the actual limit.
    - Hard limit is where user is not allowed to store *any* data, once the limit is reached tha user won't be able to store any data.

2. **File Screening**
    - You can create a file groups and restrict the users from accessing the file extensions.
    - You can block users from storing such files.

3. **File Classification**
    - You can classify files if you know what data is important and based on that you classify files.
    - Mostly there are **dlp** software that works on agents which works on policies, you can restrict or allow the files with certain operation and thus it is possible to identify the content of the files. 
    - So based on parameter and properties administrator can define policies.

4. **File Tasks**
    - Allows administrators to automate file related tasks like deleting files after certain time, backing up files after certain times.
    
5. **Storage Reports**
    - It a feature that adminitrators can use to generate the reports regarding quota of file screening etc.
    - You can see users exceeding file storage and who is enjoying the limit.

# How to Configure Quota Mangement?

1. **Install FSRM**

2. Go to Quota and create one, there you will have options to create and inside *configure teh quite properties* option, you'll have option of **Custom Properties**.

3. Then you can select from **Hard Limit** or **Soft Limit**, along with this, select **Add** to Generate notifications when usage reaches* percentage.

4. Then there is option to send email to the user who exceedes the thesshold ofr the specified quota.

Remember that you need to give read and write permission to the user in order to store and access the folder.

# How to configure the File Screening?

1. Go to File Groups and create a new Template of file groups for screening. 

2. Then, go to **File Screens** and add rules, *right-click* and **Create File Screeens**

3. Browse the Path of the file and then configure the file properties  or using deined custome properties, chos ethe cusomt properties and select the file template we created. **By default the files group will be bloacked**.

4. Then there us **E-mail Message** and **Event log** which is super important and therefore, you need to enable this option from the Menu.

5. Then yo need to give teh active screeening to the files.

Remember that once you create the file screen for a folder, you can't create a file screen for the same folder. You can a;so

# How to do Classification Management?

1. Go to Classification Properties, and Create t classdication Property.

2. You'll find options for the Property, for example, rating based on confidentiality and all.

3. Then create **Local Property**, and give name, then, this will create property will different ratings and rules.

4. Then you need to go to **Classification Rule**, thus, this will create the rules for the specified Propterties.

5. Then, Create a Classicaition RIle, and go to **Scope**, then add the folder for which you want to apply the rules to.

6. Then, go to **Classifcation** from the Menu, then allow the content classifier, menaing what criteria you wnat to apply it to.

7. Then Choose the specific Values. 

8. Then select **Configure** to apply the scopes content based on the content within the file.

9. Then **Evaluation Type**, how many times the rules will be checked after **modification**.


