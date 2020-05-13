#!/bin/bash    


 #   -- Update sys clock
timedatectl set-ntp true
    
# partitioning    
parted --script /dev/sda \
       mklabel gpt \
       mkpart primary 1MiB 300MiB \
       mkpart primary 300MiB 1300MiB \
       mkpart primary 1300MiB 100%
    
mkfs.fat -F32 /dev/sda1
mkfs.swap /dev/sda2
mkfs.ext4 /dev/sda3
#    -- mount
mount /dev/sda3 /mnt
swapon /dev/sda2
    
#    -- install the system
pacstrap /mnt base base-devel
    
    
#    -- create a fstab
genfstab -U /mnt >> /mnt/etc/fstab

cp 02script.sh /mnt/02script.sh
cp locale.gen /mnt/locale.gen
#    -- change root
echo "you are in chroot launch 02script.sh to continue"
arch-chroot /mnt /bin/bash
