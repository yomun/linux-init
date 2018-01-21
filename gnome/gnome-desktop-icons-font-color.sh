#!/usr/bin/env bash

#
# https://jasonmun.blogspot.my
# https://github.com/yomun
# 
# Copyright (C) 2017 Jason Mun
# 
# ---------------------------------------------------------------------------------
# Set GNOME desktop icons's font-color / 配置 GNOME 桌面图标字体颜色
# ---------------------------------------------------------------------------------

# .view, iconview,.view text,iconview text,textview text { color: #ffffff; background-color: #ffffff; }
DESKTOP_INTERFACE_GTK_THEME="United-Ubuntu-alt-Dark-Compact"

DESKTOP_TEXT_COLOR="white" #ffffff
DESKTOP_TEXT_SHADOW_COLOR="black" #000000

THEMES_FOLDER=".themes"
THEMES_FOLDER_PATH="~/${THEMES_FOLDER}"
GTK_FOLDER="gtk-3.0"

SEARCH_CSS_CONTENTS=".nautilus-desktop.nautilus-canvas-item"
NEW_CSS_CONTENTS="${SEARCH_CSS_CONTENTS} { color: ${DESKTOP_TEXT_COLOR}; text-shadow: 1px 1px ${DESKTOP_TEXT_SHADOW_COLOR}; }"

if [ -d "${THEMES_FOLDER_PATH}" ]
then
	LIST_GTK_CSS=`ls ${THEMES_FOLDER_PATH}/*/${GTK_FOLDER}/gtk.css | tr "\n" " "`

	for loc in ${LIST_GTK_CSS}
	do
		if [ `cat ${loc} | grep -c "${SEARCH_CSS_sCONTENTS}"` -eq 0 ]
		then
			echo "[Set] ${loc}"

			echo "${NEW_CSS_CONTENTS}" >> ${loc}
		else
			# clear multiple empty line
			sed -i '/^$/N;/^\n$/D' ${loc}

			if [ `cat ${loc} | grep -c "${SEARCH_CSS_CONTENTS}.*{.*}"` -eq 1 ]
			then
				echo "[Change] ${loc}"

				# delete settings before
				sed -i "/${SEARCH_CSS_CONTENTS}/d" ${loc}

				# set new css settings
				echo -e "\n${NEW_CSS_CONTENTS}" >> ${loc}
			fi
		fi

		THEMES_FOLDER_NAME=`echo "${loc}" | sed "s/\/.*\${THEMES_FOLDER}\///g" | sed "s/\/${GTK_FOLDER}.*//g"`

		if [ "${THEMES_FOLDER_NAME}" == "${DESKTOP_INTERFACE_GTK_THEME}" ]
		then
			# echo "[Set] ${THEMES_FOLDER_NAME}"
			gsettings set org.gnome.desktop.interface gtk-theme ''
			gsettings set org.gnome.desktop.interface gtk-theme "'${THEMES_FOLDER_NAME}'"
		fi
	done
fi
