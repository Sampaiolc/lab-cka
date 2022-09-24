#!/bin/sh

### Setup Hosts File ###
cat <<-EOF >>/etc/hosts
192.168.60.200 lbnode
192.168.60.201 kubemaster01
192.168.60.202 kubemaster02
192.168.60.203 kubemaster03
192.168.60.204 kubework01
192.168.60.205 kubework02
EOF

### Configure SSH ###
printf '\nPermitRootLogin yes\n' >> /etc/ssh/sshd_config
printf '\nStrictHostKeyChecking no\n' >>/etc/ssh/ssh_config
systemctl restart sshd


### Create and Configure Root ###
cp /vagrant/key_rsa /root/.ssh
cp /vagrant/key_rsa.pub /root/.ssh/authorized_keys
chmod 0600 /root/.ssh/*

### Create and Configure User ###
useradd user -m -p 'jZPxWQUCyuNKpYlxGcO' -s /bin/bash
mkdir -p /home/user/.ssh
cp /vagrant/key_rsa /home/user/.ssh/
cp /vagrant/key_rsa.pub /home/user/.ssh/authorized_keys
chmod 0644 /home/user/.ssh/authorized_keys
printf 'user ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/user
chmod 440 /etc/sudoers.d/user

# Import key and add k8s apt repo
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add


### Disable Swap Memory ###
swapoff -a

### Update and Upgrade ###
apt-get update
apt-get upgrade -y
apt-get install -y nfs-common