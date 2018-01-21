#!/usr/bin/env bash

#
# https://jasonmun.blogspot.my
# https://github.com/yomun
# 
# Copyright (C) 2017 Jason Mun
#
# ---------------------------------------------------------------------------------
# GNOME lock screen
# ---------------------------------------------------------------------------------

gsettings set org.gnome.desktop.lockdown disable-lock-screen 'true'

gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend 'false'

gsettings set org.gnome.desktop.session idle-delay 180

# gsettings set org.gnome.desktop.screensaver lock-delay 0
