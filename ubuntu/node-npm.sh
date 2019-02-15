#!/usr/bin/env bash
#
# https://jasonmun.blogspot.my
# https://github.com/yomun
# 
# Copyright (C) 2017 Jason Mun
# 
##### node.js && npm (source from local Ubuntu Base)
# --------------------------------------------------------------
# sudo apt-get install nodejs-dev node-gyp libssl1.0-dev -y
# node -v
# sudo apt-get install npm -y
# npm -v
# --------------------------------------------------------------
#
if [ `apt list | grep "^curl/" | grep -c "installed"` -eq 0 ]
then
	sudo apt install curl -y
fi

rm -rf node-v*-linux-x64.tar.xz

## node.js (includes npm) - https://nodejs.org/en/download/
URL=`curl https://nodejs.org/en/download/ | grep -Eo "(href=\")[a-zA-Z0-9.:/?&=_-]*" | grep linux-x64.tar.xz | sed "s/href=\"//g"`
wget ${URL}
sudo tar --strip-components=1 -Jxvf node-v*-linux-x64.tar.xz -C /usr/local

# need to restart Terminal, then check it
node -v
npm -v
