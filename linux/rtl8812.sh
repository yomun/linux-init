#!/usr/bin/env bash

##################################################
# Install USB WIFI Driver (RTL8812AU / RTL8821AU)
##################################################

FOLDER_NAME="rtl8812AU_8821AU_linux"

GIT_URL="https://github.com/abperiasamy/${FOLDER_NAME}.git"

PATH_DIR="/host"

KO_WIRELESS_FILE="/lib/modules/$(uname -r)/kernel/drivers/net/wireless/rtl8812au.ko"

if [ -f "${KO_WIRELESS_FILE}" ]
then
	echo ""
else
	PATH_FOLDER="${PATH_DIR}/${FOLDER_NAME}"

	# ---------------------------
	# UNINSTALL & DELETE SOURCES
	# ---------------------------
	if [ -f "${PATH_FOLDER}/README.md" ]
	then
		cmd=$(cd ${PATH_FOLDER} && sudo make uninstall)
		cmd=$(sudo rm -rf ${PATH_FOLDER})
	fi

	# ---------------------------
	# DOWNLOAD SOURCES & INSTALL
	# ---------------------------
	if [ -f "${PATH_FOLDER}/README.md" ]
	then
		echo ""
	else
		cmd=$(cd ${PATH_DIR} && git clone ${GIT_URL})
		cmd=$(cd ${PATH_FOLDER} && make clean && make && sudo make install)
	fi
fi
