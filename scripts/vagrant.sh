#!/usr/bin/env bash -eux

# Setup sudo to allow no-password sudo for "admin"
groupadd -r admin
usermod -a -G admin ubuntu
cp /etc/sudoers /etc/sudoers.orig

sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=sudo' /etc/sudoers
sed -i -e 's/%sudo\s\+ALL=(ALL:ALL) ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers

# Installing vagrant keys
mkdir -p /home/ubuntu/.ssh
chmod 700 /home/ubuntu/.ssh
cd /home/ubuntu/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
chmod 600 /home/ubuntu/.ssh/authorized_keys
chown -R ubuntu /home/ubuntu/.ssh

# Install the VirtualBox guest additions
sudo apt-get -y install linux-headers-$(uname -r) build-essential dkms nfs-common
VBOX_ISO="/home/ubuntu/VBoxGuestAdditions.iso"
mount -o loop "$VBOX_ISO" /mnt
yes|sh /mnt/VBoxLinuxAdditions.run
umount /mnt

#Cleanup VirtualBox
rm "$VBOX_ISO"
