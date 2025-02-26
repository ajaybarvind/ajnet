#!/bin/bash

# Get the absolute path of the script
BASE_DIR="/usr/local/share/ajnet"

# Load configurations
CONFIG_FILE="$BASE_DIR/config/settings.conf"
if [[ -f "$CONFIG_FILE" ]]; then
    source "$CONFIG_FILE"
else
    echo "Error: Configuration file not found at $CONFIG_FILE"
    exit 1
fi

# Display menu
echo "Welcome to ajnet - Network Security Toolkit"
echo "1) Nmap Scan"
echo "2) Hash Cracking"
echo "3) Encryption/Decryption"
read -p "Enter your choice: " choice

case $choice in
    1) source "$BASE_DIR/src/nmap_scan.sh" ;;
    2) source "$BASE_DIR/src/hash_crack.sh" ;;
    3) source "$BASE_DIR/src/encrypt_decrypt.sh" ;;
    *) echo "Invalid choice" ;;
esac
