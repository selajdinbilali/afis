#!/bin/bash    


ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
#    -- bepo layout for the console
printf "KEYMAP=fr-bepo" >> /etc/vconsole.conf
printf "aragorn" >> /etc/hostname

pacman -S networkmanager --noconfirm
systemctl enable NetworkManager
echo "type root passwd"
passwd


# efi version
pacman -S grub efibootmgr --noconfirm
grub-install --target=x86_64-efi --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg


echo "add sudo user after reboot, and install desktop"
echo "type umount -a and reboot"
