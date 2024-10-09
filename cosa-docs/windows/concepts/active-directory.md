# AD (Active Directory)

In simpler terms, while administrators manage AD by interacting with the logical structures (like users, computers, and policies), the underlying operations are handled by a database that physically stores all the information needed to manage the directory services.

The phrase *Active Directory (AD) is a logical entity and is bound to physical structure* means that while **Active Directory** presents itself logically to users and administrators through elements like **domains, trees, and forests**, its core functionality relies on a physical foundation, which is a **database**. This database is responsible for storing and managing all the directory-related data.

1. **Logical Structure**:
   - AD is organized in a hierarchical format consisting of domains, forests, and organizational units (OUs). These are abstract concepts that allow administrators to organize resources and manage access in a logical way.
   
2. **Physical Structure**:
   - The actual **data storage** behind this logical structure is a **database**, which resides on domain controllers (DCs). The database used by AD is known as the **NTDS.dit** file (New Technology Directory Service Database Information Tree). It is stored on the hard disk of each domain controller and contains:
     - **User accounts**
     - **Security groups**
     - **Permissions**
     - **Computer accounts**
     - **Other objects and attributes within the directory**.

3. **Data Store**:
   - The Active Directory **data store** is both **physical files** and services. This means that the database handles all the **read/write operations** for objects within the directory, and ensures the data is accessible to authorized services, applications, and users. Every time a change is made, it is reflected in this database.
   
4. **Replication**:
   - Since the AD database is stored on multiple domain controllers (in a forest or domain), these controllers synchronize the data to ensure consistency across the network. This makes the directory highly available, even if one domain controller fails.

Refer to [text](../day3/day3.md) to undertand the overall structure of the Active Directory and how DNS works within the Forest.
