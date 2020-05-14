#!/bin/bash


# efi version
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg

#-- wired
INTERFACE=$(ip link | grep 2: | cut -d ":" -f 2 | cut -c 2-)
systemctl enable dhcpcd@$INTERFACE.service

echo "type umount -a and reboot"
exit

