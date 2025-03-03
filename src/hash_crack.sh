#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RESET='\033[0m'  # Reset color

# Function to download or locate wordlist
setup_wordlist() {
    DEFAULT_WORDLIST="/usr/local/share/ajnet/wordlist.txt"
    
    # Check if wordlist already exists
    if [[ -f "$DEFAULT_WORDLIST" ]]; then
        echo "$DEFAULT_WORDLIST"
        return
    fi

    echo -e "${YELLOW}No wordlist found. Downloading rockyou.txt...${RESET}"
    
    # Ensure wordlists package is installed
    sudo apt install -y wordlists
    
    # Locate rockyou.txt and extract if needed
    if [[ -f "/usr/share/wordlists/rockyou.txt.gz" ]]; then
        sudo cp /usr/share/wordlists/rockyou.txt.gz "$DEFAULT_WORDLIST.gz"
        sudo gunzip -f "$DEFAULT_WORDLIST.gz"
    elif [[ -f "/usr/share/wordlists/rockyou.txt" ]]; then
        sudo cp /usr/share/wordlists/rockyou.txt "$DEFAULT_WORDLIST"
    else
        echo -e "${RED}Error: rockyou.txt not found! Please install manually.${RESET}"
        exit 1
    fi
    
    echo "$DEFAULT_WORDLIST"
}

# Hash modes for Hashcat and John the Ripper
hash_modes=("MD5" "SHA1" "SHA256" "SHA512" "NTLM")
hashcat_modes=(0 100 1400 1700 1000)
john_modes=("raw-md5" "raw-sha1" "raw-sha256" "raw-sha512" "nt")

# Choose cracking tool
while true; do
    echo -e "${CYAN}Choose cracking tool:${RESET}"
    echo -e "${GREEN}1) Hashcat${RESET}"
    echo -e "${BLUE}2) John the Ripper${RESET}"
    read -r -p "Enter choice (1-2): " cracker_choice

    if [[ "$cracker_choice" -eq 1 || "$cracker_choice" -eq 2 ]]; then
        break
    else
        echo -e "${RED}Invalid choice, please try again.${RESET}"
    fi
done

# Choose hash type
while true; do
    echo -e "${CYAN}Choose hash type:${RESET}"
    for i in "${!hash_modes[@]}"; do
        echo -e "${GREEN}$((i+1))) ${hash_modes[i]}${RESET}"
    done
    read -r -p "Enter choice (1-${#hash_modes[@]}): " hash_choice

    if [[ "$hash_choice" -ge 1 && "$hash_choice" -le "${#hash_modes[@]}" ]]; then
        selected_hash="${hash_modes[hash_choice-1]}"
        selected_mode="${hashcat_modes[hash_choice-1]}"
        selected_john_format="${john_modes[hash_choice-1]}"
        break
    else
        echo -e "${RED}Invalid choice, please try again.${RESET}"
    fi
done

# Get hash file
read -r -p "Enter hash file path: " hash_file
if [[ ! -f "$hash_file" ]]; then
    echo -e "${RED}Error: Hash file does not exist!${RESET}"
    exit 1
fi

# Get wordlist
wordlist=$(setup_wordlist)

echo -e "${CYAN}Using wordlist: $wordlist${RESET}"
echo -e "${CYAN}Cracking $selected_hash hash...${RESET}"

# Run the chosen cracking tool
if [[ "$cracker_choice" -eq 1 ]]; then
    echo -e "${GREEN}Using Hashcat...${RESET}"
    hashcat -m "$selected_mode" "$hash_file" "$wordlist" --force
else
    echo -e "${BLUE}Using John the Ripper...${RESET}"
    john --format="$selected_john_format" --wordlist="$wordlist" "$hash_file"
fi

