#!/bin/bash

# Source common functions
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Prompt user for Ollama update
# Ollama removed from this machine (2025-07)
# read -p "Do you want to update Ollama? (y/N): " ollama_response

# Run the standard update commands
echo "Running system updates..."
run_safe "DNF update" sudo dnf update -y
run_safe "Flatpak update" flatpak update -y

# Update optional tools
# Ollama removed from this machine (2025-07)
# update_ollama "$ollama_response"

# Prune Docker
# prune_docker

# Show summary
show_summary
