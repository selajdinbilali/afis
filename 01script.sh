#!/bin/bash    
#    -- if no ping (troubleshoot)
#    -- WIRED
    # systemctl stop dhcpcd@<TAB>
    
 #   -- WIFI
 #   -- take the NAME given by iw dev or ip link
    # iw dev
    # ip link set NAME up
 #   wifi-menu NAME
 #   -- if doesnt work try this
    # iw dev NOM scan | grep SSID
    # wpa_supplicant -B -i NOM -c <(wpa-passphrase "ssid" "psk")
    # dhcpcd NOM

 #   -- Update sys clock
timedatectl set-ntp true
    
# partitioning    
parted --script /dev/sda \
       mklabel msdos \
       mkpart primary ext4 1MiB 100% \
       set 1 boot on
    
mkfs.ext4 /dev/sda1    
#    -- mount
mount /dev/sda1 /mnt

#cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
#sed -s 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup
#rankmirrors -n 10 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist

    
#    -- install the system
pacstrap /mnt base base-devel
    
    
#    -- create a fstab
genfstab -U /mnt >> /mnt/etc/fstab

cp 02script.sh /mnt/02script.sh
cp locale.gen /mnt/locale.gen
#    -- change root
echo "you are in chroot launch 02script.sh to continue"
arch-chroot /mnt /bin/bash
