#!/usr/bin/env bash

#
# https://jasonmun.blogspot.my
# https://github.com/yomun
# 
# Copyright (C) 2017 Jason Mun
# 
# ---------------------------------------------------------------------------------
# Decode SSL on WireShark
# ---------------------------------------------------------------------------------

USER_ID="yomun"

if [ -f "/usr/bin/google-chrome-stable" ]
then

	FILE="/usr/share/applications/google-chrome.desktop"

	LINE_NUM_CONTENTS=`grep -Fn 'Exec=/usr/bin/google-chrome-stable %U' ${FILE}`
	
	LINE_NUM=`echo "${LINE_NUM_CONTENTS}" | sed 's/:.*//g'`
	CONTENTS=`echo "${LINE_NUM_CONTENTS}" | sed 's/.*://g'`
	
	if [ `echo "${CONTENTS}" | grep -c "\-\-ssl-key-log-file="` -eq 0 ]
	then
		NEW_APPEND=" \-\-ssl-key-log-file=/home/${USER_ID}/Documents/ssl_key.log"

		sed -i "${LINE_NUM}s/${CONTENTS}/${CONTENTS}${NEW_APPEND}/" ${FILE}
	fi
	
	grep -Fn 'Exec=/usr/bin/google-chrome-stable %U' ${FILE}
fi

export SSLKEYLOGFILE=/home/${USER_ID}/Documents/ssl_key.log

printenv | grep SSLKEYLOGFILE

# ------------------
# Wireshark Setup
# ------------------
# Wireshark - Edit - Preferences - Protocols - SSL - (Pre)-Master-Secret log filename
# /home/${USER_ID}/Documents/ssl_key.log
