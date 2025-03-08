#!/bin/bash
set -e

echo "Installing essential packages..."
sudo apt update && sudo apt install -y \
  git curl wget htop neofetch unzip \
  libssl-dev zsh fzf bat

echo "Essential packages installed."
