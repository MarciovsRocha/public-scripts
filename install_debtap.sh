#!/bin/bash
# install debtap
sudo pacman -S pkgfile
git clone https://aur.archlinux.org/debtap.git
cd debtap
mapepkg -si
cd ..
rm -r debtap