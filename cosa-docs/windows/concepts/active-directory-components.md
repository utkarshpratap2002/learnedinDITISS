# Active Directory Domain and Forest

### Forest

A forest is the highest level of the logical structure hierarchy. An Active Directory forest represents a single self-contained directory. A forest is a security boundary, which means that administrators in a forest have complete control over all access to information that is stored inside the forest and to the domain controllers that are used to implement the forest.

### Domain

Domains partition the information that is stored inside the directory into smaller portions so that the information can be more easily stored on various domain controllers and so that administrators have a greater degree of control over replication. Data that is stored in the directory is replicated throughout the forest from one domain controller to another. Some data that is relevant to the entire forest is replicated to all domain controllers. Other data that is relevant only to a specific domain is replicated only to domain controllers in that particular domain. A good domain design makes it possible to implement an efficient replication topology. This is important because it enables administrators to manage the flow of data across the network, that is, to control how much data is replicated and where that replication traffic takes place.


### OUs

OUs provide a means for administrators to group resources, such as user accounts or computer accounts, so that the resources can be managed as one unit. This makes it much easier to apply Group Policy to multiple computers or to control the access of many users to a single resource. OUs also make it easier to delegate control over resources to various administrators.