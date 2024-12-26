#!/bin/bash

# Define paths
CONFIG_DIR="$HOME/.config/Code/User"  # Adjust for your platform
REPO_DIR="$HOME/projects/config"

# Files to sync
FILES=("settings.json" "keybindings.json")

# Sync loop
for file in "${FILES[@]}"; do
  if [ -f "$CONFIG_DIR/$file" ]; then
    cp "$CONFIG_DIR/$file" "$REPO_DIR/$file"
  fi
done

# Commit and push changes
cd "$REPO_DIR" || exit
git add .
git commit -m "Sync VS Code configs: $(date)"
git push

