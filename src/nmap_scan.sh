#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RESET='\033[0m'  # Reset color

# Ask for Target IP
read -r -p "Enter target IP: " ip

if [[ -z "$ip" ]]; then
    echo -e "${RED}Error: No IP entered. Exiting.${RESET}"
    exit 1
fi

while true; do
    echo -e "${BLUE}Choose scan type:${RESET}"
    echo -e "${GREEN}1) Basic Scan${RESET}"
    echo -e "${GREEN}2) Aggressive Scan${RESET}"
    echo -e "${GREEN}3) Port Scan${RESET}"
    echo -e "${GREEN}4) OS Detection${RESET}"
    read -r -p "Enter choice (1-4): " scan_choice

    case "$scan_choice" in
        1) echo -e "${CYAN}Running Basic Scan on $ip...${RESET}"
           nmap "$ip"
           break ;;
        2) echo -e "${CYAN}Running Aggressive Scan on $ip...${RESET}"
           nmap -A "$ip"
           break ;;
        3) read -r -p "Enter ports (comma-separated): " ports
           if [[ -z "$ports" ]]; then
               echo -e "${RED}Error: No ports entered. Please try again.${RESET}"
               continue
           fi
           echo -e "${CYAN}Scanning ports $ports on $ip...${RESET}"
           nmap -p "$ports" "$ip"
           break ;;
        4) echo -e "${CYAN}Running OS Detection on $ip...${RESET}"
           nmap -O "$ip"
           break ;;
        *) echo -e "${RED}Invalid choice, please enter a number between 1 and 4.${RESET}" ;;
    esac
done
