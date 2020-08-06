#!/usr/bin/env bash

#
# https://jasonmun.blogspot.my
# https://github.com/yomun
# 
# Copyright (C) 2017 Jason Mun
# 
# ---------------------------------------------------------------------------------
# Extras PPA Software
# [Sublime 3 + Plugins] http://jasonmun.blogspot.my/2017/03/sublime-text-3.html
# ---------------------------------------------------------------------------------
sudo add-apt-repository ppa:graphics-drivers/ppa -y                 # nvidia-415
sudo add-apt-repository ppa:alessandro-strada/ppa -y                # google-drive-ocamlfuse
sudo add-apt-repository ppa:gerardpuig/ppa -y                       # ubuntu-cleaner
sudo add-apt-repository ppa:linuxuprising/java -y                   # java
sudo add-apt-repository ppa:uget-team/ppa -y                        # uGet
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y  # qBittorent
sudo add-apt-repository ppa:linrunner/tlp -y                        # tlp tlp-rdw
# sudo add-apt-repository ppa:teejee2008/ppa -y                     # aptik, diskman, ukuu
# sudo add-apt-repository ppa:apandada1/brightness-controller -y    # brightness-controller
# sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y  # grub-customizer
# sudo add-apt-repository ppa:noobslab/apps -y                    　# xdman downloader
# sudo add-apt-repository ppa:notepadqq-team/notepadqq -y         　# notepadqq
# sudo add-apt-repository ppa:ppsspp/stable -y                      # ppsspp
# sudo add-apt-repository ppa:ubuntuhandbook1/apps -y               # converseen
# sudo add-apt-repository ppa:dhor/myway -y                         # easyimagesizer
# sudo add-apt-repository ppa:ravefinity-project/ppa -y             # vivacious-colors
# sudo add-apt-repository ppa:xuzhen666/gnome-mpv -y                # gnome-mpv
# sudo add-apt-repository ppa:rvm/smplayer -y                       # SMplayer
# sudo add-apt-repository ppa:slytomcat/ppa -y                      # yd-tools
sudo add-apt-repository ppa:wireshark-dev/stable -y                 # wireshark
sudo add-apt-repository ppa:nilarimogard/webupd8 -y                 # youtube-dlg / gnome-twitch

# wget -q -O - http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc | sudo apt-key add -
# sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian artful contrib" >> /etc/apt/sources.list.d/virtualbox.org.list' 

# wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
# sudo apt-add-repository "deb https://download.sublimetext.com/ apt/stable/"
# sudo apt install sublime-text

# Xenial/16.04
# Yakkety/16.10
# Zesty/17.04
# Artful/17.10
# Bionic/18.04
# Cosmic/18.10
# Disco/19.04
# Eoan/19.10
# Focal/20.04

# ucaresystem-core (12.04 / 14.04 / 15.04 - 18.04)
sudo add-apt-repository ppa:utappia/stable -y
# sudo sed -i 's/artful/yakkety/g' /etc/apt/sources.list.d/utappia-ubuntu-stable-artful.list
# sudo sed -i 's/zesty/yakkety/g' /etc/apt/sources.list.d/utappia-ubuntu-stable-zesty.list
sudo apt update
sudo apt install ucaresystem-core -y

sudo apt install ubuntu-cleaner -y                  # 14.04 / 16.04 - 18.04
# sudo apt install nvidia-415 -y
# sudo apt install oracle-java8-installer -y
sudo apt install oracle-java14-set-default
sudo apt install uget uget-integrator aria2 -y      # 12.04 - 18.04
sudo apt install qbittorrent -y                     # 18.04

sudo apt install google-drive-ocamlfuse -y          # 18.04

# sudo apt install aptik -y                         # 12.04 / 14.04 - 17.10
# sudo apt install brightness-controller -y         # 12.04 / 14.04 / 15.04 - 17.10
# sudo apt install grub-customizer -y               # 12.04 - 14.10 / 16.04 / 17.10
# sudo apt install xdman-downloader -y              # 12.04 / 14.04 / 16.04 - 17.04
# sudo apt install notepadqq notepadqq-gtk -y       # 14.04 - 17.10
# sudo apt install ppsspp -y                        # 14.04 / 15.04 - 17.10
# sudo apt install indicator-diskman -y             # 14.04 / 15.04 - 17.10
# sudo apt install ukuu -y                          # 14.04 / 15.04 - 17.10

# sudo apt install converseen -y                    # 16.04 / 20.04

# sudo apt install vivacious-colors -y
# sudo apt install vivacious-folder-colors-addon -y

# sudo apt install gnome-mpv -y; sudo apt remove totem totem-common -y   # 14.10 - 17.10
# sudo apt install smplayer smplayer-themes smplayer-skins               # 18.04

sudo apt install wireshark -y                                            # 12.04 / 14.04 - 18.04
sudo apt install youtube-dlg -y                                          # 12.04 / 14.04 / 15.04 - 18.04
# sudo apt install yd-tools -y

# https://www.virtualbox.org/wiki/Linux_Downloads
# https://download.virtualbox.org/virtualbox/6.1.12/virtualbox-6.1_6.1.12-139181~Ubuntu~eoan_amd64.deb
# https://download.virtualbox.org/virtualbox/6.1.12/Oracle_VM_VirtualBox_Extension_Pack-6.1.12.vbox-extpack
# FILE=`curl https://www.virtualbox.org/wiki/Downloads | grep .vbox-extpack | grep -Eo "(href=\")[a-zA-Z0-9.:/?&=_-]*" | sed "s/href=\"//g" | head -n1`
# wget ${FILE}
# sudo apt install virtualbox-5.2 -y
sudo apt install virtualbox -y

sudo apt install tlp tlp-rdw -y
sudo tlp start
