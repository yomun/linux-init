#!/usr/bin/env bash

#
# https://jasonmun.blogspot.my
# https://github.com/yomun
# 
# Copyright (C) 2017 Jason Mun
# 
# ---------------------------------------------------------------------------------
# curl -I https://nghttp2.org/
# curl --http2 -I https://nghttp2.org/
# curl --version
# ---------------------------------------------------------------------------------

sudo apt install git g++ make binutils autoconf automake autotools-dev libtool pkg-config -y
sudo apt install zlib1g-dev libcunit1-dev libssl-dev libxml2-dev libev-dev libevent-dev libjansson-dev -y
sudo apt install libjemalloc-dev cython python3-dev python-setuptools -y

if [ `apt list | grep "^curl/" | grep -c "installed"` -eq 0 ]
then
	sudo apt install curl -y
else
	# 7.57.0
	CURL_VER_NO=`curl https://curl.haxx.se/ | sed '/.*The most recent stable version is/,$!d' | sed '/released on/q' | sed 's/.*<b>//g' | sed 's/<\/b>.*//g'`
	CURL_PACK_NAME="curl-${CURL_VER_NO}"
	CURL_PACK_FILE="${CURL_PACK_NAME}.tar.bz2"

	if [ `curl -V | grep -c "nghttp2"` -eq 0 ]
	then
		# ------------- 下载/编译/安装 nghttp2 ----------------------------
		echo "Install NGHTTP2.."
		# ---------------------------------------------------------------
		cd ~/Downloads
	
		git clone https://github.com/tatsuhiro-t/nghttp2.git
		cd nghttp2
		autoreconf -i
		automake
		autoconf
		./configure
		make
		sudo make install

		# ------------- 设置 ---------------------------------------------
		CONF_FILE="/etc/ld.so.conf.d/local.conf"
		SETTING_LIB_LINK="/usr/local/lib"
		# ---------------------------------------------------------------
		if [ -f "${CONF_FILE}" ]
		then
			if [ `cat ${CONF_FILE} | grep -c "${SETTING_LIB_LINK}"` -eq 0 ]
			then
				sudo echo "${SETTING_LIB_LINK}" > ${CONF_FILE}
				sudo ldconfig
			fi
		fi
	fi

	if [ `curl -V | grep -c "${CURL_VER_NO}"` -eq 0 ]
	then
		# ------------- 更新 curl ----------------------------------------
		echo "Upgrade CURL.."
		# ---------------------------------------------------------------
		cd ~/Downloads

		wget https://curl.haxx.se/download/${CURL_PACK_FILE}
	
		if [ -f "${CURL_PACK_FILE}" ]
		then
			tar -xvjf ${CURL_PACK_FILE}
			cd ${CURL_PACK_NAME}
			./configure --with-nghttp2=/usr/local --with-ssl
			make
			sudo make install
		fi
	fi

	cd ~
fi

# ------------- 测试 ----------------------------
curl -I https://nghttp2.org/
