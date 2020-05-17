#!/bin/bash

#-- add user
useradd -m -g users -s /bin/bash beorn

echo "type your password"
passwd beorn

#-- install sudo
pacman -Syu sudo --noconfirm
usermod -aG wheel beorn
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

pacman -S xorg-apps mesa xorg-xinit xf86-video-vmware xorg-server xterm mesa xf86-video-vesa xorg-twm xorg-xclock i3 dmenu emacs --noconfirm
