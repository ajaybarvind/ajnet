# AJNET - Network Security Toolkit

### Author: Ajayarvind Balasubramanian

## Overview
**ajnet** is an all-in-one network security toolkit designed for penetration testers, cybersecurity researchers, and ethical hackers. It simplifies security scanning, hash cracking, and encryption/decryption tasks using well-known tools like **Nmap, Hashcat, and John the Ripper**.

## Features
- **Nmap Scans**: Perform different types of scans on a target IP.
- **Hash Cracking**: Crack password hashes using Hashcat or John the Ripper.
- **Encryption & Decryption**: Encode and decode text using Base64, ROT13, and AES-256.
- **Automated Wordlist Setup**: Downloads and sets up `rockyou.txt` if a wordlist is missing.
- **Persistent Loop**: The tool runs continuously until manually exited.
- **Back Navigation**: Return to the main menu after executing any task.

---
## Installation
Run:
```bash
chmod +x install.sh && ./install.sh
```

---
## Usage
### **Start the Tool**
```bash
ajnet
```
### **Main Menu Options:**
1️⃣ **Nmap Scan**: Perform different types of scans on a target IP.
2️⃣ **Hash Cracking**: Crack hashes using Hashcat or John the Ripper.
3️⃣ **Encryption & Decryption**: Encode/decode text in various formats.
4️⃣ **Exit**: Quit the tool.

---
## How Each Module Works
### **1️⃣ Nmap Scan**
- **Basic Scan:** `nmap <IP>`
- **Aggressive Scan:** `nmap -A <IP>`
- **Port Scan:** `nmap -p <ports> <IP>`
- **OS Detection:** `nmap -O <IP>`

### **2️⃣ Hash Cracking**
- **Select Hash Type**: MD5, SHA1, SHA256, SHA512, NTLM.
- **Automatic Wordlist Setup**: Downloads `rockyou.txt` if not found.
- **Crack with Hashcat:**
  ```bash
  hashcat -m <mode> <hash_file> <wordlist>
  ```
- **Crack with John the Ripper:**
  ```bash
  john --format=<format> --wordlist=<wordlist> <hash_file>
  ```

### **3️⃣ Encryption & Decryption**
- **Base64 Encode:** Convert text to Base64.
- **Base64 Decode:** Convert Base64 back to text.
- **ROT13 Encode/Decode:** Simple text obfuscation.
- **AES-256 Encryption/Decryption:** Secure encryption with a password.

---
## License
ajnet is licensed under the **MIT License**, allowing for open-source distribution, modification, and use, while still crediting the original author.

```
MIT License

Copyright (c) 2025 Ajayarvind Balasubramanian

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

---
## Contributions & Issues
Found a bug or want to contribute? Open an issue or submit a pull request on GitHub!

**GitHub Repository:** [ajnet on GitHub](https://github.com/ajaybarvind/ajnet)

---
### ** Created by Ajayarvind Balasubramanian**
Happy Hacking! 


