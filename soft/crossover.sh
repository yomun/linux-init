#!/usr/bin/env bash

#
# https://jasonmun.blogspot.my
# https://github.com/yomun
# 
# Copyright (C) 2017 Jason Mun
# 
# ---------------------------------------------------------------------------------
# Change winewrapper.exe.so
# ---------------------------------------------------------------------------------

SO_FILE="winewrapper.exe.so"

APP_FOLDER="/opt/cxoffice/lib/wine"

APP_WINE_WRAPPER="${APP_FOLDER}/${SO_FILE}"

BACKUP_WINE_WRAPPER="${APP_FOLDER}/${SO_FILE}.backup"

# use for ignore CrossOver trial version notification
DOWNLOAD_WINE_WRAPPER="https://github.com/yomun/linux-init/raw/master/soft/${SO_FILE}"

if [ -f "${APP_WINE_WRAPPER}" ]
then
	if [ -f "${BACKUP_WINE_WRAPPER}" ]
	then
		echo "You got backup already.."
	else
		# 备份 winewrapper.exe.so
		sudo cp ${APP_WINE_WRAPPER} ${BACKUP_WINE_WRAPPER}
	
		# 下载与替换 winewrapper.exe.so
		wget ${DOWNLOAD_WINE_WRAPPER}
	
		if [ -f "${SO_FILE}" ]
		then
			sudo mv ${SO_FILE} ${APP_WINE_WRAPPER}
			sudo chown root:root ${APP_WINE_WRAPPER}
			sudo chmod 644 ${APP_WINE_WRAPPER}
		fi
	fi
else
	# https://www.codeweavers.com/products/crossover-linux/download
	# crossover_17.0.0-1.deb
	xdg-open https://media.codeweavers.com/pub/crossover/cxlinux/demo/
fi
