#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RESET='\033[0m'  # Reset color

while true; do
    echo -e "${CYAN}Choose hash cracker:${RESET}"
    echo -e "${GREEN}1) Hashcat${RESET}"
    echo -e "${BLUE}2) John the Ripper${RESET}"
    read -r -p "Enter choice (1-2): " cracker_choice

    case "$cracker_choice" in
        1) read -r -p "Enter hash file path: " hash_file
           read -r -p "Enter wordlist file path: " wordlist
           hashcat -m 0 "$hash_file" "$wordlist"
           break ;;
        2) read -r -p "Enter hash file path: " hash_file
           read -r -p "Enter wordlist file path: " wordlist
           john --wordlist="$wordlist" "$hash_file"
           break ;;
        *) echo -e "${RED}Invalid choice, please try again.${RESET}" ;;
    esac
done
