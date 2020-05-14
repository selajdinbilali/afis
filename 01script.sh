#!/bin/bash    


 #   -- Update sys clock
timedatectl set-ntp true
    
# partitioning    
parted --script /dev/sda \
       mklabel gpt \
       mkpart primary 1MiB 500MiB \
       mkpart primary 500MiB 1500MiB \
       mkpart primary 1500MiB 100%
    
mkfs.fat -F32 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2
mkfs.ext4 /dev/sda3
#    -- mount
mount /dev/sda3 /mnt

mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

#    -- install the system
pacstrap /mnt base base-devel linux linux-firmware
    
    
#    -- create a fstab
genfstab -U /mnt >> /mnt/etc/fstab

#    -- change root
arch-chroot /mnt /bin/bash

ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
#    -- bepo layout for the console
printf "KEYMAP=fr-bepo" >> /etc/vconsole.conf
printf "aragorn" >> /etc/hostname

pacman -S networkmanager --no-confirm
systemctl enable NetworkManager
echo "type root passwd"
passwd


# efi version
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg

#-- wired
INTERFACE=$(ip link | grep 2: | cut -d ":" -f 2 | cut -c 2-)
systemctl enable dhcpcd@$INTERFACE.service

echo "add sudo user after reboot, and install desktop"
echo "type umount -a and reboot"
exit

