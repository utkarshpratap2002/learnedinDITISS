# Command and Control
Taking about Putty and its standards.
There is 9600 Bits per second, is the standard that is followed in the CIsco Routers.

- **Restart the Router** and *Ctrl + Break*, Use `config-register 0x2100` as the configuration value, it will directly boot up to ROM MON.
- confreg 0x2142 is the command that will bypass the NVRAM, press *Enter* to allow the Router load the Setup.
- It will then ask for enter ing into the initial setup of th erouter, but we don't want that, so say **n**.
- 