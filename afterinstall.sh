#!/bin/bash

#-- add user
useradd -m -g users -s /bin/bash beorn
passwd beorn

#-- install sudo
pacman -Syu
pacman -S sudo
mv sudoers /etc/sudoers
# EDITOR=nano visudo // copier coller root à user privilege spec et mettre beorn
# exit

#$ login:beorn

#-- son
pacman -S alsa-utils
#-- unmuter les canaux avec M
#-- Esc pour sortir
#$ speaker-test -c 2
#-- CTRL-C pour stopper

#-- base de xorg
pacman -S xorg-server xorg-xinit xorg-server-utils mesa

#-- drivers video
#$ lspci | grep VGA
# pacman -Ss xf86 | less
#trouver et installer les drivers nécessaire
pacman -S xf86-video-vesa xf86-video-intel libva-intel-driver and libva
#amd(ati) : xf86-video-ati mesa-vdpau

#-- xorg environnement
pacman -S xorg-twm xorg-xclock xterm
#startx

#-- copy xinitrc and edit from github

#-- environnement de bureau
pacman -S i3 dmenu

#copy config of i3 in ~/.config/i3/config from github

#-- basic system things to add
#- fonts
#- yaourt for aur packages
#- emacs
#- firefox
#- xfce4-terminal
#- thunar
#- vlc
#- torrent client
#- libre-offfice
#- git
