#!/bin/bash

sudo pacman -S xorg-apps mesa xorg-xinit xf86-video-vmware xorg-server xterm mesa xf86-video-vesa xorg-twm xorg-xclock i3 dmenu emacs chromium nano --noconfirm

#-- create .xinitrc and edit from github
printf "setxkbmap fr bepo\nexec i3" > ~/.xinitrc
mkdir -p ~/.config/i3
cp i3/config ~/.config/i3/config

startx

