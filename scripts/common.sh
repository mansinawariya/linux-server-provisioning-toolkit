#!/bin/bash

############################################################
# Common Functions
############################################################

REPORT_DIR="reports/$(date +%F)"

mkdir -p "$REPORT_DIR"

print_header() {

echo "======================================================="
echo "$1"
echo "Generated : $(date)"
echo "======================================================="

}

save_report() {

local FILE_NAME="$1"

tee "$REPORT_DIR/$FILE_NAME"

}

success() {

echo
echo "SUCCESS : $1"

}

warning() {

echo
echo "WARNING : $1"

}

error() {

echo
echo "ERROR : $1"

}