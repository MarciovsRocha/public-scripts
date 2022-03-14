#!/bin/bash
# se precisar instalar o debtap descomente a linha abaixo
#./install_debtap.sh
cd $STORAGE/deb_packages
sudo debtap PacketTracer_800_amd64_build212_final.deb
sudo pacman -U packettracer-8.0.0-1-x86_64.pkg.tar.zst