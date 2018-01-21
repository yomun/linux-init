#!/usr/bin/env bash

#
# https://jasonmun.blogspot.my
# https://github.com/yomun
# 
# Copyright (C) 2017 Jason Mun
# 
# ---------------------------------------------------------------------------------
# WireShark setup
# ---------------------------------------------------------------------------------

USER_ID="yomun"

sudo chgrp ${USER_ID} /usr/bin/dumpcap
sudo chown ${USER_ID} /usr/bin/dumpcap

sudo chmod u+s /usr/bin/dumpcap

sudo setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' /usr/bin/dumpcap
