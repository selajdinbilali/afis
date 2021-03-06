#!/bin/bash

#    -- hostname
printf "aragorn" >> /etc/hostname

#    -- time
ln -s /usr/share/zoneinfo/Europe/Zurich /etc/localtime
hwclock --systohc
    
#    -- locale (langue du sys)
mv locale.gen /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

#    -- bepo layout for the console
printf "KEYMAP=fr-bepo" >> /etc/vconsole.conf

    
    
#    -- initramfs
mkinitcpio -p linux
    
    
#    -- root passwd
echo "type the root password"
passwd
    
# wifi
pacman -S wpa_supplicant --noconfirm
pacman -S dialog --noconfirm

# grub and os-prober
pacman -S grub os-prober --noconfirm
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg


-- wired
INTERFACE=$(ip link | grep 2: | cut -d ":" -f 2 | cut -c 2-)
systemctl enable dhcpcd@$INTERFACE.service


printf "first part finished\nreboot, login as root\ninstall git, clone the repo, cd to it, launch 03script.sh"
exit

