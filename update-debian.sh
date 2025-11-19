#!/bin/bash

# Prompt user for Ollama update
read -p "Do you want to update Ollama? (y/N): " update_ollama

# Prompt user for Open WebUI update
read -p "Do you want to update Open-WebUI? (y/N): " update_openwebui

# Uncomment the following lines to enable npm package updates
# read -p "Do you want to update Qwen Code? (y/N): " update_qwen
# read -p "Do you want to update Gemini CLI? (y/N): " update_gemini

# Run the standard update commands
sudo apt update
sudo apt upgrade -y
flatpak update -y

# Update Ollama if user agreed
if [[ $update_ollama =~ ^[Yy]$ ]]; then
    echo "Updating Ollama..."
    curl -fsSL https://ollama.com/install.sh | sh

    echo "Removing Ollama CUDA files..."
    sudo rm -rf /usr/local/lib/ollama/cuda_v12 \
            /usr/local/lib/ollama/cuda_v13
fi

# Update Open WebUI if user agreed
if [[ $update_openwebui =~ ^[Yy]$ ]]; then
    echo "Updating Open WebUI..."
    docker run --rm         -v /var/run/docker.sock:/var/run/docker.sock         containrrr/watchtower         --run-once         open-webui
fi

# The following section handles Qwen Code updates.
# To enable, uncomment the corresponding 'read' prompt at the beginning of the script.
if [[ $update_qwen =~ ^[Yy]$ ]]; then
    echo "Updating Qwen Code..."
    sudo npm install -g @qwen-code/qwen-code@latest
    echo "Qwen Code update complete."
fi

# The following section handles Gemini CLI updates.
# To enable, uncomment the corresponding 'read' prompt at the beginning of the script.
if [[ $update_gemini =~ ^[Yy]$ ]]; then
    echo "Updating Gemini CLI..."
    sudo npm install -g @google/gemini-cli@latest
    echo "Gemini CLI update complete."
fi

# Prune old docker images (like old Open-WebuiVersion)
echo "Pruning old Docker images..."
docker system prune -f
