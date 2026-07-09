#!/bin/bash

############################################################
# Project : Linux Server Provisioning & Administration Toolkit
# Script  : toolkit.sh
# Author  : Mansi Nawariya
# Purpose : Main Menu for Linux Administration Toolkit
############################################################

while true
do
    clear

    echo "========================================================="
    echo "     Linux Server Provisioning & Administration Toolkit"
    echo "========================================================="
    echo
    echo "1. System Information"
    echo "2. Disk Monitoring"
    echo "3. Memory Monitoring (Coming Soon)"
    echo "4. CPU Monitoring (Coming Soon)"
    echo "5. User Management (Coming Soon)"
    echo "6. Update Server (Coming Soon)"
    echo "7. Service Status (Coming Soon)"
    echo "8. Backup (Coming Soon)"
    echo "9. Cleanup Logs (Coming Soon)"
    echo "10. Generate Health Report (Coming Soon)"
    echo "0. Exit"
    echo
    read -p "Enter your choice: " choice

    case $choice in

        1)
            ./scripts/system-info.sh
            ;;

        2)
            ./scripts/disk-monitor.sh
            ;;

        0)
            echo
            echo "Thank you for using Linux Administration Toolkit."
            exit
            ;;

        *)
            echo
            echo "Invalid Choice!"
            ;;
    esac

    echo
    read -p "Press Enter to return to Main Menu..."
done