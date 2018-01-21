#!/usr/bin/env bash

#
# https://jasonmun.blogspot.my
# https://github.com/yomun
# 
# Copyright (C) 2017 Jason Mun
# 

sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop

# ---------------------------------------------------------------------------------
# Stop Service
# ---------------------------------------------------------------------------------

# 是 AccountsService 的一部分, AccountsService 允许程序获得或操作用户账户信息
sudo systemctl disable accounts-daemon
sudo systemctl stop accounts-daemon

# 提供了一个无密码的 root shell ，用于帮助调试 systemd
sudo systemctl disable debug-shell
sudo systemctl stop debug-shell

# 提供布莱叶盲文设备支持
sudo systemctl disable brltty
sudo systemctl stop brltty

# 开机报告错误
sudo systemctl disable apport
sudo systemctl stop apport

# 拨号连接网络
sudo systemctl disable pppd-dns
sudo systemctl stop pppd-dns

# 蓝牙服务
sudo systemctl disable bluetooth
sudo systemctl stop bluetooth

# 打印服务
sudo systemctl disable cups
sudo systemctl stop cups

# 扫描服务
sudo systemctl disable saned
sudo systemctl stop saned

# 用于零配置网络发现, 使电脑超容易发现网络中打印机或其他的主机
sudo systemctl disable avahi-daemon
sudo systemctl stop avahi-daemon

# 该服务是一个被 dbus 激活的守护进程, 用于提供移动宽频
sudo systemctl disable ModemManager
sudo systemctl stop ModemManager

# broadband（2G/3G/4G）接口
# 如果没有该接口, 无论是内置接口, 还是通过如蓝牙配对的电话, 以及 USB 适配器, 那么你也无需该服务
# sudo systemctl disable broadband
# sudo systemctl stop broadband
