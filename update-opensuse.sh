#!/bin/bash

# Source common functions
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Prompt user for Ollama update
read -p "Do you want to update Ollama? (y/N): " ollama_response

# Prompt user for Open WebUI update
read -p "Do you want to update Open-WebUI? (y/N): " webui_response

# Uncomment the following lines to enable npm package updates
# read -p "Do you want to update Qwen Code? (y/N): " qwen_response
# read -p "Do you want to update Gemini CLI? (y/N): " gemini_response

# Run the standard update commands
echo "Running system updates..."
run_safe "Zypper refresh" sudo zypper ref
run_safe "Zypper distribution upgrade" sudo zypper dup -y
run_safe "Flatpak update" flatpak update -y

# Update optional tools
update_ollama "$ollama_response"
update_openwebui "$webui_response"

# Uncomment to enable npm package updates
# update_qwen "$qwen_response"
# update_gemini "$gemini_response"

# Prune Docker
prune_docker

# Show summary
show_summary
