#!/bin/bash

#-- son
#sudo pacman -S alsa-utils --noconfirm
#amixer sset Master unmute

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



#-- environnement de bureau
sudo pacman -S i3 dmenu --noconfirm

# download dotfiles, install mkrc
# maybe create the folders


#-- copy xinitrc and edit from github
printf "setxkbmap fr bepo\nexec i3" > ~/.xinitrc
mkdir -p ~/.config/i3
cp i3/config ~/.config/i3/config
#mkdir ~/.config/termite
#cp termite/config ~/.config/termite/config
