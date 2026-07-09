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

    echo "=============================================================="
    echo "      Linux Server Provisioning & Administration Toolkit"
    echo "=============================================================="
    echo
    echo " Monitoring"
    echo "--------------------------------------------------------------"
    echo "1.  System Information"
    echo "2.  Disk Monitoring"
    echo "3.  Memory Monitoring"
    echo "4.  CPU Monitoring"
    echo "5.  Service Status"
    echo "6.  Health Report"
    echo
    echo " Administration"
    echo "--------------------------------------------------------------"
    echo "7.  User Management"
    echo "8.  Backup Utility"
    echo "9.  Cleanup Utility"
    echo "10. Update Server"
    echo
    echo " Reports"
    echo "--------------------------------------------------------------"
    echo "11. Generate All Reports"
    echo
    echo "0. Exit"
    echo
    read -p "Enter your choice: " choice

    case $choice in

        1)
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

        4)
            clear
            ./scripts/cpu-monitor.sh
            ;;

        5)
            clear
            ./scripts/service-check.sh
            ;;

        6)
            clear
            ./scripts/health-report.sh
            ;;

        7)
            clear
            ./scripts/user-management.sh
            ;;

        8)
            clear
            ./scripts/backup.sh
            ;;

        9)
            clear
            ./scripts/cleanup.sh
            ;;

        10)
            clear
            ./scripts/update-server.sh
            ;;

        11)
            clear

            echo "Generating Reports..."
            echo

            mkdir -p reports

            ./scripts/system-info.sh > reports/system-info-report.txt
            ./scripts/disk-monitor.sh > reports/disk-report.txt
            ./scripts/memory-monitor.sh > reports/memory-report.txt
            ./scripts/cpu-monitor.sh > reports/cpu-report.txt
            ./scripts/service-check.sh > reports/service-report.txt
            ./scripts/health-report.sh > reports/health-report.txt

            echo "=============================================="
            echo " All reports generated successfully."
            echo
            echo " Reports saved in:"
            echo " reports/"
            echo "=============================================="
            ;;

        0)
            echo
            echo "Thank you for using Linux Server Provisioning & Administration Toolkit."
            exit 0
            ;;

        *)
            echo
            echo "Invalid Choice!"
            ;;
    esac

    echo
    read -p "Press Enter to return to Main Menu..."
done