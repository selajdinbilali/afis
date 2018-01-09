# AFIS : first and foremost
- loadkeys fr-bepo
- mount -o remount,size=2G /run/archiso/cowspace
- install git and clone the repo and go to folder
- pacman -S git
- git clone https://github.com/selajdinbilali/afis.git
- cd afis
- sh ./01script.sh

# after reboot
- pacman -S git
- git clone https://github.com/selajdinbilali/afis.git
- cd afis
- sh ./03script.sh
