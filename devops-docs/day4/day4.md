# Installing Apache 

Install [apcahe](../../cosa-docs/linux/day13/day13.md) using the package manager and start the apcahe server by making a default website. 

The procedure that you were running on the server is the same, and in the similar manner you can go and start using the apache services. 

# Virtual Private Cloud

VPC (Virtual CLoud Provider) is the logically isolated network that provides a secure way of having retrival and commition of data within the secure environment. VPC contains various networking contructs such as route tables, security groups and other networking constructs to define how **your reosurces** within the system would work or say communicate. This is like having your own little data center within your premise.

Lets discuss one of the appliation of VPC, one such application is where organisations use their on premise data centre and connects it with the cloud utilising the hybrid cloud infrstructure by connecting your data centre with the cloud using VPN tunneling.  

Imagine your office network is your house, and the cloud is a separate building downtown where you want to store some files and run some applications.  You need a secure way to access those resources as if they were in your house. A VPN is like building a private, secure tunnel between your house and that downtown building.

Here are the three ways you can build that tunnel:

1. **You build one end of the tunnel, and the cloud provider builds the other:**  You install a special secure tunnel-building device (like a powerful router) in your house. The cloud provider sets up a similar device in their downtown building.  These devices communicate over the regular internet but encrypt all the data passing through, creating a private tunnel. You're responsible for maintaining the device in your house, and they handle theirs.

2. **The cloud provider builds most of the tunnel:**  The cloud provider sets up a virtual tunnel-building device in their downtown building. You configure your existing internet router in your house to connect securely to their device. This is easier for you as the cloud provider handles more of the technical setup.

3. **A dedicated private tunnel:** Instead of using the regular internet, imagine building a dedicated, physical cable directly from your house to the downtown building. This is much faster and more reliable. You can then build a secure tunnel (like in option 1 or 2) over this dedicated cable for even stronger security and performance.  This is like Direct Connect.


These methods all achieve the same goal: securely connecting your office network to your cloud resources as if they were part of the same network.  They offer different levels of management, performance, and cost, so you can choose the option that best suits your needs.


# Object Storage

Object storage (Amazon S3) storage is unique with the global namespace, value can be something like *your-account-name-bucket-name*, thus, this is used to store the files that can be accessed using the key, and thus data can be retrieved using a key. 

This is the storage options that can help you use the **Static Website Hosting**, the point 

# Serverless Computing 

# Monolithic Application

If you wanto to develop a E-commerce application, what you need is a user management, product management, then order management, and different management features that exists, and all these managment fewature are compressses to tn application, say **app.jar**, the whole application crashed if any one of the feature goes bad, during the development. Therefoere the whole package will be destroyed. 

Monolithic application also doesn't allow you to implement another technology, so the implemenetation of another lanaguage, say if youworking on java, can't go to python.

Furthermore, there is more copmplexity, where there are equal 

# Microserices

Unlike Monolithic application where different management feature can be used by differndevelopers and technolgy. These microservices are develoed i different technolgies and this it is logcally connected to the application, this when it comes to mrcoservice, if the machine is comming for art, but for all teh other feature ill differnt multipl deploument.

# Containerization

Containerization is another kind of the packaging of the application within on operating system requirement that said, it is possible that you have 

Note* This is about the Hypervisor 

What kind of Virtualisation does RedHat uses? What kind of business does they do? Containerisation

COntainers are less secure than virtual machine and therefore you need to make them secure, as an adminitrator, 

# Docker

It will do everything for you, it is nothing but the container runtime, and its a standardized container runtime, it will mange, run, update everyhting will be done by docker.  

# Docker v/s Docker Desktop

In prodcution server, there are two version of Docker, becuase the containers are exepected to have a **Linux**, and therefore, Docker Desktop installs a another layer of Linux Virtual Machine, but that is not the case with the production environment where there is Linux by default and there we only have to install **Docker**.

- Docker Image
- Docker COntainer
- Orchestration