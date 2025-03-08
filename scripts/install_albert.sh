#!/bin/bash
set -e

echo "Installing Albert launcher..."

# Add the repository for Albert
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_24.04/ /' | sudo tee /etc/apt/sources.list.d/albert.list
curl -fsSL https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_24.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/albert.gpg > /dev/null

sudo apt update
sudo apt install -y albert

echo "Albert installation complete. You can launch it by running 'albert' in the terminal."

# Create autostart directory if it doesn't exist
mkdir -p ~/.config/autostart

# Create Albert autostart entry
echo "Configuring Albert to start automatically..."
cat <<EOF > ~/.config/autostart/albert.desktop
[Desktop Entry]
Type=Application
Name=Albert
Exec=sh -c "sleep 5 && albert"
StartupNotify=false
Terminal=false
EOF

# Ensure the autostart file is executable
chmod +x ~/.config/autostart/albert.desktop

echo "Albert is now set to start automatically at login!"

# Start Albert in the background
echo "Starting Albert now..."
nohup albert >/dev/null 2>&1 &

echo "Albert is now running in the background."