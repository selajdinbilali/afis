#!/bin/bash

#-- add user
useradd -m -g users -s /bin/bash beorn
passwd beorn

#-- install sudo
pacman -Syu sudo --noconfirm
mv sudoers /etc/sudoers
cp -R /root/afis /home/beorn/afis
rm -R /root/afis
echo "relogin as beorn an launch 04script.sh"
exit
