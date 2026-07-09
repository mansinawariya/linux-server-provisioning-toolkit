#!/bin/bash

############################################################
# Project : Linux Server Provisioning & Administration Toolkit
# Script  : cleanup.sh
# Author  : Mansi Nawariya
# Purpose : Safe Cleanup Utility
############################################################

echo "======================================================="
echo "            Linux Cleanup Utility"
echo "======================================================="
echo

TMP_DIR="/tmp"

TMP_SIZE=$(du -sh "$TMP_DIR" 2>/dev/null | awk '{print $1}')
TOTAL_FILES=$(find "$TMP_DIR" -type f 2>/dev/null | wc -l)

echo "Directory          : $TMP_DIR"
echo "Total Files        : $TOTAL_FILES"
echo "Current Size       : $TMP_SIZE"
echo

echo "Files that can be cleaned (First 10):"
echo "--------------------------------------"

find "$TMP_DIR" -type f 2>/dev/null | head -10

echo
echo "--------------------------------------"

read -p "Do you want to clean temporary files? (y/n): " CHOICE

if [[ "$CHOICE" =~ ^[Yy]$ ]]; then

    find "$TMP_DIR" -type f -delete 2>/dev/null

    echo
    echo "Cleanup completed successfully."

    NEW_SIZE=$(du -sh "$TMP_DIR" 2>/dev/null | awk '{print $1}')

    echo "Current Size After Cleanup : $NEW_SIZE"

else

    echo
    echo "Cleanup cancelled."

fi

echo
echo "======================================================="