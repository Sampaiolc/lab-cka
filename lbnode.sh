#!/bin/sh

### Install HAproxy and NFS Server ###
apt install -y haproxy nfs-kernel-server

### Configure and enable HAproxy ###
cp -b /vagrant/haproxy/haproxy.cfg /etc/haproxy/
systemctl start haproxy
systemctl enable haproxy


### Configure NFS server ###
mkdir /opt/vol
chmod a+rwt /opt/vol
printf 'hello' > /opt/vol/hello.txt
printf '/opt/vol *(rw,no_root_squash,async,no_subtree_check,insecure)\n' > /etc/exports
systemctl start nfs-kernel-server
systemctl enable nfs-kernel-server