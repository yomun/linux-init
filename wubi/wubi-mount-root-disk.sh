#!/usr/bin/env bash

DISK="/host/ubuntu_16/disks/root.disk"

MOUNT_FOLDER="/media/yomun/ubuntu_16"

sudo mkdir -p ${MOUNT_FOLDER}

sudo mount -t ext4 -o loop ${DISK} ${MOUNT_FOLDER}

# sudo fdisk -l
# sudo blkid
# ll /media/yomun
# sudo chgrp adm /media/yomun/ubuntu_16
# sudo chmod g+w /media/yomun/ubuntu_16
