#!/bin/bash



#-- son
sudo pacman -S alsa-utils
amixer sset Master unmute
#-- unmuter les canaux avec M
#-- Esc pour sortir
#$ speaker-test -c 2
#-- CTRL-C pour stopper

#-- base de xorg
sudo pacman -S xorg-server xorg-xinit mesa

#-- drivers video
#$ lspci | grep VGA
# pacman -Ss xf86 | less
#trouver et installer les drivers nécessaire
sudo pacman -S xf86-video-vesa xf86-video-intel libva-intel-driver and libva
#amd(ati) : xf86-video-ati mesa-vdpau

#-- xorg environnement
sudo pacman -S xorg-twm xorg-xclock xfce4-terminal
#startx

#-- copy xinitrc and edit from github

#-- environnement de bureau
sudo pacman -S i3 dmenu

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
