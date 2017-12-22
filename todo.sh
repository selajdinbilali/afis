    
    -- if no ping (troubleshoot)
    -- WIRED
    # systemctl stop dhcpcd@<TAB>
    
    -- WIFI
    -- take the NAME given by iw dev or ip link
    # iw dev
    # ip link set NAME up
    wifi-menu NAME
    -- if doesnt work try this
    # iw dev NOM scan | grep SSID
    # wpa_supplicant -B -i NOM -c <(wpa-passphrase "ssid" "psk")
    # dhcpcd NOM
    
    
    -- Update sys clock
    # timedatectl set-ntp true
    
    -- partitioning
    -- list the disks
    # lsblk 
    ou
    # fdisk -l 
    -- aller sur le disque voulu /dev/sda ici sda1 = root sda2 = home sda3 = swap 
    # cfdisk /dev/sda
    -- choisir msdos
    -- swap, root, home
    -- une partition root avec bootable
    -- une home et une swap
    
    
    # mkfs.ext4 /dev/sda1,2 //formatage
    # mkswap /dev/sda3
    # swapon /dev/sda3
    # swapon -s //verif
    
    
    -- mount
    # mount /dev/sda1 /mnt // le root
    # mkdir /mnt/home
    # mount /dev/sda2 /mnt/home
    
    -- install the system
    # pacstrap -i /mnt base base-devel
    
    
    -- create a fstab
    # genfstab -U /mnt >> /mnt/etc/fstab
    # nano /mnt/etc/fstab // si ssd ajouter discard aux options
    
    -- change root
    # arch-chroot /mnt /bin/bash
    
    -- time
    # tzselect
    # ln -s /usr/share/zoneinfo/Zone/SubZone /etc/localtime
    # hwclock --systohc
    
    -- locale (langue du sys)
    # nano /etc/locale.gen // décommenter utf de la langue choisie
    # locale-gen
    
    -------------------------
    # nano /etc/locale.conf
    -------------------------
    LANG=en_US.UTF-8
    -------------------------
    
    -- bepo layout for the console
    # nano /etc/vconsole.conf
    KEYMAP=fr-bepo
    FONT=sun12x22
    
    ------------
    myhostname
    ------------
    
    -- hostname
    # nano /etc/hostname
    
    
    -- initramfs
    # mkinitcpio -p linux
    
    
    -- root passwd
    # passwd
    
    
    -- grub and os-prober
    # pacman -S grub os-prober
    # grub-install --target=i386-pc /dev/sda
    # grub-mkconfig -o /boot/grub/grub.cfg
    
    
    -- wired
    # systemctl enable dhcpcd@interface.service
    
    -- wifi for after
    # pacman -S iw wpa_supplicant dialog
    
    -- exit chroot
    # exit
    
    -- umount and reboot
    # umount -R /mnt
    # reboot
    
    # login : root
    
    -- add user
    # useradd -m -g users -s /bin/bash beorn
    # passwd beorn
    
    -- install sudo
    # pacman -Syu
    # pacman -S sudo
    # EDITOR=nano visudo // copier coller root à user privilege spec et mettre beorn
    # exit
    
    $ login:beorn
    
    -- son
    $ sudo pacman -S alsa-utils
    -- unmuter les canaux avec M
    -- Esc pour sortir
    $ speaker-test -c 2
    -- CTRL-C pour stopper
    
    -- base de xorg
    $ sudo pacman -S xorg-server xorg-xinit xorg-server-utils mesa
    
    -- drivers video
    $ lspci | grep VGA
    $ pacman -Ss xf86 | less
    trouver et installer les drivers nécessaire
    $ sudo pacman -S xf86-video-vesa
    intel : xf86-video-intel
    intel : libva-intel-driver and libva
    amd(ati) : xf86-video-ati mesa-vdpau
    
    -- xorg environnement
    $ sudo pacman -S xorg-twm xorg-xclock xterm
    $ startx
    
    -- copy xinitrc and edit
    
    -- environnement de bureau
    $ sudo pacman -S i3 dmenu
    
    -- copy config of i3 in ~/.config/i3/config
    
    -- basic system things to add
    - yaourt for aur packages
    - emacs
    - firefox
    - xfce4-terminal
    - thunar
    - vlc
    - torrent client
    - libre-offfice
    - git
