#!/bin/bash
apt-get update
apt-get -y install curl
chef_server_fqdn=$1
# create downloads directory
if [ ! -d /downloads ]; then
  mkdir /downloads
fi
# download the Chef Automate package
if [ ! -f /downloads/automate_1.8.38-1_amd64.deb ]; then
  echo "Downloading the Chef Automate package..."
  wget -nv -P /downloads https://packages.chef.io/files/stable/automate/1.8.38/ubuntu/16.04/automate_1.8.38-1_amd64.deb
fi
# install Chef Automate
if [ ! $(which automate-ctl) ]; then
  echo "Installing Chef Automate..."
  dpkg -i /downloads/automate_1.8.38-1_amd64.deb
  # run preflight check
  automate-ctl preflight-check
  # run setup
  automate-ctl setup --license /tmp/automate.license --key /tmp/chefadmin.pem --server-url https://$chef_server_fqdn/organizations/4thcoffee --fqdn $(hostname) --enterprise default --configure --no-build-node
  automate-ctl reconfigure
  # wait for all services to come online
  echo "Waiting for services..."
  until (curl --insecure -D - https://localhost/api/_status) | grep "200 OK"; do sleep 1m && automate-ctl restart; done
  while (curl --insecure https://localhost/api/_status) | grep "fail"; do sleep 15s; done
  # create an initial user
  echo "Creating chefadmin user..."
  automate-ctl create-user default chefadmin --password insecurepassword --roles "admin"
fi
echo "Your Chef Automate server is ready!"
