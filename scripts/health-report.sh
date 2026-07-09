#!/bin/bash

############################################################
# Project : Linux Server Provisioning & Administration Toolkit
# Script  : health-report.sh
# Author  : Mansi Nawariya
# Purpose : Generate Server Health Report
############################################################

HOSTNAME=$(hostname)
OS=$(grep PRETTY_NAME /etc/os-release | cut -d '"' -f2)
KERNEL=$(uname -r)
UPTIME=$(uptime -p)
IP=$(hostname -I | awk '{print $1}')

DISK=$(df -h / | awk 'NR==2 {print $5}')
DISK_PERCENT=$(echo "$DISK" | tr -d '%')

MEMORY=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2*100}')

echo "======================================================="
echo "           Linux Server Health Report"
echo "======================================================="
echo
echo "Hostname        : $HOSTNAME"
echo "Operating System: $OS"
echo "Kernel Version  : $KERNEL"
echo "System Uptime   : $UPTIME"
echo "IP Address      : $IP"
echo
echo "Disk Usage      : ${DISK}%"
echo "Memory Usage    : ${MEMORY}%"
echo

if [ "$DISK_PERCENT" -lt 80 ] && [ "$MEMORY" -lt 80 ]; then
    echo "Overall Health  : HEALTHY"
else
    echo "Overall Health  : WARNING"
fi

echo
echo "======================================================="