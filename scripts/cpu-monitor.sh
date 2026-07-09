#!/bin/bash

############################################################
# Project : Linux Server Provisioning & Administration Toolkit
# Script  : cpu-monitor.sh
# Author  : Mansi Nawariya
# Purpose : Monitor CPU Information and Load
############################################################

HOSTNAME=$(hostname)
CPU_MODEL=$(lscpu | awk -F: '/Model name/ {print $2}' | xargs)
ARCHITECTURE=$(uname -m)
CPU_CORES=$(nproc)
LOAD_AVERAGE=$(uptime | awk -F'load average:' '{print $2}' | xargs)

echo "======================================================="
echo "               Linux CPU Report"
echo "======================================================="
echo
echo "Hostname         : $HOSTNAME"
echo "CPU Model        : $CPU_MODEL"
echo "Architecture     : $ARCHITECTURE"
echo "CPU Cores        : $CPU_CORES"
echo "Load Average     : $LOAD_AVERAGE"
echo

LOAD1=$(echo "$LOAD_AVERAGE" | cut -d',' -f1)

# Integer part for comparison
LOAD_INT=${LOAD1%.*}

if [ -z "$LOAD_INT" ]; then
    LOAD_INT=0
fi

if [ "$LOAD_INT" -lt "$CPU_CORES" ]; then
    echo "CPU Status       : HEALTHY"
else
    echo "CPU Status       : HIGH LOAD"
fi

echo
echo "======================================================="