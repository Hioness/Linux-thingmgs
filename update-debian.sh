#!/bin/bash

# Source common functions
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Prompt user for Ollama update
read -p "Do you want to update Ollama? (y/N): " ollama_response

# Run the standard update commands
echo "Running system updates..."
run_safe "APT update" sudo apt update
run_safe "APT upgrade" sudo apt upgrade -y
run_safe "Flatpak update" flatpak update -y

# Update optional tools
update_ollama "$ollama_response"

# Prune Docker
prune_docker

# Show summary
show_summary
