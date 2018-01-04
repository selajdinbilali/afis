#!/bin/bash
# first and foremost
pacman -Sy git --noconfirm
git clone git@github.com:selajdinbilali/afis.git
cd afis
sh ./keyboardandfont.sh
mount -o remount,size=2G /run/archiso/cowspace
sh ./todo.sh
