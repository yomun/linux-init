#!/usr/bin/env bash

#
# https://jasonmun.blogspot.my
# https://github.com/yomun
# 
# Copyright (C) 2017 Jason Mun
# 

# ---------------------------------------------------------------------------------
# vmware - install GCC 
# ---------------------------------------------------------------------------------
sudo apt install build-essential software-properties-common -y

sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt update
sudo apt install gcc-snapshot -y

# 安装 gcc-7 和 g++-7 ( 要安装的版本 7.2 )
sudo apt install gcc-7 g++-7 -y

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 --slave /usr/bin/g++ g++ /usr/bin/g++-7

sudo update-alternatives --config gcc

gcc -v

# 安装了 gcc-7 后, 那就可以打开 vmware, 将 Location 填入 /usr/bin/gcc-7

# 从 gcc 选项移除
# sudo update-alternatives --remove gcc /usr/bin/gcc-7

# 将现在所选的选项设置成 auto mode
# sudo update-alternatives --auto gcc
