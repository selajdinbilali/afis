#!/bin/bash

#-- add user
useradd -m -g users -s /bin/bash beorn
passwd beorn

#-- install sudo
pacman -Syu sudo --noconfirm
mv sudoers /etc/sudoers
cp -R /root/afis /home/beorn/afis
rm -R /root/afis
echo "relogin as beorn"
exit


#-- son
sudo pacman -S alsa-utils --noconfirm
amixer sset Master unmute

#-- base de xorg
sudo pacman -S xorg-server xorg-xinit xterm rxvt-unicode mesa --noconfirm

#-- drivers video
#$ lspci | grep VGA
# pacman -Ss xf86 | less
#trouver et installer les drivers nécessaire
sudo pacman -S xf86-video-vesa --noconfirm
# xf86-video-intel libva-intel-driver libva
#amd(ati) : xf86-video-ati mesa-vdpau

#-- xorg environnement
sudo pacman -S xorg-twm xorg-xclock --noconfirm
#startx

#-- copy xinitrc and edit from github

#-- environnement de bureau
sudo pacman -S i3 dmenu --noconfirm

#copy config of i3 in ~/.config/i3/config from github
