#!/bin/bash

DEVICE="/dev/sdb"

umount "${DEVICE}1"
umount "${DEVICE}2"
sync

# echo "!!! CẢNH BÁO: XÓA PHÂN VÙNG TRÊN $DEVICE !!!"
# read -p "Bạn chắc chắn? (yes/no): " confirm
# if [ "$confirm" != "yes" ]; then
#     echo "Hủy bỏ."
#     exit 1
# fi

# Chạy fdisk để xóa phân vùng 1 và 2
sudo fdisk "$DEVICE" <<EOF
d
1
d
w
EOF

sync
