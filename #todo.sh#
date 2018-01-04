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
    
#    -- install the system
pacstrap -i /mnt base base-devel
    
    
#    -- create a fstab
genfstab -U /mnt >> /mnt/etc/fstab

cp chroot.sh /mnt/chroot.sh
cp locale.gen /mnt/locale.gen
#    -- change root
arch-chroot /mnt /bin/bash
