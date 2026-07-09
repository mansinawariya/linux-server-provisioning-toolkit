#!/bin/bash

############################################################
# Project : Linux Server Provisioning & Administration Toolkit
# Script  : toolkit.sh
# Author  : Mansi Nawariya
# Purpose : Main Menu
############################################################

while true
do
    clear

    echo "==========================================================="
    echo " Linux Server Provisioning & Administration Toolkit v1.0"
    echo "==========================================================="
    echo
    echo "1. System Information"
    echo "2. Disk Monitoring"
    echo "3. Memory Monitoring"
    echo "4. CPU Monitoring (Coming Soon)"
    echo "5. Service Status (Coming Soon)"
    echo "6. User Management (Coming Soon)"
    echo "7. Update Server (Coming Soon)"
    echo "8. Backup (Coming Soon)"
    echo "9. Cleanup Logs (Coming Soon)"
    echo "10. Health Report (Coming Soon)"
    echo "0. Exit"
    echo
    read -p "Enter your choice: " choice

    case $choice in
        5)
            clear
            ./scripts/system-info.sh
            ;;
        2)
            clear
            ./scripts/disk-monitor.sh
            ;;
        3)
            clear
            ./scripts/memory-monitor.sh
            ;;
        0)
            echo
            echo "Thank you for using Linux Server Provisioning & Administration Toolkit."
            exit 0
            ;;
        *)
            echo
            echo "Invalid choice! Please try again."
            ;;
    esac

    echo
    read -p "Press Enter to return to the Main Menu..."
done