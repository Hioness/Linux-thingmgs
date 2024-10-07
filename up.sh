#!/bin/bash

# Prompt user for Ollama update
read -p "Do you want to update Ollama? (y/N): " update_ollama

# Prompt user for Open WebUI update
read -p "Do you want to update Open-WebUI? (y/N): " update_openwebui

# Run the standard update commands
# distrobox upgrade --all
# sudo apt update && sudo apt upgrade -y
# snap refresh -y
# sudo zypper update -y
# distrobox-upgrade --all
sudo dnf update -y
flatpak update -y

# Update Ollama if user agreed
if [[ $update_ollama =~ ^[Yy]$ ]]; then
    echo "Updating Ollama..."
    curl -fsSL https://ollama.com/install.sh | sh
fi

# Update Open WebUI if user agreed
if [[ $update_openwebui =~ ^[Yy]$ ]]; then
    echo "Updating Open WebUI..."
    docker run --rm \
        -v /var/run/docker.sock:/var/run/docker.sock \
        containrrr/watchtower \
        --run-once \
        open-webui
fi
