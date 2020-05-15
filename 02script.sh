#!/bin/bash

#-- add user
useradd -m -g users -s /bin/bash beorn

echo "type your password"
passwd beorn

#-- install sudo
pacman -Syu sudo --noconfirm
usermod -aG wheel beorn
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

#-- base de xorg
pacman -S xorg-server xorg-apps mesa --noconfirm
pacman -S xf86-video-vmware --noconfirm



#-- environnement de bureau
pacman -S i3 dmenu xfce4-terminal --noconfirm


echo "setxkbmap fr bepo\nexec i3" > /home/beorn/.xinitrc
#-- create .xinitrc and edit from github
mkdir -p /home/beorn/.config/i3
cp i3/config ~/.config/i3/config
