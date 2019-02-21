#!/usr/bin/env bash

#
# https://jasonmun.blogspot.my
# https://github.com/yomun
# 
# Copyright (C) 2017 Jason Mun
# 
# ---------------------------------------------------------------------------------
# Install Software
# http://jasonmun.blogspot.my/2017/03/ubuntu-speed.html
# 
# [Selek TOR] http://jasonmun.blogspot.my/2017/03/linux-selektor.html
# [Tuxcut]    http://jasonmun.blogspot.my/2017/04/ubuntu-tuxcut-linux.html
# ---------------------------------------------------------------------------------
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

sudo apt install ubuntu-restricted-extras -y
sudo apt install build-essential python3-software-properties -y
sudo apt install libcanberra-gtk-module -y

sudo apt install p7zip p7zip-full p7zip-rar rar

sudo apt install chrome-gnome-shell -y
sudo apt install gdebi -y
sudo apt install make git -y
sudo apt install gtkorphan -y
sudo apt install gufw -y
sudo apt install meld -y
# sudo apt install menulibre -y
# sudo apt install remmina -y
sudo apt install seahorse -y
sudo apt install wget -y
sudo apt install gcc cpp -y
sudo apt install gnome-tweak-tool -y
sudo apt install indicator-cpufreq -y

# sudo apt install amule -y
# sudo apt install bleachbit -y
# sudo apt install gimp -y
# sudo apt install gnome-twitch -y
# sudo apt install leafpad -y
# sudo apt install nautilus-dropbox -y
# sudo apt install openshot -y
# sudo apt install pinta -y
# sudo apt install qbittorrent -y
# sudo apt install simplescreenrecorder -y
# sudo apt install shotwell -y
# sudo apt install steam -y
# sudo apt install testdisk -y
# sudo apt install vlc -y
# sudo apt install yandex-disk -y

# Gnome Shell Extensions - System-Monitor
sudo apt install gir1.2-gtop-2.0 gir1.2-networkmanager-1.0 -y

# OpenVPN
sudo apt install openvpn network-manager-openvpn network-manager-openvpn-gnome curl bc -y

# Clamav
# sudo apt install clamav clamtk clamav-daemon libclamunrar7 -y

# GNOME - Chinese
sudo apt install language-pack-zh-hans language-pack-zh-hans-base -y
sudo apt install language-pack-gnome-zh-hans language-pack-gnome-zh-hans-base -y
# sudo localectl set-locale LANG=zh_CN.UTF-8
# sudo apt install chinese-calendar -y

# -------------------------------------------------------------------------------------------
# Google Chrome
# https://github.com/yomun/chrome-gpu
# -------------------------------------------------------------------------------------------
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt install -f -y

# -------------------------------------------------------------------------------------------
# Skype 64
# https://www.skype.com/en/download-skype/skype-for-computer/
# -------------------------------------------------------------------------------------------
wget https://repo.skype.com/latest/skypeforlinux-64.deb
sudo dpkg -i skypeforlinux-64.deb

# -------------------------------------------------------------------------------------------
# Rambox
# https://github.com/ramboxapp/community-edition/releases
# -------------------------------------------------------------------------------------------
LINK=`curl https://github.com/ramboxapp/community-edition/releases | grep '\-amd64.deb' | head -n1 | sed "s/^.*href=\"//g" | sed "s/\-amd64.deb.*/\-amd64.deb/g"`
wget https://github.com${LINK}
FILE=`echo "${LINK}" | sed 's:.*/::'`
if [ -f "${FILE}" ]
then
	sudo dpkg -i ${FILE}
fi

# -------------------------------------------------------------------------------------------
# OpenDrive
# https://github.com/liberodark/ODrive/releases
# -------------------------------------------------------------------------------------------
LINK=`curl https://github.com/liberodark/ODrive/releases | grep '_amd64.deb' | head -n1 | sed "s/^.*href=\"//g" | sed "s/_amd64.deb.*/_amd64.deb/g"`
wget https://github.com${LINK}
FILE=`echo "${LINK}" | sed 's:.*/::'`
if [ -f "${FILE}" ]
then
	sudo dpkg -i ${FILE}
fi

# -------------------------------------------------------------------------------------------
# Stacer
# https://github.com/oguzhaninan/Stacer/releases
# -------------------------------------------------------------------------------------------
LINK=`curl https://github.com/oguzhaninan/Stacer/releases | grep '_amd64.deb' | head -n1 | sed "s/^.*href=\"//g" | sed "s/_amd64.deb.*/_amd64.deb/g"`
wget https://github.com${LINK}
FILE=`echo "${LINK}" | sed "s/^.*\/stacer_/stacer_/g"`
if [ -f "${FILE}" ]
then
	sudo dpkg -i ${FILE}
fi

# -------------------------------------------------------------------------------------------
# VMware
# http://jasonmun.blogspot.my/2013/06/ubuntu-vmware.html
# http://jasonmun.blogspot.my/2016/05/vmware-vmware-tools.html
# http://jasonmun.blogspot.my/2016/08/vmware-hgfs.html
# -------------------------------------------------------------------------------------------
# https://softwareupdate.vmware.com/cds/vmw-desktop/ws/
# wget -O VMware-Workstation-Full-14.1.0-7370693.x86_64.bundle https://www.vmware.com/go/getworkstation-linux
# tar -xvf VMware-Workstation-*.x86_64.bundle.tar
# chmod +x VMware-Workstation-*.x86_64.bundle
# sudo ./VMware-Workstation-*.x86_64.bundle

# -------------------------------------------------------------------------------------------
# Eclipse
# http://jasonmun.blogspot.my/2015/08/ubuntu-eclipse-netbeans.html
# -------------------------------------------------------------------------------------------
# LINK=`curl http://www.eclipse.org/downloads/eclipse-packages/?osType=linux | grep -Eo "(download.php)[a-zA-Z0-9./?&=_-]*" | grep linux-gtk-x86_64.tar.gz | head -n1`
# wget http://www.eclipse.org/downloads/${LINK}

# -------------------------------------------------------------------------------------------
# NetBeans
# https://netbeans.org/downloads/
# -------------------------------------------------------------------------------------------
# VER=`curl https://netbeans.org/features/index.html | grep "New in NetBeans " | sed "s/.*New in NetBeans //g" | sed 's/<[^>]*>//g'
# wget http://download.netbeans.org/netbeans/${VER}/final/bundles/netbeans-${VER}-linux.sh
# chmod u+x netbeans-8.2-linux.sh
# ./netbeans-8.2-linux.sh

# -------------------------------------------------------------------------------------------
# FoxIt PDF Reader
# https://www.foxitsoftware.com/downloads/
# -------------------------------------------------------------------------------------------
# VER=`curl http://cdn01.foxitsoftware.com/pub/foxit/reader/desktop/linux/2.x/ | sed 's/<[^>]*>//g' | sed '/^\s*$/d' | tail -n1 | sed "s/\/.*//g"`
# FILE=`curl http://cdn01.foxitsoftware.com/pub/foxit/reader/desktop/linux/2.x/${VER}/en_us/ | sed 's/<[^>]*>//g' | grep .run | sed "s/.tar.gz.*//g" | tail -n1`
# wget http://cdn01.foxitsoftware.com/pub/foxit/reader/desktop/linux/2.x/${VER}/en_us/${FILE}.tar.gz
# tar zxvf ${FILE}.tar.gz
# sudo ./FoxitReader.enu.setup.${VER}.*.x86.run
# sudo apt remove evince

# -------------------------------------------------------------------------------------------
# Maldetect
# http://jasonmun.blogspot.my/2017/09/linux-maldetect-malware.html
# -------------------------------------------------------------------------------------------
# wget http://www.rfxn.com/downloads/maldetect-current.tar.gz
# tar -zxvf maldetect-current.tar.gz
# cd maldetect-*
# sudo ./install.sh

# -------------------------------------------------------------------------------------------
# Teamviewer 13 (64)
# https://www.teamviewer.com/en/download/linux/
# -------------------------------------------------------------------------------------------
# LINK=`curl https://www.teamviewer.com/en/download/linux/ | grep teamviewer_amd64.deb | head -n1 | sed 's/^.*<a class="linkBlue" href="//g' | sed 's/.deb.*/.deb/g'`
# FILE_NAME=`echo ${LINK} | sed 's/^.*\/teamviewer_/teamviewer_/g'`
# wget ${LINK}
# sudo dpkg -i ${FILE_NAME}
# rm -rf ${FILE_NAME}

# -------------------------------------------------------------------------------------------
# Viber
# https://www.viber.com/products/linux/
# -------------------------------------------------------------------------------------------
# wget http://download.cdn.viber.com/cdn/desktop/Linux/viber.deb
# sudo dpkg -i viber.deb

# -------------------------------------------------------------------------------------------
# FileZilla
# https://filezilla-project.org/download.php?type=client
# -------------------------------------------------------------------------------------------
# LINK=`curl https://filezilla-project.org/download.php?platform=linux | grep tar.bz2 | grep -Eo "(href=\")[a-zA-Z0-9.:/?&=_-]*" | sed "s/href=\"//g" | head -n1`
# FILE=`echo ${LINK} | sed "s/.*FileZilla_/FileZilla_/g" | sed "s/\/download//g"`
# wget -O ${FILE} ${LINK}
# tar -jxf ${FILE}

# -------------------------------------------------------------------------------------------
# PlayStation 模拟器
# http://www.epsxe.com/download.php
# -------------------------------------------------------------------------------------------
# http://www.epsxe.com/files/ePSXe205linux_x64.zip
# LINK=`curl http://www.epsxe.com/download.php | grep -Eo "(href=\")[a-zA-Z0-9.:/?&=_-]*" | grep -E "(ePSXe)*(linux_x64.zip)" | sed "s/href=\"//g" | head -n1`
# wget ${LINK}

# -------------------------------------------------------------------------------------------
# United-GNOME
# http://jasonmun.blogspot.my/2017/08/themes-united-gnome.html
# -------------------------------------------------------------------------------------------
# LINKS=`curl https://github.com/godlyranchdressing/United-GNOME/releases | grep -Eo "(href=\")[a-zA-Z0-9./?&=_-]*" | grep United-Ubuntu-alt | sed "s/href=\"//g" | head -n2 | tr "\n" " "`
# for i in ${LINKS}
# do
#	wget https://github.com/${i}
# done

# -------------------------------------------------------------------------------------------
# Messenger for Desktop (Facebook)
# https://messengerfordesktop.com/
# -------------------------------------------------------------------------------------------
# https://updates.messengerfordesktop.com/download/linux/latest/beta?arch=amd64&pkg=deb
