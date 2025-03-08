#!/bin/bash
set -e

echo "Generating SSH key..."

# Ask for an email for the SSH key
read -p "Enter your email for the SSH key: " email

# Set the SSH key file location
ssh_key="$HOME/.ssh/id_rsa"

# Check if an SSH key already exists
if [ -f "$ssh_key" ]; then
    echo "An SSH key already exists at $ssh_key."
    read -p "Do you want to overwrite it? (y/n) " choice
    if [[ "$choice" =~ ^[Nn]$ ]]; then
        echo "Keeping existing SSH key."
        exit 0
    fi
    echo "Overwriting existing SSH key..."
    rm -f "$ssh_key" "$ssh_key.pub"
fi

# Generate SSH key
ssh-keygen -t rsa -b 4096 -C "$email" -f "$ssh_key" -N ""

# Start SSH agent and add key
eval "$(ssh-agent -s)"
ssh-add "$ssh_key"

# Display the public key
echo "SSH key generated successfully! Your public key:"
cat "$ssh_key.pub"
