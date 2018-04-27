#!/usr/bin/env bash

#
# https://jasonmun.blogspot.my
# https://github.com/yomun
# 
# Copyright (C) 2017 Jason Mun
# 
# -------------------------------------------------------------------------------------------
# SogouPinyin 搜狗拼音 (需要重启)
# http://pinyin.sogou.com/linux/?r=pinyin
# http://jasonmun.blogspot.my/2016/04/ubuntu-sogoupinyin.html
# 要先安装 fcitx
# -------------------------------------------------------------------------------------------
sudo apt install fcitx -y;
sudo apt remove ibus -y
# sogoupinyin_2.2.0.0102_amd64.deb
wget -O sogoupinyin_amd64.deb https://pinyin.sogou.com/linux/download.php?f=linux&bit=64
if [ -f "sogoupinyin_amd64.deb" ]
then
	sudo dpkg -i sogoupinyin_amd64.deb
	sudo apt install -f -y
fi

# -------------------------------------------------------------------------------------------
# NetEase Cloud Music 网易云音乐
# http://music.163.com/#/download
# -------------------------------------------------------------------------------------------
# wget http://s1.music.126.net/download/pc/netease-cloud-music_1.0.0-2_amd64_ubuntu16.04.deb
wget http://d1.music.126.net/dmusic/netease-cloud-music_1.1.0_amd64_ubuntu.deb
if [ -f "netease-cloud-music_1.1.0_amd64_ubuntu.deb" ]
then
	sudo dpkg -i netease-cloud-music_1.1.0_amd64_ubuntu.deb
	sudo apt install vlc -y
	# sudo apt-get --fix-broken install
	sudo apt install -f -y
	sudo sed -i "s/Exec=netease-cloud-music/Exec=sudo netease-cloud-music/" /usr/share/applications/netease-cloud-music.desktop
fi

# -------------------------------------------------------------------------------------------
# Youdao　有道词典
# https://github.com/yomun/youdaodict_5.5
# -------------------------------------------------------------------------------------------
sudo apt install python3 python3-dbus python3-lxml python3-pil python3-requests python3-xdg python3-xlib -y
sudo apt install python3-pyqt5 python3-pyqt5.qtmultimedia python3-pyqt5.qtquick python3-pyqt5.qtwebkit -y
# sudo apt install qml-module-qtgraphicaleffects qml-module-qtquick-controls -y
sudo apt install tesseract-ocr tesseract-ocr-eng tesseract-ocr-chi-sim tesseract-ocr-chi-tra -y
sudo apt install gir1.2-appindicator3-0.1 libqt5multimedia5-plugins ttf-wqy-microhei -y

wget https://github.com/yomun/youdaodict_5.5/raw/master/youdao-dict_1.1.1-0~ubuntu_amd64.deb
sudo dpkg -i youdao-dict_1.1.1-0*ubuntu_amd64.deb

# -------------------------------------------------------------------------------------------
# BCloud 百度云网盘
# https://github.com/Yufeikang/bcloud
# -------------------------------------------------------------------------------------------
# sudo apt-get --fix-broken install
sudo apt install python3-dev -y
sudo apt install python3-setuptools -y
sudo easy_install3 pip -y

sudo pip3 install --upgrade pycrypto
sudo pip3 install --upgrade keyring
sudo pip3 install cssselect
sudo pip3 install pyinotify

git clone https://github.com/Yufeikang/bcloud
cd bcloud && sudo python3 setup.py install

# uninstall
# sudo python3 setup.py install --record install.txt
# cat install.txt | xargs sudo rm -rf
cd ..

# -------------------------------------------------------------------------------------------
# wine-QQ
# 要先安装 wine + winetricks
# [CrossOver + QQ]      http://jasonmun.blogspot.my/2017/02/crossover-qq.html
# -------------------------------------------------------------------------------------------
# wget https://github.com/askme765cs/Wine-QQ/raw/master/AutoInstallWineForUbuntuX64.sh
# sudo sh AutoInstallWineForUbuntuX64.sh
#
# git clone https://github.com/askme765cs/Wine-QQ.git -b latest --single-branch
# cd Wine-QQ/Wine-QQ8.9.3
# ./qq.sh

# -------------------------------------------------------------------------------------------
# Electronic Wechat 微信
# https://github.com/geeeeeeeeek/electronic-wechat
# -------------------------------------------------------------------------------------------
## node.js 安装 - https://nodejs.org/en/download/
# URL=`curl https://nodejs.org/en/download/ | grep -Eo "(href=\")[a-zA-Z0-9.:/?&=_-]*" | grep linux-x64.tar.xz | sed "s/href=\"//g"`
# wget ${URL}
# sudo tar --strip-components=1 -Jxvf node-v*-linux-x64.tar.xz -C /usr/local
# node -v

## npm 安装
# sudo apt install npm -y
# npm -v

# git clone https://github.com/geeeeeeeeek/electronic-wechat.git
# cd electronic-wechat
# npm install && npm start
