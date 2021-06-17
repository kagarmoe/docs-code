#!/bin/bash
echo "Preparing node..."
# ensure the time is up to date
apt-get update
apt-get -y install ntp
service ntp stop
ntpdate -s time.nist.gov
service ntp start
echo "10.1.1.33 chef-server.test" | tee -a /etc/hosts
echo "10.1.1.35 chef-automate.test" | tee -a /etc/hosts
echo "10.1.1.34 node1-ubuntu.test" | tee -a /etc/hosts
EOF
