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

# copy the second script
cp archchroot.sh /mnt/archchroot.sh


# change root
arch-chroot /mnt ./archchroot.sh

exit

