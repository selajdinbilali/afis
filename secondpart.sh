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
