#!/bin/bash

echo "Creating dev folder..."
mkdir -p ~/dev

# Check if the alias already exists in ~/.zshrc
if ! grep -q 'alias dev=' ~/.zshrc; then
    echo 'alias dev="cd ~/dev"' >> ~/.zshrc
    echo "Alias 'dev' added to .zshrc."
else
    echo "Alias 'dev' already exists in .zshrc."
fi

echo "Dev folder setup complete."
