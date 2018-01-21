#!/usr/bin/env bash

#################################
# https://01.org/linuxgraphics
#################################

wget --no-check-certificate https://download.01.org/gfx/RPM-GPG-GROUP-KEY-ilg -O - | sudo apt-key add -
wget --no-check-certificate https://download.01.org/gfx/RPM-GPG-KEY-ilg -O - | sudo apt-key add -
wget --no-check-certificate https://download.01.org/gfx/RPM-GPG-KEY-ilg-2 -O - | sudo apt-key add -
wget --no-check-certificate https://download.01.org/gfx/RPM-GPG-KEY-ilg-3 -O - | sudo apt-key add -
wget --no-check-certificate https://download.01.org/gfx/RPM-GPG-KEY-ilg-4 -O - | sudo apt-key add -
