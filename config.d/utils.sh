#!/bin/bash

sudo pacman -Syu

# Installing NodeJS:
sudo pacman - S nodejs npm --noconfirm

# Installing pip & pipenv:
sudo pacman -S python-pip --noconfirm
pip install pipenv

# Installing Elixir & Erlang Virtual Machine:
sudo pacman -S elixir --noconfirm

# Installing Virtualbox:
sudo pacman -S virtualbox --noconfirm

# Installing Docker:
sudo tee /etc/modules-load.d/loop.conf <<< "loop"
sudo modprobe loop # if modprobe fails, reboot your system
sudo pacman -S docker --noconfirm
sudo systemctl start docker.service
sudo systemctl enable docker.service

# Installing VSCode:
cd ~/AUR
git clone https://AUR.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin/
makepkg -s
sudo pacman -U visual-studio-code-bin-*.pkg.tar.xz --noconfirm



# Installing Steam & Proton:
sudo pacman -S steam --noconfirm

# Installing discord:
sudo pacman -S discord --noconfirm


reboot
