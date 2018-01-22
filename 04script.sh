#!/bin/bash

#-- son
sudo pacman -S alsa-utils --noconfirm
amixer sset Master unmute

#-- base de xorg
sudo pacman -S xorg-server xorg-xinit xterm mesa --noconfirm

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
printf "setxkbmap fr bepo\nexec i3" > .xinitrc

#-- environnement de bureau
sudo pacman -S i3 dmenu termite emacs firefox-developer-edition --noconfirm

mkdir ~/.config/i3
cp i3/config ~/.config/i3/config



#copy config of i3 in ~/.config/i3/config from github
