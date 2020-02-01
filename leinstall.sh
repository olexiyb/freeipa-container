#!/bin/bash
set -x
set -o

cd /root
wget https://letsencrypt.org/certs/isrgrootx1.pem
wget https://letsencrypt.org/certs/letsencryptauthorityx3.pem
ipa-cacert-manage install isrgrootx1.pem -n ISRGRootCAX1 -t C,,
ipa-cacert-manage install letsencryptauthorityx3.pem -n ISRGRootCAX3 -t C,,
kinit admin
ipa-certupdate
