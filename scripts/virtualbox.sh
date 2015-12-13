#!/bin/bash

#set -o errexit #This always caused a failure. Not sure why?

apt-get install -y build-essential linux-headers-`uname -r` dkms

# Installing the virtualbox guest additions
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
cd /tmp
umount /mnt || true
mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
ln -s /opt/VBoxGuestAdditions-*/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
restart lightdm
umount /mnt
rm -rf /home/vagrant/VBoxGuestAdditions_*.iso
