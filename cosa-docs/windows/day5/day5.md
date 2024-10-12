# Transfer to Roles

1. **Reason 1** 
  - To balance the load. Your  DC is handling a very high AD traffic. To reduce load on DC you transfer some roles to ADC.
  - You are shutting down the DC for some upgrade like RAM, CPU for a longer duration.
  - Removing old DC.

2. **Transfer FSMO Roles**
  - TO tansfer role the current role holder server and new role holder server should be online and connected. 

3. **Seize FSMO Roles**
  - There server handling the role has failed (Hard disk failure). Thus, the server is not going to come back. 
  - Thus, the current role holder can't be online, as it going to get seized

Go to **Operation Master** and check the available options.

# Transfer Forest-wide Roles

- First you need to register using `regsvr32 schemmgmt.dll`, until and unless you don't register, it won't get the schema master.
- then run with `mmc` which is microsoft management console.
- Console Root will open up and then go to **file** -> **Add/Remove Snap-in ..**, then you can select the Utilities.

# `ntdsutil` 

It is very important utility, all theh utilities are workded through this, all the directory based services are dealt here. Remember that there is no options for the trasfer of the utilities and therefore you need **ntdsutil**.

- `fsmo maintainance`
  - `transfer rid master`
  - `transfer infrastructure master`
  - `transfer pdc `
  - `transfer schema master`
  - `transfer naming master`
  - `quit`
  - `netdom query fsmo` to check whether the roles are transfered or not.
- ``

# Windows Registry

Windows Registry is a database that stores Windows OS settings and configuration, installed application settings, Installed hardware settings and configuration, User settings etc. 

# Group Policies

When you start configuring the group policies, there are two options, one us computer configuration and another is user configration. When it comes to installing programs and softwares for the users, remember:

1. **Install `.msi` files**
  - Always install the `.msi` files from the website, don't install the `.exe` file.
  - Now if you need to give access of the certain people, you can do this by going to folder and allow certain permission of access.

2. **Sharing of the Software**
  - You can choose to configuure different software for different users.
  - You need to choose from one them, Pulbished, Assigned, and Advanced. Remember that software won't be installed until you publish it. 

3. **Users can install Application**
  - Users can install the application from the **Get Porograms** inside the **Programs** from **Control Panel**.
  - Remember tha tonly those users who are assigned the applications are only allowed to installe it from the **Get Porgrams** inside the **Control Panel Home**.

