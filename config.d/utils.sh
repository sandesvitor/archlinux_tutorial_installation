#!/bin/bash


read -p "Reboot after installation? (Y/n) " ANWSER


# Create AUR dir in user homepage if not exists:
# (AUR stands for "Arch User Repository")
echo "Trying to create AUR directory for storing cloned community repositories..."
cd ~
[ -d AUR ] && echo "Directory alread exists!" || mkdir AUR


#################################################################
######################   Security   #############################

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

# Installing net-tools:
sudo pacman -S net-tools --noconfirm

# Installing arch-audit:
sudo pacman -S arch-audit --noconfirm

# Installing timeshift:
cd ~/AUR
git clone https://aur.archlinux.org/timeshift.git
cd timeshift/
makepkg -sri --noconfirm 

# Installing clamav (Antivirus):
sudo pacman -S clamav --noconfirm
sudo freshclam # to update virus definition
sudo systemctl start clamav-freshclam.service
sudo systemctl enable clamav-freshclam.service
sudo systemctl start clamav-daemon.service
sudo systemctl enable clamav-daemon.service
sudo pacman -S clamtk --noconfirm # ===> GUI for CLAMAV!

# Installing Firewalld:
sudo pacman -S firewalld --noconfirm
sudo systemctl start firewalld.service
sudo systemctl enable firewalld.service


#################################################################
######################   Utility    #############################

# Installing postgresql:
sudo pacman -S postgresql --noconfirm
sudo mkdir /var/lib/postgres/data
sudo chown postgres /var/lib/postgres/data
sudo su postgres -c "initdb -D '/var/lib/postgres/data'; exit"
sudo systemctl start postgresql.service
sudo systemctl enable postgresql.service


# Installing NodeJS:
sudo pacman - S nodejs npm --noconfirm

# Installing pip & pipenv:
sudo pacman -S python-pip --noconfirm
sudo pip install pipenv

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
makepkg -s --noconfirm
sudo pacman -U visual-studio-code-bin-* --noconfirm

# Installing AWS-CLI (Version 2):
cd /tmp
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Installing Terraform:
sudo pacman -S terraform --noconfirm

# Installing Ansible:
sudo pacman -S ansible --noconfirm

# Installing Flameshot:
sudo pacman -S flameshot --noconfirm

#################################################################
########################   Fun!   ###############################

# Installing Steam:
sudo pacman -S steam --noconfirm

# Installing discord:
sudo pacman -S discord --noconfirm

# Installing obs-studio:
sudo pacman -S obs-studio --noconfirm


#################################################################
################## Initial Security Analysis ####################
cd ~
echo "<<<<<<<<<<<<<<<<<<<< INITIAL SECURITY ANALYSIS >>>>>>>>>>>>>>>>>>>>" >> security_analysis.txt
echo "" >> security_analysis.txt
echo "" >> security_analysis.txt
echo "Ports scan with 'sudo netstat -tulpn'" >> security_analysis.txt
echo "" >> security_analysis.txt
sudo netstat -tulpn >> security_analysis.txt
echo "" >> security_analysis.txt
echo "Dependencies vulnerabilyties with arch-audit:" >> security_analysis.txt
echo "" >> security_analysis.txt
arch-audit >> security_analysis.txt




if [[ $ANWSER == "Y" ]]; then
    echo "Rebooting..."
    reboot
else
    echo "Installation completed!"
    echo "Reboot later!"
    exit 0
fi
