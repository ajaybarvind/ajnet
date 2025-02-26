#!/bin/bash
echo "Installing ajnet in /usr/local/bin/..."

INSTALL_DIR="/usr/local/share/ajnet"

# Remove old installation
sudo rm -rf "$INSTALL_DIR"
sudo mkdir -p "$INSTALL_DIR"

# Copy all project files to /usr/local/share/ajnet/
sudo cp -r . "$INSTALL_DIR"
sudo chmod -R +x "$INSTALL_DIR/src"

# Create a symlink in /usr/local/bin/ to point directly to ajnet.sh
sudo ln -sf "$INSTALL_DIR/src/ajnet.sh" /usr/local/bin/ajnet

# Ensure the symlink is executable
sudo chmod +x /usr/local/bin/ajnet

echo "Installation complete. Run 'ajnet' from anywhere."

