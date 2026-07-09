#!/bin/bash

############################################################
# Project : Linux Server Provisioning & Administration Toolkit
# Script  : memory-monitor.sh
# Author  : Mansi Nawariya
# Purpose : Monitor Memory Usage
############################################################

TOTAL_MEMORY=$(free -h | awk '/Mem:/ {print $2}')
USED_MEMORY=$(free -h | awk '/Mem:/ {print $3}')
FREE_MEMORY=$(free -h | awk '/Mem:/ {print $4}')
AVAILABLE_MEMORY=$(free -h | awk '/Mem:/ {print $7}')

MEMORY_USAGE=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}')

echo "======================================================="
echo "             Linux Memory Usage Report"
echo "======================================================="
echo
echo "Total Memory      : $TOTAL_MEMORY"
echo "Used Memory       : $USED_MEMORY"
echo "Free Memory       : $FREE_MEMORY"
echo "Available Memory  : $AVAILABLE_MEMORY"
echo "Memory Usage      : ${MEMORY_USAGE}%"
echo

if [ "$MEMORY_USAGE" -ge 80 ]; then
    echo "WARNING: High memory usage detected!"
else
    echo "Memory usage is healthy."
fi

echo
echo "======================================================="