#!/usr/bin/env bash

#
# https://jasonmun.blogspot.my
# https://github.com/yomun
# 
# Copyright (C) 2017 Jason Mun
#
# dconf dump /org/gnome/desktop/app-folders/ > gnome_shell_extensions_appfolder.txt
#
# ---------------------------------------------------------------------------------
# Set AppFolder on GNOME Applications Menu / 配置 GNOME 程序菜单文件夹
# ---------------------------------------------------------------------------------

FOLDER_CHILDREN="['Utilities', 'Sundry', 'System', 'Games', 'Internet', 'Java', 'LibreOffice', 'Multimedia', 'Programming', 'VM']"

array_folders_name=(
	"Utilities" "Sundry" "System" "Games" "Internet" 
	"Java" "LibreOffice" "Multimedia" "Programming" "VM"
)
array_translate=(
	"true" "true" "false" "false" "false" 
	"false" "false" "false" "false" "false"
)
array_categories=(
	"['X-GNOME-Utilities']" "['X-GNOME-Sundry']" "@as []" "@as []" "@as []" 
	"@as []" "@as []" "@as []" "@as []" "@as []"
)
# *.desktop
array_apps=( 
 "['org.gnome.FileRoller', 'org.gnome.DejaDup', 'gucharmap', 'org.gnome.baobab', 'org.gnome.DiskUtility', 
 'org.gnome.font-viewer', 'eog', 'org.gnome.Logs', 'seahorse', 'org.gnome.Screenshot', 
 'gnome-system-monitor', 'gnome-terminal', 'gnome-tweak-tool']"
 "['stacer', 'ubuntu-cleaner', 'ucaresystemcore', 'ukuu']"
 "['ca.desrt.dconf-editor', 'fcitx', 'fcitx-configtool', 'gufw', 'gdebi', 
 'im-config', 'gnome-language-selector', 'menulibre', 'nvidia-settings', 'org.gnome.PowerStats', 
 'gtkorphan', 'gnome-control-center', 'software-properties-gnome', 'update-manager', 'gnome-session-properties', 
 'usb-creator-gtk', 'org.gnome.Software']" 
 "['gnome-mahjongg', 'gnome-sudoku', 'gnome-mines']"
 "['bcloud', 'firefox', 'google-chrome', 'qBittorrent', 'remmina', 
 'skypeforlinux', 'thunderbird', 'uget-gtk', 'wireshark', 'youtube-dlg']"
 "['JB-jconsole-jdk8', 'JB-javaws-jdk8', 'JB-jvisualvm-jdk8', 'JB-controlpanel-jdk8', 'JB-policytool-jdk8', 'JB-mission-control-jdk8']"
 "['libreoffice-draw', 'libreoffice-startcenter', 'libreoffice-impress', 'libreoffice-calc', 'libreoffice-writer', 'libreoffice-math']"
 "['cheese', 'mpv', 'netease-cloud-music', 'rhythmbox', 'shotwell', 'simple-scan', 'totem', 'vlc']"
 "['opt_eclipse', 'meld', 'notepadqq', 'sublime-text']"
 "['vmware-workstation', 'vmware-netcfg', 'virtualbox', 'vmware-player', 'test']"
)
array_folder_name=(
	"X-GNOME-Utilities.directory" "X-GNOME-Sundry.directory" "System" "Games" "Internet" 
	"Java" "LibreOffice" "Multimedia" "Programming" "VM"
)

DESKTOP_FILE_TYPE=".desktop"

APPS=""

function check_desktop_file()
{
	local NOT_EXISTS="0"

	local LOCAL_APPS=`echo "${APPS}" | sed "s/ //g" | sed "s/',/${DESKTOP_FILE_TYPE}',/g" | sed "s/']/${DESKTOP_FILE_TYPE}']/g"`

	local APP_LIST=`echo "${LOCAL_APPS}" | sed "s/\[//g" | sed "s/\]//g" | tr "," " "`

	for ix in ${APP_LIST}
	do
		ix=`echo ${ix:1} | sed "s/${DESKTOP_FILE_TYPE}'/${DESKTOP_FILE_TYPE}/g"`

		if [ `echo "${ACT_SYS_APP_LIST}" | grep -c ${ix}` -eq 0 ]
		then
			# remove *.desktop if not exists in system
			LOCAL_APPS=`echo "${LOCAL_APPS}" | sed "s/${ix}//g"`
			echo "[Not Exists] >> ${ix}"
			NOT_EXISTS="1"
		fi
	done

	if [ "${NOT_EXISTS}" == "1" ]
	then
		echo ${LOCAL_APPS} | sed "s/','/', '/g" | sed "s/${DESKTOP_FILE_TYPE}'/'/g"
	fi

	APPS="${LOCAL_APPS}"
}

ACT_APP_LIST=`cd ~/.local/share/applications && ls *${DESKTOP_FILE_TYPE}`
SYS_APP_LIST=`cd /usr/share/applications && ls *${DESKTOP_FILE_TYPE}`
ACT_SYS_APP_LIST=`echo -e "${ACT_APP_LIST}\n${SYS_APP_LIST}" | sort | uniq`

# echo ${ACT_SYS_APP_LIST}

gsettings set org.gnome.desktop.app-folders folder-children "${FOLDER_CHILDREN}"

for ix in ${!array_folder_name[*]} 
do
	TRANSLATE="${array_translate[$ix]}"
	CAT="${array_categories[$ix]}"
	APPS="${array_apps[$ix]}"
	FOLDERS_NAME="${array_folders_name[$ix]}"
	FOLDER_NAME="${array_folder_name[$ix]}"

	check_desktop_file
	
	gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/${FOLDERS_NAME}/ translate "${TRANSLATE}"
	gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/${FOLDERS_NAME}/ categories "${CAT}"
	gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/${FOLDERS_NAME}/ apps "${APPS}"
	gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/${FOLDERS_NAME}/ excluded-apps "@as []"
	gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/${FOLDERS_NAME}/ name "'${FOLDER_NAME}'"

	sleep 1
done
