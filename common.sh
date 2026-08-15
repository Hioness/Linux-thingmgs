#!/bin/bash

# Common functions for update scripts
# Error handling and shared update logic

# Arrays to track successes and failures
declare -a SUCCESSES
declare -a FAILURES

# Run a command and track its success/failure
# Usage: run_safe "description" command [args...]
run_safe() {
    local description="$1"
    shift
    
    if "$@"; then
        SUCCESSES+=("$description")
        return 0
    else
        FAILURES+=("$description")
        return 1
    fi
}

# Show summary of all operations
show_summary() {
    echo ""
    echo "=========================================="
    echo "Update Summary"
    echo "=========================================="
    
    if [ ${#SUCCESSES[@]} -gt 0 ]; then
        echo ""
        echo "✓ Completed successfully:"
        for item in "${SUCCESSES[@]}"; do
            echo "  - $item"
        done
    fi
    
    if [ ${#FAILURES[@]} -gt 0 ]; then
        echo ""
        echo "✗ Failed operations:"
        for item in "${FAILURES[@]}"; do
            echo "  - $item"
        done
        echo ""
        echo "Please review the errors above and re-run if needed."
        return 1
    else
        echo ""
        echo "All operations completed successfully!"
        return 0
    fi
}

# Check if a command exists
# Usage: check_tool_exists "command_name"
check_tool_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Verify prerequisites for optional tools
# Returns true if tool exists, prints warning otherwise
check_optional_tool() {
    local tool="$1"
    local purpose="$2"
    
    if ! check_tool_exists "$tool"; then
        echo "Warning: $tool not found. Skipping $purpose updates."
        return 1
    fi
    return 0
}

# Update Ollama
# Ollama removed from this machine (2025-07)
# update_ollama() {
#     if [[ $1 =~ ^[Yy]$ ]]; then
#         echo "Updating Ollama..."
#         if check_optional_tool "curl" "Ollama"; then
#             run_safe "Ollama update" bash -c "curl -fsSL https://ollama.com/install.sh | sh"
# 
#             echo "Removing Ollama CUDA files..."
#             run_safe "Ollama CUDA cleanup" sudo rm -rf /usr/local/lib/ollama/cuda_v12 /usr/local/lib/ollama/cuda_v13
#         fi
#     fi
# }

# Prune Docker images
prune_docker() {
    echo "Pruning old Docker images..."
    if check_optional_tool "docker" "Docker"; then
        run_safe "Docker cleanup" docker system prune -f
    fi
}
