# What is Cyber Forensics

Cyber forensics is the process of identifying, preserving, analyzing, and documenting digital evidence from computing devices, networks, and digital storage media in a legally sound manner, for the purpose of attributing actions to individuals or systems, reconstructing past events, and presenting findings admissible in a court of law or other investigative proceedings. It focuses specifically on the recovery and investigation of digital artifacts that may serve as evidence of a crime, policy violation, or other incident of interest.

***What is cyber crime?*** It is related to the illeagal access to resources, threats, misuse of devices, leading to misues of devices, Identity theft (using someone else identity). All the identities are hidden, where you can access any network and perform frauds in the world, and performing hacks are easy, no one will be able to identify easily or at the same time. 

Some examples of Cyber Crimes can be called as below:

- Financial Cyber Crimes. Cheating, credit card theft, frauds, money laundry and all.

- Fake Websites. Hard to trust whether the website is authentic of not. 

- Fishing emails. Posing tje theft to the individual by stealing information and able to fetch passwords and more details about the user. 

- Intellectual Property Crimes. Software piracy, copyright infringement, theft of source code. 

- Email spoofing and Online Gambling, where people lose all the money in order to transfer the money to other organisation. 

# What is Digital Evidence?

Whatever information stored inside the computer is stored in binary format, all the data is to be collectded in this digital format, where we are to collect the electronic data in a digital format. Another component is **time-sensitive data**. In digital forensics, time-sensitive data plays a crucial role, especially in establishing timelines, proving or disproving alibis, and understanding the sequence of events in a cybercrime or incident. This type of data can be volatile, meaning it can be easily lost if not preserved quickly and correctly. Some of **time-sensitive digital evidences** are as follows:

- **System Event Logs:** These logs record system events with timestamps, providing valuable information about user activity, application usage, and security-related events.

- **Network Traffic Logs:** These logs capture network activity, including timestamps, source and destination IP addresses, and protocols used.

- **RAM Contents:**  The contents of RAM can reveal running processes, open files, and recently accessed data.

- **Temporary Files:** These files are often created by applications and can contain valuable information about user activity.

- **File System Metadata:** Metadata associated with files, such as creation, modification, and access times, can be crucial for establishing timelines.

Electronic records, data record or data generated, image or sound stored, receeived or sent in an electroneic form or micro  

In order to define the potential evidence there are three factors. One is Materialility, meaning some real evidenece that can help in making decision. Other like this are mentioned below:

1. **Relevance**. The data must be pertinent to the investigation and have a logical connection to the incident.

2. **Admissibility**. The evidence must be obtained legally and meet specific rules of evidence to be admissible in court. This includes demonstrating proper chain of custody and ensuring the integrity of the data.

3. **Authenticity**.  The data must be proven to be genuine and unaltered.  Hashing algorithms are commonly used to verify the integrity of digital evidence.

4. **Reliability**. The data must be dependable and trustworthy. This involves ensuring the accuracy of timestamps and the proper functioning of data acquisition tools.

5. **Completeness**. The collected data should be comprehensive enough to provide a full picture of the incident.  Selective acquisition or omission of data can compromise the integrity of the investigation.

6. **Probative Value**. The evidence must have the potential to prove or disprove a fact relevant to the case.

# EVM Data Chips

Credit cards themselves don't "store" data in the same way a computer does with files and folders.  Instead, they hold information encoded on a magnetic stripe or embedded in a chip.  This information is then used by point-of-sale systems and ATMs to process transactions.

Older credit cards primarily rely on magnetic stripes.  The information is encoded within three tracks, each with a specific purpose. Lets discuss the following way and methods, thought magnetic stripes are not used in today's real world for the trasaction, today we have more secure cards, such as EVM (Europay, MasterCard, and Visa). 

- **Track 1**. This track usually contains the cardholder's name, account number, expiration date, and country code.  It's often used for backward compatibility with older systems.  (Format:  'B' Start Sentinel + Format Code + Primary Account Number (PAN) + Name + Separator + Expiration Date + Service Code + Discretionary Data + End Sentinel '?', LRC)

- **Track 2**. This track contains the PAN, expiration date, and service code. It's the most frequently used track for transaction processing. (Format:  'B' Start Sentinel + Primary Account Number (PAN) + Separator + Expiration Date + Service Code + Discretionary Data + End Sentinel '?', LRC)

- **Track 3**. This track is less commonly used and often contains discretionary data defined by the issuer, such as PIN verification values or customer identification numbers.  (Format: 'B' Start Sentinel + Format Code + Account Number + Separator + Expiration Date + Service Code + Discretionary Data + End Sentinel '?', LRC)

Modern credit cards utilize EMV (Europay, MasterCard, and Visa) chips, which offer enhanced security compared to magnetic stripes. These chips store data in a more secure manner and support dynamic authentication.

- **Cardholder Data**. Similar to the magnetic stripe, the chip contains the cardholder's name, PAN, expiration date, and service code.

- **Integrated Circuit Card (ICC) Private Key**. This cryptographic key is unique to the card and is used for authentication and transaction verification.

- **Card Verification Value (CVV1/CVC1)**. This three or four-digit number, encoded on the magnetic stripe or within the chip, serves as a security feature for card-not-present transactions. Though not directly stored on the chip, it's mathematically related to chip data.

- **Transaction Counters and Logs**.  The chip can store information about recent transactions, aiding in fraud detection.

# Data Not Stored on the Card

It's critical to understand what is *not* stored directly on the credit card, The PIN (Personel Identity Number) is never stored on the card itself. It is typically encrypted and stored securely within the card issuer's systems. The chip verifies the PIN entered by the cardholder against this encrypted value without ever transmitting the actual PIN.

Details such as **Cardholder's Address, Social Security Number, etc.,**  this detailed personal information is not stored on the card itself. It resides within the card issuer's databases.

Moreover **Transaction History**, While some transaction logs might reside on the chip for a short period, the full transaction history is maintained by the card issuer.

Another part is **CVV2/CVC2 (Card Verification Value 2) and CID (Card Identification Number)** These three or four-digit security codes are printed on the back of the card (for Visa, MasterCard, and Discover) or on the front (for American Express).  They are not stored electronically on the card or in any database.  They are derived from the PAN and expiration date at the time of card issuance and used for added security during online and phone transactions.

The move to EMV chip technology has significantly improved credit card security by making it more difficult for criminals to clone or counterfeit cards.  However, vulnerabilities still exist, particularly for card-not-present transactions.  This is why security measures like two-factor authentication and fraud monitoring are essential.

It's important to note that the specific data elements and formats can vary slightly depending on the card network (Visa, MasterCard, American Express, Discover) and the issuing bank. This explanation provides a general overview of the types of data associated with credit cards.


# What IRP (Incident Respose Plan)?

An Incident Response Plan (IRP) is a crucial document outlining a systematic approach to handling security incidents, breaches, or other disruptive events affecting an organization's systems and data.  It provides a structured framework for coordinating resources, minimizing damage, and ensuring a swift and effective recovery.  A well-defined IRP addresses key problem statements, including:

One major problem is the lack of preparedness.  Organizations often find themselves scrambling to react when an incident occurs, leading to inconsistent and ineffective responses.  An IRP addresses this by pre-defining roles, responsibilities, and procedures, ensuring a coordinated and efficient response.  It establishes clear communication channels and escalation paths, preventing confusion and delays during critical moments.

Another challenge is the difficulty in identifying and containing incidents promptly.  Without a clear plan, organizations may struggle to detect security breaches or other disruptive events, allowing them to escalate and cause further damage.  The IRP tackles this by outlining incident identification criteria and establishing monitoring procedures.  It details containment strategies to isolate affected systems and prevent the spread of malware or unauthorized access.

Effective evidence preservation and analysis is crucial for successful incident response and potential legal proceedings.  However, without established procedures, valuable evidence can be lost or compromised.  The IRP addresses this by defining procedures for collecting, preserving, and analyzing digital evidence in a forensically sound manner.  This ensures the integrity of the evidence and its admissibility in legal proceedings, if necessary.

Communication during an incident can be chaotic and inconsistent, leading to misinformation and hindering the response effort.  The IRP addresses this by establishing clear communication protocols, identifying designated spokespersons, and defining communication channels for both internal and external stakeholders.  This ensures that accurate information is disseminated promptly, preventing rumors and speculation.

Finally, a critical problem is the lack of a structured approach for recovery and post-incident activity.  After an incident, organizations need to restore systems, address vulnerabilities, and learn from the experience.  The IRP guides this process by outlining recovery procedures, including data restoration, system reconfiguration, and vulnerability patching.  It also emphasizes the importance of post-incident reviews to identify areas for improvement and enhance the organization's overall security posture.  By addressing these core problem statements, a comprehensive IRP equips organizations to handle security incidents effectively, minimizing damage and ensuring business continuity.

# Principles of Cyber Forensics

Lets talk about some of the standards that are important to follow when it comes to following the priniciples about the system and storage. In this section we are going to understand what it means when we start working in real world, also refer to [Chain of Custody](chain-of-custody.md) in order to understand the purpose of documentation process. 

### No action should change data held on a computer or storage media which may be subsequently relied upon in court.

Imagine a company suspects an employee of leaking confidential data. Their computer is seized as part of an internal investigation. Here's how the principle applies.

* **Incorrect Approach:**  An inexperienced IT staff member, intending to be helpful, directly logs into the employee's computer to "check what files were accessed."  They open several documents and browse the file system.

* **Why This Is Wrong:**  By accessing the computer directly, the IT staff member has potentially altered last access times, created new log entries, and possibly modified prefetch or other system data.  This compromises the integrity of the original evidence.  The defense could argue that the IT staff member's actions contaminated the evidence, making it unreliable.

* **Correct Approach:**  A trained forensic investigator creates a bit-by-bit forensic image of the employee's hard drive using a tool like `dd`, `dcfldd`, or FTK Imager (on a separate forensic workstation).  They then work exclusively on a copy of the image, leaving the original drive untouched.  All analysis is performed on the copy, preserving the original evidence.  The hash values of the original drive and the image are compared to verify that the image is an exact replica.

* **Why This Is Correct:** The original hard drive remains pristine and unaltered.  The investigator works on a separate copy, ensuring that any actions taken during the investigation do not modify the original evidence.  The documented chain of custody and verified hash values demonstrate the integrity of the evidence, making it much more likely to be admissible in court.

### In circumstances where a person finds it necessary to access original data held on a computer or storage media, that person must be competent to do so and be able to give evidence explaining the relevance and the implications of their actions.

A company's server is compromised, and a security breach is suspected.  A system administrator, without specific forensic training, decides to directly access the server to "see what happened."

* **Incorrect Approach:**  The system administrator logs into the compromised server and starts examining log files, running commands, and attempting to identify the source of the breach.  They are well-intentioned but lack the expertise to handle digital evidence properly.

* **Why This Is Wrong:**  Directly accessing the compromised server risks altering crucial evidence.  The administrator's actions could modify timestamps, overwrite volatile data, or even introduce new malware.  Their lack of forensic training might lead them to overlook or misinterpret critical evidence.  This jeopardizes the integrity of the investigation and could make it difficult to prosecute the attackers.

* **Correct Approach:** A qualified forensic investigator is called in.  They understand the importance of preserving evidence and follow established procedures.  They first create a forensic image of the server's hard drive(s) and then perform all analysis on the copy.  If, in exceptional circumstances, they need to access the original server (e.g., to capture volatile data), they document every action taken, explain the reasons behind those actions, and ensure their actions are minimally invasive.

* **Why This Is Correct:** The forensic investigator's expertise minimizes the risk of contaminating evidence.  Their documented actions and explanations provide transparency and accountability.  Their understanding of the legal implications ensures that the evidence gathered is admissible in court.  They can also provide expert testimony to explain their actions and findings.

### An audit trail or other record of all processes applied to computer-based electronic evidence should be created and preserved. An independent third-party should be able to examine those processes and achieve the same result.

A forensic investigator is analyzing a hard drive image related to a suspected intellectual property theft.  They recover a deleted document that appears to contain sensitive company information.

* **Incorrect Approach:** The investigator performs various analyses on the image, but their notes are disorganized and incomplete.  They don't document the specific tools and commands used, the versions of the software, or the precise parameters applied.

* **Why This Is Wrong:**  Without a detailed audit trail, it's impossible for another investigator to reproduce the results.  The defense could argue that the findings are unreliable or that the investigator's methods were flawed.  The lack of transparency casts doubt on the entire investigation.

* **Correct Approach:**  The investigator meticulously documents every step of their process. Their notes include:

    * **Case details:** Case number, date, and a summary of the incident.

    * **Evidence acquisition:**  Method used to create the forensic image (e.g., `dd`), hash values of the original drive and the image, storage location of the evidence.

    * **Analysis steps:**  Specific tools used (including versions), commands executed with parameters, and timestamps of each action.

    * **Findings:**  Detailed descriptions of the recovered data, including file paths, timestamps, and relevant content.

    * **Conclusions:**  A summary of the findings and their relevance to the case.

### A person in charge of the investigation has the overall responsibility for ensuring that the law and these principles are adhered to.

A law enforcement agency is investigating a cybercrime case involving a network intrusion.  A team of forensic investigators is assigned to the case, led by a senior investigator.

* **Incorrect Approach:** The senior investigator delegates tasks to the team but doesn't provide clear guidance on procedures or legal requirements.  Some team members take shortcuts, failing to document their actions properly or neglecting to maintain chain of custody.

* **Why This Is Wrong:** The lack of oversight and clear direction from the lead investigator creates a risk of compromising the investigation.  Procedural errors or failures to follow legal requirements could lead to evidence being inadmissible in court.  The entire case could be jeopardized due to a lack of leadership and accountability.

* **Correct Approach:**  The senior investigator takes overall responsibility for the investigation. They:

    * **Establish clear procedures:** Provide the team with detailed guidelines on evidence handling, data acquisition, and analysis techniques.
    * **Ensure legal compliance:**  Familiarize the team with relevant laws and regulations regarding search warrants, data privacy, and evidence admissibility.
    * **Supervise and review:**  Actively supervise the team's work, reviewing their documentation, and ensuring adherence to established procedures.
    * **Provide training:**  If necessary, provide additional training to team members to ensure they have the necessary skills and knowledge.
    * **Maintain chain of custody:** Oversee the chain of custody process, ensuring that all evidence is properly documented and tracked.

* **Why This Is Correct:**  By taking ownership of the investigation and implementing these measures, the senior investigator ensures the integrity and legality of the entire process.  This increases the likelihood of a successful prosecution and strengthens the case in court.  It also protects the agency from accusations of misconduct or procedural errors.

# General Evidence Processing Guidelines and Procedure

- Making hash of the files and store them, while moving the files from one place to another,

- Record the **time stamp** for all the files, such as creation data, last modified data, and find as much as information possible. 

```bash
> stat randomfile.sh 
File: loop.sh
Size: 673       	Blocks: 8          IO Block: 4096   regular file
Device: 253,0	Inode: 17662412    Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Context: unconfined_u:object_r:admin_home_t:s0
Access: 2024-12-31 09:11:29.645513805 +0530
Modify: 2024-12-31 09:11:29.646513652 +0530
Change: 2024-12-31 09:11:29.649513191 +0530
Birth: 2024-12-31 09:11:29.645513805 +0530
```

- Take electronic snapshot of files and data, make an electronic copy of the files or data to be used as evidence, document everything about the data like location, tools used to recover and copy etc. 

- Once the data is delete, the data can be recovered, where you can recover the data using specific tools that involves the understanding of [Storage Basics](storage-basics.md). 



