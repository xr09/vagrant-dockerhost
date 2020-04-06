#!/bin/bash

apt update
apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
apt purge -y unattended-upgrades postfix memcached
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt update
apt install -y docker-ce
usermod -aG docker vagrant
sed -i 's#^ExecStart.*#ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:2376 -H fd:// --containerd=/run/containerd/containerd.sock#' /lib/systemd/system/docker.service
systemctl daemon-reload
systemctl restart docker
echo "vm.max_map_count=262144" >> /etc/sysctl.conf 
sysctl -p
