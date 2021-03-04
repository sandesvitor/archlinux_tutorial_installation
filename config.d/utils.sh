#!/bin/bash


read -p "Reboot after installation? (Y/n) " ANWSER


# Create AUR dir in user homepage if not exists:
# (AUR stands for "Arch User Repository")
echo "Trying to create AUR directory for storing cloned community repositories..."
cd ~
[ -d AUR ] && echo "Directory alread exists!" || mkdir AUR


# Patch sudo to version 1.9.5p2 to avoid CVE-2021-3156 
# buffer overflow exploit!
sudo pacman -Syu
sudo pacman -S wget --noconfirm
cd /tmp
wget "https://www.sudo.ws/dist/sudo-1.9.5p2.tar.gz"
tar xvzf sudo-1.9.5p2.tar.gz 
cd sudo-1.9.5p2/  
./configure
make && sudo make install 

# Installing postgresql:
sudo pacman -Sy postgresql --noconfirm
sudo mkdir /var/lib/postgres/data
sudo chown postgres /var/lib/postgres/data
sudo su postgres -c "initdb -D '/var/lib/postgres/data'; exit"
sudo systemctl start postgresql.service
sudo systemctl enable postgresql.service


# Installing NodeJS:
sudo pacman - Sy nodejs npm --noconfirm

# Installing pip & pipenv:
sudo pacman -Sy python-pip --noconfirm
pip install pipenv

# Installing Elixir & Erlang Virtual Machine:
sudo pacman -Sy elixir --noconfirm

# Installing Virtualbox:
sudo pacman -Sy virtualbox --noconfirm

# Installing Docker:
sudo tee /etc/modules-load.d/loop.conf <<< "loop"
sudo modprobe loop # if modprobe fails, reboot your system
sudo pacman -Sy docker --noconfirm
sudo systemctl start docker.service
sudo systemctl enable docker.service

# Installing VSCode:
cd ~/AUR
git clone https://AUR.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin/
makepkg -s
sudo pacman -U visual-studio-code-bin-* --noconfirm

# Installing AWS-CLI (Version 2):
cd /tmp
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Installing Terraform:
sudo pacman -Sy terraform --noconfirm

# Installing Ansible:
sudo pacman -Sy ansible --noconfirm

# Installing Steam & Proton:
sudo pacman -Sy steam --noconfirm

# Installing discord:
sudo pacman -Sy discord --noconfirm


if [[ $ANWSER == "Y" ]]; then
    echo "Rebooting..."
    reboot
else
    echo "Installation completed!"
    echo "Reboot later!"
    exit 0
fi