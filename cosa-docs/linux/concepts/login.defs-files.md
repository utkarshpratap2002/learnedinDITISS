# `/etc/login.defs`

It is used to create the system-wide env variables

- MAIL_DIR
- UMASK
- HOME_MODE

- **PASS_MAX_DAYS**, this will have the default value of 99999, but in order to impose the security principal to secure your password, it needs to get updated or rotated, you never know.
- PASS_MIN_DAYS
- PASS_WARN_AGE

- **UID_MIN** has default value of 1000, when a new user is created by default it gets ids more than 1000, but you can change the settings of the entry.
- **UID_MAX** has maximunof 60000

- **ENCRYPT_METHOD**, thus the password is saved in YESCRIPT, but it is configurable and therefore you need to go to this entry and change it to any other option.

- **UMASK** is where yo dicide what shoul dbe the default permission for the 

# `/etc/profiles`

It is used to add system0wide functions, env variable, aliases

# 