#!/bin/bash
set -x
set -o

cd /var/lib/ipa-data/root
wget https://letsencrypt.org/certs/isrgrootx1.pem
wget https://letsencrypt.org/certs/letsencryptauthorityx3.pem
docker exec freeipa-server ipa-cacert-manage install /data/root/isrgrootx1.pem -n ISRGRootCAX1 -t C,,
docker exec freeipa-server ipa-cacert-manage install /data/root/letsencryptauthorityx3.pem -n ISRGRootCAX3 -t C,,
docker exec -ti freeipa-server bash -c "kinit admin && ipa-certupdate"
