# SMTP

The mail service works on DNS query which resolves the mail server and their IP addresses, if you have a mail address something@gmail.com and you are sending the mail to the mail address support@outlook.com, *how your mail will resolve the IP address of the mailserver **outlook.com**?* It is through the DNS resolution of one mail server to anther.

When you create DNS records, several types of records are established to manage and direct internet traffic associated with your domain. Each type of DNS record serves a specific purpose in the Domain Name System (DNS), which translates human-readable domain names into machine-readable IP addresses. Here’s a logical explanation of the most common DNS records:

### 1. **A Record (Address Record)**
- **Purpose**: Maps a domain name to an IPv4 address.
- **Example**: If you have a domain `example.com`, the A record might point to `192.168.1.1`.
- **Function**: This is the most fundamental record for directing traffic to a specific server where your website is hosted.

### 2. **AAAA Record**
- **Purpose**: Similar to the A record, but it maps a domain name to an IPv6 address.
- **Example**: An AAAA record for `example.com` might point to `2001:0db8:85a3::8a2e:0370:7334`.
- **Function**: As IPv6 addresses become more prevalent due to the exhaustion of IPv4 addresses, this record is increasingly important.

### 3. **CNAME Record (Canonical Name Record)**
- **Purpose**: Creates an alias for a domain name.
- **Example**: A CNAME record for `www.example.com` could point to `example.com`.
- **Function**: This allows multiple domain names to point to the same IP address, simplifying management and allowing for easier changes.

### 4. **MX Record (Mail Exchange Record)**
- **Purpose**: Specifies the mail server responsible for receiving email on behalf of a domain.
- **Example**: An MX record for `example.com` might point to `mail.example.com` with a priority value indicating which server should be tried first.
- **Function**: Essential for routing emails correctly, allowing users to send and receive emails associated with their domain.

### 5. **NS Record (Name Server Record)**
- **Purpose**: Indicates which DNS server is authoritative for a particular domain.
- **Example**: An NS record might point to `ns1.examplehostingprovider.com`.
- **Function**: This tells other servers where to look up DNS records for your domain, forming the backbone of DNS delegation.

### 6. **SOA Record (Start of Authority Record)**
- **Purpose**: Contains administrative information about the domain, including the primary name server and contact information.
- **Example**: The SOA record includes fields such as serial number, refresh time, and retry time.
- **Function**: It helps manage how often secondary DNS servers should check for updates from the primary server.

### 7. **PTR Record (Pointer Record)**
- **Purpose**: Maps an IP address back to a domain name (reverse DNS lookup).
- **Example**: A PTR record might link `192.168.1.1` back to `example.com`.
- **Function**: Useful for verifying the legitimacy of email servers and reducing spam by ensuring that IP addresses correspond to valid domains.

### 8. **TXT Record (Text Record)**
- **Purpose**: Allows arbitrary text data to be associated with a domain.
- **Example**: A TXT record might contain SPF (Sender Policy Framework) information like `"v=spf1 include:_spf.example.com ~all"`.
- **Function**: Commonly used for verification purposes and email security settings.

### 9. **SRV Record (Service Record)**
- **Purpose**: Specifies the location of servers for specific services, including ports and protocols.
- **Example**: An SRV record could indicate that a service like SIP is running on port 5060 at `sip.example.com`.
- **Function**: Helps in directing traffic for specific applications or services rather than just web traffic.


Each type of DNS record plays a crucial role in how internet traffic is directed and managed. Understanding these records helps in configuring domains effectively, ensuring that users can access websites, send emails, and utilize various internet services seamlessly.


# How Mail Transfer works?

First thing first, A DNS query is made in order to resolve the mail server of the *outlook.com* from *gmail.com* side, asking for outlook.com **MX** record, once the mailserver (gmail.com) gets the MX record for the *outlook.com*, it will again make a DNS query for its **A** record which will resolve the IP address of the mailserver (outlook.com).

Not only resolution, but the inspection and checks are also performed by the mail server, such as a custom mail server **.com**, if this mail server sends the mail to some other mail server, say gmail.com, gmail.com will first check if it valid mail address by doing the following checks:

- **SPF (Sender Policy Frameowork)** is checked for the spam mails, this checks the TXT entry of spf to identify whether the authoritative mail server that is handling the emails for the mail, say example.com, is only the mail server from where the email is comming.

- **DKIM** record is created on the server to expose the public key to the client who is trying to send the mail to the mail server, it checks if the public key is able to match the private key of the source mail server. If it is the anonymoeous person trying to send the email, say a hacker, then he won't be able to match the public key with private, hence the authentication will fail.

- **DMARC** is another record that is set to make the decision on what to do if the authentication fails, if the SPF fails, DKIM fails, then in that case we have choice to take the decision to either *ALLOW*, *REJECT*, or *SPAM* the mail.

Refer to [MX Lookup](https://mxtoolbox.com/SuperTool.aspx?action=mx%3aoutlook.com&run=toolpage) that list all the mail servers for the particular domain handling the emails, so you can go and check for the mail servers handling emails for say gmail.com, or yahoo.com, or any custom domains etc.

# Mail Server

When we say there is a mail server established on IP 1.2.3.4, it is established using the SMTP Protocol, that runs on port number **25** and SMTPS (Simple Mail Transfer Protocol Secure) runs on port number **465**. Just like we use HTTP/HTTPS to send and recieve data which can be communicated using request and response on http/https, similarly the smtp/smtps protocol runs for the mail transfer service.

- **Mail Server** - A mail address such as reva@gmail.com sending a mail to **mrdhvi@example.com** which is a custom mail server running a SMTP server that is handling the mails from domain name example.com and every mail comming for the example.com needs to be resolved using MX and A record.

- **SMTP server** - Say your SMTP server is running on mail.example.com which is your SMTP server handling the mail service.
  - Now you need to create a MX record that will resolve the domain name of  **mrdhvi@example.com** to the domain **example.com** which is the resolution of email address to the domain, through the domain *mail.example.com* is a subdomain within your domain *example.com* which is handling the SMTP server of your domain *example.com*.
  - **MX Record** will contain the mail server resolution of the domain name, as the domain **example.com** will resolve the subdomain **mail.example.com** that has running SMTP server.
  - Further this **mail.example.com** subdomain will be resolved to IP address using the **A** record.

Remember, it is not necessary that there will be a subdomain always running within a domain, though it is just an standard procudure that this is how the structure is builded.