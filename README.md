# AFIS : first and foremost
- loadkeys fr-bepo
- mount -o remount,size=2G /run/archiso/cowspace
- install git and clone the repo and go to folder
- pacman -Sy git
- git clone https://github.com/selajdinbilali/afis.git
- cd afis
- chmod +x *.sh
- ./01script.sh

# after reboot
- pacman -Sy git
- git clone https://github.com/selajdinbilali/afis.git
- cd afis
- chmod +x *.sh
- ./03script.sh
