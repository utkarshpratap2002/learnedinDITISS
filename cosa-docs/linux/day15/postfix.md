# Postfix Configuration

```bash
# Installation 

yum install -y postfix

yum install -y mailx
```

```bash
# Take Backup
cp /etc/postfix/main.cf /etc/postfix/main.cf_bkp

# Change the configuration file /etc/portfix/main.cf  
relayhost = [smtp.gmail.com]:587
myhostname= your_hostname
```

```bash
# Location of sasl_passwd we saved
smtp_sasl_password_maps = hash:/etc/postfix/sasl/sasl_passwd

# Enables SASL authentication for postfix
smtp_sasl_auth_enable = yes
smtp_tls_security_level = encrypt

# Disallow methods that allow anonymous authentication
smtp_sasl_security_options = noanonymous
```

```bash
# Create a file under /etc/postfix/sasl/

# Filename: sasl_passwd

# Add the below line
[smtp.gmail.com]:587 email@gmail.com:password
```

```bash 
# Converting the sasl_passwd file into db file
postmap /etc/postfix/sasl/sasl_passwd

# Because it is something like Passwords, encrypt them 
chmod 600 sasl_passwd
chmod 600 sasl_passwd.db
```

```bash
# Start the Service now
systemctl start postfix.service 

# Enable the service 
systemctl enable postfix.service 
```

```bash
# Sending Email using mail command
echo "This is test from Postfix" | mail -s "Reva is Comming!" jerrysinghjsus@gmail.com
```