#!/usr/bin/env bash

#
# https://jasonmun.blogspot.my
# https://github.com/yomun
# 
# Copyright (C) 2017 Jason Mun
# 

# 服务使用来发送崩溃 log 到 Ubuntu
sudo apt purge whoopsie -y

sudo apt update
sudo apt -y full-upgrade

# ---------------------------------------------------------------------------------
# Remove Packages
# ---------------------------------------------------------------------------------
# 是 Ubuntu 上用来记录用户行为和事件的服务,
# 包括文件打开、网站访问、对话等等, 其他应用程序可访问这些记录下来的信息
# sudo apt-get purge zeitgeist-core zeitgeist-datahub python-zeitgeist rhythmbox-plugin-zeitgeist zeitgeist -y

sudo apt remove aisleriot -y
sudo apt remove gnome-mahjongg -y
sudo apt remove gnome-mines -y
sudo apt remove gnome-sudoku -y

sudo apt remove gnome-weather -y
sudo apt remove transmission-common -y

sudo apt remove brltty -y
sudo apt remove yelp -y

# sudo apt remove evince -y
# sudo apt remove ibus -y
# sudo apt remove libreoffice-core libreoffice-common -y
# sudo apt remove totem -y

# remove Amazon links
sudo apt purge ubuntu-web-launchers -y
