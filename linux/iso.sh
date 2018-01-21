#!/usr/bin/env bash

PATH_ISO="/host/_/iso"

DISK="${PATH_ISO}/Office/Office_2013_32bit.iso"
# DISK="${PATH_ISO}/Office/Office_Professional_Plus_2013_64Bit_sp1_15.0.4420.1017.iso"
# DISK="${PATH_ISO}/Office/2016/SW_DVD5_Office_Professional_Plus_2016_W32_English_MLF_X20-41353.ISO"

MOUNT_FOLDER="/media/yomun/iso"

sudo mkdir -p ${MOUNT_FOLDER}

sudo mount -o loop ${DISK} ${MOUNT_FOLDER}
