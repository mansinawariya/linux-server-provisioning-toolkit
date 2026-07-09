#!/bin/bash

############################################################
# Project : Linux Server Provisioning & Administration Toolkit
# Script  : system-info.sh
# Author  : Mansi Nawariya
# Purpose : Display Linux Server Information
############################################################

# ==============================
# Collect System Information
# ==============================

HOSTNAME=$(hostname)
CURRENT_USER=$(whoami)
OS_NAME=$(grep PRETTY_NAME /etc/os-release | cut -d '"' -f2)
KERNEL_VERSION=$(uname -r)
ARCHITECTURE=$(uname -m)
UPTIME=$(uptime -p)
CURRENT_DATE=$(date)
IP_ADDRESS=$(hostname -I | awk '{print $1}')
CPU_MODEL=$(lscpu | grep "Model name" | cut -d ':' -f2 | xargs)
TOTAL_MEMORY=$(free -h | awk '/Mem:/ {print $2}')
USED_MEMORY=$(free -h | awk '/Mem:/ {print $3}')
AVAILABLE_MEMORY=$(free -h | awk '/Mem:/ {print $7}')
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')
DISK_AVAILABLE=$(df -h / | awk 'NR==2 {print $4}')
LOGGED_USERS=$(who | wc -l)

# ==============================
# Display Report
# ==============================

echo "==========================================================="
echo "        Linux Server Information Report"
echo "==========================================================="
echo
echo "Date & Time        : $CURRENT_DATE"
echo "Hostname           : $HOSTNAME"
echo "Current User       : $CURRENT_USER"
echo "Operating System   : $OS_NAME"
echo "Kernel Version     : $KERNEL_VERSION"
echo "Architecture       : $ARCHITECTURE"
echo "System Uptime      : $UPTIME"
echo "IP Address         : $IP_ADDRESS"
echo
echo "---------------- Hardware Information ----------------"
echo "CPU Model          : $CPU_MODEL"
echo "Total Memory       : $TOTAL_MEMORY"
echo "Used Memory        : $USED_MEMORY"
echo "Available Memory   : $AVAILABLE_MEMORY"
echo "Disk Usage         : $DISK_USAGE"
echo "Disk Available     : $DISK_AVAILABLE"
echo
echo "---------------- User Information --------------------"
echo "Logged-in Users    : $LOGGED_USERS"
echo
echo "==========================================================="
echo "Report Generated Successfully"
echo "==========================================================="
