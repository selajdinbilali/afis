#!/bin/bash
pacman -Sy git
git clone https://github.com/selajdlinbilali/afis.git
cd afis


#!/bin/bash


#-- add user
useradd -m -g users -s /bin/bash beorn
passwd beorn

#-- install sudo
pacman -Syu
pacman -S sudo
mv sudoers /etc/sudoers

echo "exti root, login as beorn and ..."
echo "launch afterinstall.sh"
