#!/bin/bash
BASE_DIR="/usr/local/share/ajnet"

echo "Choose encryption method:"
echo "1) Base64 Encode"
echo "2) Base64 Decode"
echo "3) AES-256 Encrypt"
echo "4) AES-256 Decrypt"
read -p "Enter choice: " enc_method

case $enc_method in
    1) read -p "Enter text: " text; echo -n "$text" | base64 ;;
    2) read -p "Enter base64 string: " text; echo -n "$text" | base64 --decode ;;
    3) read -p "Enter text: " text; read -s -p "Enter password: " pass; echo "$text" | openssl enc -aes-256-cbc -a -salt -pass pass:"$pass" ;;
    4) read -p "Enter encrypted text: " text; read -s -p "Enter password: " pass; echo "$text" | openssl enc -aes-256-cbc -a -d -salt -pass pass:"$pass" ;;
    *) echo "Invalid choice" ;;
esac
