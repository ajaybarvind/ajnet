#!/bin/bash
BASE_DIR="/usr/local/share/ajnet"

read -p "Enter target IP: " ip
echo "Choose scan type:"
echo "1) Basic Scan"
echo "2) Aggressive Scan"
echo "3) Port Scan"
read -p "Enter your choice: " scan_type

case $scan_type in
    1) nmap "$ip" ;;
    2) nmap -A "$ip" ;;
    3) read -p "Enter ports: " ports; nmap -p "$ports" "$ip" ;;
    *) echo "Invalid choice" ;;
esac
