#!/usr/bin/env bash

#
# https://jasonmun.blogspot.my
# https://github.com/yomun
# 
# Copyright (C) 2017 Jason Mun
# 
#

SWITCH=`gsettings get org.gnome.shell disable-user-extensions`

if [ ${#SWITCH} -eq 4 ]
then
	gsettings set org.gnome.shell disable-user-extensions false
else
	gsettings set org.gnome.shell disable-user-extensions true
fi
