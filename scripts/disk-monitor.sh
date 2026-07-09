#!/bin/bash

############################################################
# Project : Linux Server Provisioning & Administration Toolkit
# Script  : disk-monitor.sh
# Author  : Mansi Nawariya
# Purpose : Monitor Disk Usage
############################################################

DISK_INFO=$(df -h / | awk 'NR==2')

FILESYSTEM=$(echo $DISK_INFO | awk '{print $1}')
TOTAL=$(echo $DISK_INFO | awk '{print $2}')
USED=$(echo $DISK_INFO | awk '{print $3}')
AVAILABLE=$(echo $DISK_INFO | awk '{print $4}')
USAGE=$(echo $DISK_INFO | awk '{print $5}')
MOUNTED_ON=$(echo $DISK_INFO | awk '{print $6}')

echo "======================================================="
echo "             Linux Disk Usage Report"
echo "======================================================="
echo
echo "Filesystem      : $FILESYSTEM"
echo "Total Space     : $TOTAL"
echo "Used Space      : $USED"
echo "Available Space : $AVAILABLE"
echo "Disk Usage      : $USAGE"
echo "Mounted On      : $MOUNTED_ON"
echo
echo "======================================================="

USAGE_PERCENT=$(echo $USAGE | tr -d '%')

if [ "$USAGE_PERCENT" -ge 80 ]; then
    echo "⚠ WARNING : Disk usage is above 80%."
else
    echo "✔ Disk usage is healthy."
fi

echo "======================================================="