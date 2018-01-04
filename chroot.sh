#!/bin/bash


sh ./chroot.sh

#    -- time
ln -s /usr/share/zoneinfo/Europe/Zurich /etc/localtime
hwclock --systohc
    
#    -- locale (langue du sys)
mv locale.gen /etc/locale.gen
#printf "en_US.UTF8 UTF-8" >> /etc/locale.gen
locale-gen
    
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
    
#    -- bepo layout for the console
printf "KEYMAP=fr-bepo\nFONT=sun12x22" >> /etc/vconsole.conf
    
#    -- hostname
printf "aragorn" >> /etc/hostname
    
    
#    -- initramfs
mkinitcpio -p linux
    
    
#    -- root passwd
echo "type the root password"
passwd
    
    
# grub and os-prober
pacman -S grub os-prober
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
    
exit

