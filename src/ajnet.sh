#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RESET='\033[0m'  # Reset color

# Function to display banner
show_banner() {
    if ! command -v figlet &>/dev/null || ! command -v lolcat &>/dev/null; then
        echo -e "${RED}Missing dependencies! Installing figlet and lolcat...${RESET}"
        sudo apt update && sudo apt install figlet lolcat -y
    fi
    figlet -f slant "AJNET" | lolcat
    echo -e "${CYAN}Welcome to ajnet - Network Security Toolkit${RESET}\n"
}

# Function for spinner animation
spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\\'
    while ps -p "$pid" &>/dev/null; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    wait "$pid" 2>/dev/null
    printf "    \b\b\b\n"
}

# Load configurations
BASE_DIR="/usr/local/share/ajnet"
CONFIG_FILE="$BASE_DIR/config/settings.conf"
if [[ -f "$CONFIG_FILE" ]]; then
    source "$CONFIG_FILE"
else
    echo -e "${RED}Error: Configuration file not found at $CONFIG_FILE${RESET}"
    exit 1
fi

# Show banner
show_banner

# Main loop to keep running until Ctrl+C
while true; do
    echo -e "${YELLOW}1) Nmap Scan${RESET}"
    echo -e "${YELLOW}2) Hash Cracking${RESET}"
    echo -e "${YELLOW}3) Encryption/Decryption${RESET}"
    echo -e "${RED}4) Exit${RESET}"
    read -p "Enter your choice: " choice

    case $choice in
        1) echo -e "${CYAN}Starting Nmap Scan...${RESET}"
           "$BASE_DIR/src/nmap_scan.sh" ;;
        2) echo -e "${CYAN}Starting Hash Cracking...${RESET}"
           "$BASE_DIR/src/hash_crack.sh" ;;
        3) echo -e "${CYAN}Starting Encryption/Decryption...${RESET}"
           "$BASE_DIR/src/encrypt_decrypt.sh" ;;
        4) echo -e "${RED}Exiting ajnet. Goodbye!${RESET}"
           exit 0 ;;
        *) echo -e "${RED}Invalid choice, please try again.${RESET}" ;;
    esac
    echo -e "${GREEN}Returning to main menu...${RESET}\n"
    sleep 1

done

