#!/bin/bash

#-- son
#sudo pacman -S alsa-utils --noconfirm
#amixer sset Master unmute

#-- base de xorg
sudo pacman -S xorg-server xorg-apps mesa --noconfirm
sudo pacman -S xf86-video-vmware--noconfirm



#-- environnement de bureau
sudo pacman -S i3 dmenu xfce4-terminal --noconfirm

# download dotfiles, install mkrc
# maybe create the folders


#-- create .xinitrc and edit from github
printf "setxkbmap fr bepo\nexec i3" > ~/.xinitrc
mkdir -p ~/.config/i3
cp i3/config ~/.config/i3/config

