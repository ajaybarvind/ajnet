#!/bin/bash
BASE_DIR="/usr/local/share/ajnet"

echo "Choose hash cracking tool:"
echo "1) Hashcat"
echo "2) John the Ripper"
read -p "Enter choice: " cracker

read -p "Enter hash file path: " hash_file
read -p "Enter wordlist path: " wordlist

case $cracker in
    1) hashcat -m 0 "$hash_file" "$wordlist" ;;  # Change -m 0 for other hash types
    2) john --wordlist="$wordlist" "$hash_file" ;;
    *) echo "Invalid choice" ;;
esac
