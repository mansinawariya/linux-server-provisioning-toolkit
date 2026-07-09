#!/bin/bash

############################################################
# Project : Linux Server Provisioning & Administration Toolkit
# Script  : backup.sh
# Author  : Mansi Nawariya
# Purpose : Create a compressed backup of a directory
############################################################

echo "======================================================="
echo "              Linux Backup Utility"
echo "======================================================="
echo

read -p "Enter directory to backup: " SOURCE

if [ ! -d "$SOURCE" ]; then
    echo
    echo "Error: Directory does not exist."
    exit 1
fi

mkdir -p reports/backups

BACKUP_NAME=$(basename "$SOURCE")-$(date +%F-%H%M%S).tar.gz

tar -czf "reports/backups/$BACKUP_NAME" "$SOURCE"

echo
echo "Backup created successfully."
echo "Backup File : reports/backups/$BACKUP_NAME"

SIZE=$(du -h "reports/backups/$BACKUP_NAME" | awk '{print $1}')

echo "Backup Size : $SIZE"

echo
echo "======================================================="