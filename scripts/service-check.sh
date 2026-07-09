#!/bin/bash

############################################################
# Project : Linux Server Provisioning & Administration Toolkit
# Script  : service-check.sh
# Author  : Mansi Nawariya
# Purpose : Check Important Linux Services
############################################################

SERVICES=("ssh" "cron" "NetworkManager" "docker" "nginx" "apache2")

echo "======================================================="
echo "           Linux Service Status Report"
echo "======================================================="
echo
printf "%-20s %-20s\n" "SERVICE" "STATUS"
printf "%-20s %-20s\n" "-------------------" "-------------------"

for SERVICE in "${SERVICES[@]}"
do
    if systemctl list-unit-files | grep -q "^$SERVICE.service"; then

        STATUS=$(systemctl is-active "$SERVICE")

        if [ "$STATUS" = "active" ]; then
            printf "%-20s %-20s\n" "$SERVICE" "RUNNING"
        else
            printf "%-20s %-20s\n" "$SERVICE" "STOPPED"
        fi

    else
        printf "%-20s %-20s\n" "$SERVICE" "NOT INSTALLED"
    fi
done

echo
echo "======================================================="