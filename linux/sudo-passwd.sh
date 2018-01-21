#!/usr/bin/env bash

#
# https://jasonmun.blogspot.my
# https://github.com/yomun
# 
# Copyright (C) 2017 Jason Mun
# 
# ---------------------------------------------------------------------------------
# ignore input sudo PASSWORD
# ---------------------------------------------------------------------------------

USER_ID="${USER}"

su
echo "${USER_ID}  ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${USER_ID}
