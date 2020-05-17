#!/bin/bash

#-- add user
useradd -m -g users -s /bin/bash beorn

echo "type your password"
passwd beorn

#-- install sudo
pacman -Syu sudo --noconfirm
usermod -aG wheel beorn
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
