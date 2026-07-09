#!/bin/bash

############################################################
# Project : Linux Server Provisioning & Administration Toolkit
# Script  : user-management.sh
# Author  : Mansi Nawariya
# Purpose : Linux User Management Utility
############################################################

while true
do
    clear

    echo "======================================================="
    echo "             Linux User Management"
    echo "======================================================="
    echo
    echo "1. List Users"
    echo "2. Check User"
    echo "3. Create User (Preview)"
    echo "4. Delete User (Preview)"
    echo "5. Lock User (Preview)"
    echo "6. Unlock User (Preview)"
    echo "0. Exit"
    echo

    read -p "Enter Choice : " CHOICE

    case $CHOICE in

    1)

        echo
        echo "System Users"
        echo "--------------------------"

        cut -d: -f1 /etc/passwd

        ;;

    2)

        read -p "Enter Username : " USER

        if id "$USER" &>/dev/null
        then
            echo
            echo "User Exists"
        else
            echo
            echo "User Not Found"
        fi

        ;;

    3)

        read -p "Enter Username : " USER

        echo
        echo "Preview:"
        echo "sudo useradd $USER"

        ;;

    4)

        read -p "Enter Username : " USER

        echo
        echo "Preview:"
        echo "sudo userdel $USER"

        ;;

    5)

        read -p "Enter Username : " USER

        echo
        echo "Preview:"
        echo "sudo passwd -l $USER"

        ;;

    6)

        read -p "Enter Username : " USER

        echo
        echo "Preview:"
        echo "sudo passwd -u $USER"

        ;;

    0)

        exit

        ;;

    *)

        echo
        echo "Invalid Choice"

        ;;

    esac

    echo
    read -p "Press Enter to Continue..."

done