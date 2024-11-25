# CIS Control 

It is to maintain a standard practice of why there is need to make a proper plan before you get into the real world, as you need the information for the kind of attacks, as the attacks keep on changing based on technology, so this CIS control also keep changing.

This text describes three tiers of cybersecurity practices for organizations, categorized by their size, resources, and the sensitivity of the data they handle.  Think of it like levels in a video game – you start at level 1 and work your way up as you get more sophisticated.

**IG1 (Essential Cyber Hygiene):  The Basics**

Imagine a small business or a home office. They have some computers, some data, but not a dedicated IT security team. IG1 is all about the fundamentals: basic antivirus, strong passwords, keeping software updated.  They're mainly worried about common, untargeted attacks like viruses or phishing emails.  The data they're protecting is low-sensitivity stuff: employee contact info, financial records, things like that.  They can't afford much downtime, so their solutions need to be simple and easy to manage.

**IG2 (Protecting Sensitive Information):  Stepping Up Security**

Now think of a mid-sized company with multiple departments and maybe some sensitive client data.  They have dedicated IT staff who manage and protect their systems.  IG2 is about implementing more advanced security measures: firewalls, intrusion detection systems, access controls.  They need to comply with regulations and protect against more sophisticated attacks.  Data loss is a bigger concern, both financially and in terms of reputation. They can handle short interruptions in service, but longer outages would be problematic.

**IG3 (Defending Against Advanced Threats):  The Big Leagues**

This is for large organizations with highly sensitive data and a dedicated security team of experts. Think government agencies, financial institutions, healthcare providers.  IG3 involves specialized security practices like penetration testing (ethical hacking to find vulnerabilities), risk management, and application security.  They're facing targeted attacks from sophisticated adversaries and need to be prepared for zero-day exploits (brand-new vulnerabilities). Data breaches can have serious consequences, including significant financial losses and damage to public welfare.  They need the best possible protection and can invest in advanced technologies and expertise.

Essentially, these IG levels provide a framework for organizations to understand their cybersecurity needs based on their size and the sensitivity of their data.  It's about implementing appropriate safeguards to protect against increasingly sophisticated threats.

# 01: Inventry and Control of Enterprise Assets

You need to fabricate a proper record of the Inventory tht involves end-user devices, hard disks, even if they are getting displaced from one place to another create a proper documentation for it, then there are  non-computing or Internet-of-things, every other devices that are interacting with the internet, hardware address, machine name, enterprise asset owner, department for each asset as there is risk becuause these can communicated accross the internet. 

Not only the fact, that there are risk, but also that these are purchased y company and they are valuable assets that companies are using and therefore, Enterprise cannot define what do have, therefore you need to monitor what kind inventories are there. Refer to [day2 questions](../concepts/day2-questions.md) to get what can happen what can not.

Use **MDM type tools** to manage the information for the hardware addresses and therefore you need to MAC addresses as to prevent the inventory from getting mac-spoofing.

So why **regularly checking the DHCP logs is important?** By regularly reviewing the DHCP logs (at least weekly, ideally more often), you can see which devices have connected to your network. This information can be used to update your asset inventory, ensuring it's accurate and up-to-date. For example, if a new device connects and receives an IP address via DHCP, its entry will appear in the logs, and you can then add it to your inventory.

# 02: Inventory and Control of Software Assets

This is important as you need a proper 

# 03: Data Protection

Here you need to rate the data, meaning the data is higly sensitive and 