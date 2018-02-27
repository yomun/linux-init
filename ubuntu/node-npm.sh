#!/usr/bin/env bash
#
# https://jasonmun.blogspot.my
# https://github.com/yomun
# 
# Copyright (C) 2017 Jason Mun
# 
if [ `apt list | grep "^curl/" | grep -c "installed"` -eq 0 ]
then
	sudo apt install curl -y
fi

## node.js - https://nodejs.org/en/download/
URL=`curl https://nodejs.org/en/download/ | grep -Eo "(href=\")[a-zA-Z0-9.:/?&=_-]*" | grep linux-x64.tar.xz | sed "s/href=\"//g"`

NODEJS_VER=`node -v`

if [ `echo ${NODEJS_VER} | grep -c "is currently not installed."` -eq 1 ]
then
	# SYS NOT YET INSTALL
	rm -rf node-v*-linux-x64.tar.xz
	wget ${URL}
	sudo tar --strip-components=1 -Jxvf node-v*-linux-x64.tar.xz -C /usr/local
	node -v
else
	if [ `echo ${URL} | grep -c "${NODEJS_VER}"` -eq 0 ]
	then
		# IF INSTALLED, CHECK VER. IS DIFF THEN UPGRADE
		rm -rf node-v*-linux-x64.tar.xz
		wget ${URL}
		sudo tar --strip-components=1 -Jxvf node-v*-linux-x64.tar.xz -C /usr/local
		node -v
	fi
fi

NPM_VER=`npm -v`

## npm
sudo apt install npm -y
npm -v
