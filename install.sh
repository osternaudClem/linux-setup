#!/bin/bash
set -e  # Exit on error

echo "Starting system setup..."

echo "Making all install scripts executable..."
chmod +x scripts/*.sh

# Function to prompt for installation
install_prompt() {
    read -p "Do you want to $1? (y/N) " choice
    case "$choice" in
        [Yy]* ) bash "$2";;
        [Nn]* ) echo "Skipping $1.";;
        * ) echo "Invalid input. Skipping $1.";;
    esac
}

# Prompt for each installation
install_prompt "install essential tools" "scripts/install_misc.sh"
install_prompt "install Albert" "scripts/install_albert.sh"
install_prompt "install Zsh and Oh My Zsh" "scripts/install_zsh.sh"
install_prompt "install Starship" "scripts/install_starship.sh"
install_prompt "install PostgreSQL" "scripts/install_postgres.sh"
install_prompt "install Node.js" "scripts/install_node.sh"
install_prompt "create Dev folder" "scripts/create_dev_folder.sh"

# Generate SSH key
install_prompt "create an SSH key" "scripts/create_ssh_key.sh"

echo "Setup complete!"

