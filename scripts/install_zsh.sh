#!/bin/bash
set -e

echo "Installing Zsh and Oh My Zsh..."

# Install Zsh if not already installed
if ! command -v zsh &> /dev/null; then
    sudo apt update
    sudo apt install -y zsh
    echo "Zsh installed successfully."
else
    echo "Zsh is already installed."
fi

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh is already installed."
fi

# Set Zsh as the default shell
if [ "$SHELL" != "/bin/zsh" ]; then
    echo "Setting Zsh as the default shell..."
    chsh -s $(which zsh)
else
    echo "Zsh is already the default shell."
fi

# Copy .zshrc from the repository if available
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ZSHRC_SOURCE="$SCRIPT_DIR/../configs/terminal/.zshrc"
ZSHRC_DEST="$HOME/.zshrc"

if [ -f "$ZSHRC_SOURCE" ]; then
    cp "$ZSHRC_SOURCE" "$ZSHRC_DEST"
    echo ".zshrc configuration copied from $ZSHRC_SOURCE."
else
    echo "Warning: .zshrc file not found in configs/terminal/. Skipping config copy."
fi

echo "Zsh and Oh My Zsh installation complete! Restart your terminal to apply changes."
