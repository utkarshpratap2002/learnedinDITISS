# OpenSSL LAB

Our objective is to setup our own certificate authoirity using openssl command-line tools. And conifgure HTTPS website using the certificates generated from CA/PKI.

```
shihari.local/
 - rootca.shuhari.local
 - subca.shuhari.local
 - deb3.shuhari.local (www.shuhari.local)
```

- Install `openssl` on all machines
- Configure dns for name resolution

- Make sure your ip is configured, `apt-get update` us working, check the version.

```
# test on all the machines
ip a
apt-get update
openssl version
```

```
# check dns
nslookup
subca.shuhari.local
deb3.shuhari.local
www.shuhari.local
```

```
# check short name resolution
www
```

```
# check on all the machines
hostname
hostname -f
hostname -s
hostname -d
``` 

We need to create a database similarly like XCA, we will create a folder structure, storing required files inside them.

```bash
# on root ca machine
mkdir ca
cd ca

# create the folders on root ca machine
mkdir -p certs crl newcerts private subca/csr subca/certs

# on root ca machine, rwx to owner
sudo chmod 700 private/

# The CA Database files:
# - Atribute File
# - Index file
# - Serial Files 
#   - Certificate serial neumber file
#   - CRL number file

# creating database
#  - inside ca folder
touch index.txt # all the certificates issued will come here
touch index.txt.attr # it is like the control file attributes
echo 1000 > serial # storing serial number
echo 1000 > crlnumber # for storing revokation

# download the configuration file inside the ca named rootca.cnf
cat rootca.cnf
nano rootca.cnf
# change
dir         = /home/shuhari/ca

# generate our private key
openssl genrsa -aes256 -out private/ca.key.pem 4096 # enter passwd and see the ca.key.pem file created inside the private folder

# secure the private key
chmod 400 private/ca.key.pem

# generate self-signed certificates inside certs
openssl req -config rootca.cnf -key private/ca.key.pem -new -x509 -day 7300 -sha256 -extensions v3_ca -out certs/ca.cert.pem
```

Private key is used in order to set up the Root CA, and then Root CA needs to self sign. Next we are to build the SubCA, where our first job is to sign CSR using SubCA private key. First thing first, we will gererate the private key, then create csr and will sign the csr using the private key, and then send it to root ca who will then send the certificate by signing it with his private key and we will store the certificate inside subca file struvture that we will create. 

```bash
# creating the file structure
mkdir subca
cd subca
mkdir -p certs crl csr newcerts private
chmod 700 private/
touch index.txt
touch index.txt.attr
echo 1000 > serial
echo 1000 > crlnumber

# download the subca.cnf file and edit it
nano subca.cnf
dir                = /home/shuhari/subca

# generate the private key 
openssl genrsa -aes256 -out private/subca.key.pem 4096 # enter passwd

# secure the private key
chmod 400 private/subca.key.pem

# now create the csr for the subca
openssl req -config subca.cnf -new -sha256 -key private/subca.key.pem -out csr/subca.csr.pem  # then fill the form and other details

# send /subca/csr/subca.csr.pem to /ca/subca/csr/subca.csr.pem
```

Now move to ca and we need to sign the certificate using the private key of the ca. We have exported the csr from the csr and now we need to generate the certificate for subca using the private key of root ca. 

```bash
# in root ca
openssl ca -config rootca.cnf -extensions v3_intermediate_ca -days 3650 -notext -md sha256 -in subca/csr/subca.csr.pem -out subca/certs/subca.cert.pem

# check the serial and serial.old
cat serial
cat serial.old

# verify the new file created in index.txt.attr
cat index.txt.attr

# check the files are same using hash function
md5sum subca/certs/subca.cert.pem newcerts/1000.pem

# copy the /ca/certs/subca.cert.pem to /subca/certs/subca.cert.pem
```

Now move to the debian 3 machine where we'll generate the certificates for the machine. 

```bash
# inside deb3 machine
# create certs
mkdir certs
cd certs

# creating certificate for deb3
openssl genrsa -out www.shuhari.local.key.pem 2048

# changing permission
chmod 400 www.shuhari.local.key.pem

# download the subca.cnf file
# there should be subca.cnf file inside certs

# generate the csr
openssl req -config subca.cnf -key www.shuhari.local.key.pem -new -sha256 -out www.shuahri.local.csr.pem
# csr will be generated inside certs

# now you need to move /certs/www.shuhari.local.csr.pem to /subca/csr/www.shuahri.local.csr.pem
```

Now move to subca and sign the csr and generate the certificate for the de3 using the subca's private key. 

```bash
# we are inside sub ca
# create certificate for the deb3/www.shuhari.local.csr.pem
openssl ca -config subca.cnf -extensions server_cert -days 375 -notext -md sha256 -in csr/www.shuhari.local.csr.pem -out certs/www.shuhari.local.cert.pem

# move /subca/certs/www.shuhari.local.cert.pem to /certs/www.shuhari.local.cert.pem
```

Now we need to create the chain certificate for all of them. We need to copy `/subca/certs/subca.cert.pem` file to deb3 machine ` /certs/subca.cert.pem`. We also need to ca certificate, so copy `/ca/certs/ca.cert.pem` to `/certs/ca.cert.pem`. 

Now all these certificates needs to be bundled.

```bash
# bundle certs in deb3
cat www.shuhari.local.cert.pem shuhari.cert.pem ca.cert.pem > bundle.cert.pem
```

PKI is complete, now we need to configure the https server which will use these certificates. 

```bash
# inside deb3
sudo apt-get install apache2

# copy the bundle to apache ssl
sudo mkdir -p /etc/apache2/ssl
sudo cp bundle.cert.pem /etc/apache2/ssl
sudo cp www.shuhari.local.key.pem /etc/apache2/ssl
sudo chmod 600 /etc/apache2/ssl/*
```

We need to enable the ssl module.

```bash
# enable ssl
sudo a2enmod ssl

# check for the soft-link
sudo ls -l /etc/apache2/sites-enabled/

# enable default-ssl
sudo a2enmod default-ssl

# check for the soft-link after enabling default-sites
sudo ls -l /etc/apache2/sites-enabled/

# go to the file /etc/apache2/sites-available/default-ssl.conf
sudo nano /etc/apache2/sites-available/default-ssl.conf

# change the virtual host ServerName to www.shuahari.local:443 and also the port 443 on virtual host tag
ServerName www.shuahari.local:443

# enter the path for certificate and key
SSLCertificate          /etc/apache2/ssl/bundle.cert.pem
SSLCertificate          /etc/apache2/ssl/www.shuahari.local.key.pem

# restart the apache2
sudo systemctl reload apache2
sudo systemctl restart apache2
```

Now check for the `www.shuhari.local.com`, you might want to add the certificate to MMC that will create the trust for your browser to check.  


# Intrusion Detection System

There are two types of IDS, one *based-on behaviour*, *based-on installation*, another is based on *analysis scheme*, *ids-methodologies*, meaning method based IDS.

- **Based-on Behavious**
  - Passive IDS
  - Active IDS

- **Based-on Installation**
  - Host-based Intrusion detection system (HIDS)
  - Network-based Intrusion detection system (NIDS)
  - Hybrid Intrusion detection system

- **Analysis Scheme**
  - Preprocessing
  - Analysis
  - Response
  - Refinement

- **Intrusion Detection Methodologies**
  - Signture-Based Detection
  - Misuse Detection
  - Machine Learning Based-Detection

# IDS Architecture



# `suricata` LAB: IPS mode

```bash
# in deb1 
suricata --build-info | grep NFQueue # it should return yes

# creating queue in OS and send the traffic to Queue, redirecting the ICMP traffic
sudo vim /etc/suricata/suricata.yaml

# uncomment four lines from nfq 
mode: accept
repeat-mark: 1
repeat-mask: 1
route-queue: 2

# iptables redirection
sudo iptables -I INPUT -p icmp -j NFQUEUE --queue-num 2
sudo iptables -I OUTPUT -p icmp -j NFQUEUE --queue-num 2

# create rules 
sudo vim /etc/suricate/rules/local.rules
drop icmp any any -> any any (msg: "Kuch Bhi ICMP"; sid 123; rev:1;)

# run the suricata in IPS mode
sudo suricata -c /etc/suricata/suricata.yaml -q 2
```

**Suricata ERROR**

```
reva@debian:~$ sudo suricata -c /etc/suricata/suricata.yaml -q 2
19/12/2024 -- 13:16:21 - <Notice> - This is Suricata version 6.0.10 RELEASE running in SYSTEM mode
19/12/2024 -- 13:16:21 - <Warning> - [ERRCODE: SC_ERR_NO_RULES(42)] - No rule files match the pattern /etc/suricata/rules/suricata.rules
19/12/2024 -- 13:16:21 - <Warning> - [ERRCODE: SC_ERR_NO_RULES_LOADED(43)] - 1 rule files specified, but no rules were loaded!
19/12/2024 -- 13:16:21 - <Notice> - all 4 packet processing threads, 4 management threads initialized, engine started.
```

# Elasticsearch Lostash Kibana

- Elasticsearch 
  - Distributed, RESTful, seach and analytics engine
- Lab - setup a single Node Cluster

- In order to achieve this lab objective, give 8GB of RAM, setup the time zone. 

```bash
# install java dev toolkit
sudo apt-get install -y default-jdk

# check version
java -version

# install curl
sudo apt-get install curl

# search for file, go to /tmp (because we installed it in /tmp)
ls -l

# install the elk file 
sudo dpkg -i <file-from-local-server-eks>

# on third you might see a password, save it

# now install elasticsearch
sudo systemctl status elasticsearch

# edit permissions and change the cluster
sudo chmod 755 /etc/elasticsearch
sudo nano /etc/elasticsearch/elasticsearch.yaml

# uncomment from cluster 
cluster.name: my-application 

# uncomment from node
node.name

# uncomment from path
oath.data:

# uncomment from network
network.host

# http.port = 9200 just note that. 

# uncomment from discovery
cluster.initial_master_nodes: ["node-1"]

# uncomment from begin securty auto configuration
false in xpack.security (all four positions) 

# comment the cluster.initial_master_nodes: ["elk"]

# reload the daemon
sudo systemctl daemon-reload
sudo systemctl is-enabled elasticsearch
sudo systemctl enable --now elaseticsearch
sudo systemctl status elaseticsearch
```

Now move to the 

```bash
# to look for the methods
curl -X GET "localhost:9200/_cluster/health"
```

Four Elements. 

- **Index** - Equivalent to database or collection of documents.

- **Documents** - WHich are inside teh index

- **Shards** -  indices are divided into shards, whaich can be distriuted across multiple nodes

- **Replicas** - Shards will have replicas, which enable high availability and fault tolerance.

```bash
# initially no index is defined
curl -X GET "localhost:9200/_aliases?prety=true"

# now define index
curl -X PUT "localhost:9200/test-index1"

# define 
curl -X GET "localhost:9200/_aliases?pretty=true"

# we will now put a record
curl -X POST "localhost:9200/test-index1/_doc/1?pretty" -H 'Content-type: application/json' -d'
> (
> "name": "Gabber Singh",
> "age": 30,
> "occupation": "hacker"
> )
> '

curl -X GET "localhost:9200/test-index1/_doc/1?pretty=true"
```