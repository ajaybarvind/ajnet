#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RESET='\033[0m'  # Reset color

while true; do
    echo -e "${CYAN}Choose operation:${RESET}"
    echo -e "${GREEN}1) Base64 Encode${RESET}"
    echo -e "${BLUE}2) Base64 Decode${RESET}"
    echo -e "${YELLOW}3) ROT13 Encode${RESET}"
    echo -e "${WHITE}4) ROT13 Decode${RESET}"
    read -r -p "Enter choice (1-4): " enc_choice

    case "$enc_choice" in
        1) read -r -p "Enter text: " text
           echo -n "$text" | base64
           break ;;
        2) read -r -p "Enter base64 string: " text
           echo -n "$text" | base64 --decode
           break ;;
        3) read -r -p "Enter text: " text
           echo "$text" | tr 'A-Za-z' 'N-ZA-Mn-za-m'
           break ;;
        4) read -r -p "Enter ROT13 text: " text
           echo "$text" | tr 'A-Za-z' 'N-ZA-Mn-za-m'
           break ;;
        *) echo -e "${RED}Invalid choice, please try again.${RESET}" ;;
    esac
done
