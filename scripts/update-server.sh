#!/bin/bash

############################################################
# Project : Linux Server Provisioning & Administration Toolkit
# Script  : update-server.sh
# Author  : Mansi Nawariya
# Purpose : Safely Update Linux Server Packages
############################################################

echo "======================================================="
echo "          Linux Server Update Utility"
echo "======================================================="
echo

echo "This utility will:"
echo "  1. Update package lists"
echo "  2. Upgrade installed packages"
echo

read -p "Do you want to continue? (y/n): " CHOICE

if [[ ! "$CHOICE" =~ ^[Yy]$ ]]; then
    echo
    echo "Update cancelled."
    exit 0
fi

echo
echo "Updating package list..."
sudo apt update

echo
echo "Upgrading installed packages..."
sudo apt upgrade -y

echo
echo "Cleaning unused packages..."
sudo apt autoremove -y

echo
echo "======================================================="
echo "Server updated successfully."
echo "======================================================="