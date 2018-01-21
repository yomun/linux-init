#!/usr/bin/env bash

#
# https://jasonmun.blogspot.my
# https://github.com/yomun
# 
# Copyright (C) 2017 Jason Mun
# 
# ---------------------------------------------------------------------------------
# Fedora / OpenSUSE / Manjaro / Antergos 上安装 netease-cloud-music
# https://music.163.com/#/download
# ---------------------------------------------------------------------------------

OS_RELEASE=`cat /etc/os-release`

DEB_FILE="netease-cloud-music_1.1.0_amd64_ubuntu.deb"

# 1) 下载 netease-cloud-music
# wget http://d1.music.126.net/dmusic/netease-cloud-music_1.1.0_amd64_ubuntu.deb
wget http://d1.music.126.net/dmusic/${DEB_FILE}

# 2) 安装 VLC
if [ `echo ${OS_RELEASE} | grep -c 'ID=fedora'` -gt 0 ]
then
	# https://www.videolan.org/vlc/download-fedora.html
	sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
	sudo dnf update
	sudo dnf install vlc

	# 其它需要的安装包
	sudo dnf install qt5-qtmultimedia qt5-qtx11extras sqlite libXScrnSaver
	sudo dnf install alsa-lib atk cairo dbus expat fontconfig freetype glibc zlib gstreamer1-plugins-ugly-free
	sudo dnf install gdk-pixbuf2 glib2 gtk2 nspr nss pango qt5-qtbase taglib
	sudo dnf install libcue libgcc libstdc++ libXcursor libXext libXfixes libXi libXrandr libXrender libXtst

elif [ `echo ${OS_RELEASE} | grep -c "opensuse"` -gt 0 ]
then
	# https://www.videolan.org/vlc/download-suse.html
	# sudo zypper ar http://download.videolan.org/pub/vlc/SuSE/Leap_42.2 VLC
	# sudo zypper ar http://download.videolan.org/pub/vlc/SuSE/Leap_42.3 VLC
	# sudo zypper ar http://download.videolan.org/pub/vlc/SuSE/SLE12 VLC
	sudo zypper ar http://download.videolan.org/pub/vlc/SuSE/Tumbleweed VLC
	sudo zypper mr -r VLC
	sudo zypper in vlc
	
elif [ `echo ${OS_RELEASE} | grep -c "manjaro"` -gt 0 ] || [ `echo ${OS_RELEASE} | grep -c "antergos"` -gt 0 ]
then
	sudo pacman -S vlc binutils
fi

# 3) 安装 netease-cloud-music
if [ -f "${DEB_FILE}" ]
then
	ar vx ${DEB_FILE}
	sudo tar -Jxvf data.tar.xz -C /
	rm -rf debian-binary
	rm -rf control.tar.gz
	rm -rf data.tar.xz
fi

# 清理 icon-theme.cache
sudo rm -rf /usr/share/icons/hicolor/icon-theme.cache

# 卸载
# su
# rm -rf /usr/share/icons/hicolor/scalable/apps/netease-cloud-music.svg
# rm -rf /usr/share/applications/netease-cloud-music.desktop
# rm -rf /usr/bin/netease-cloud-music
# rm -rf /usr/lib/netease-cloud-music
