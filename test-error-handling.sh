#!/bin/bash

# Test script to verify common.sh error handling works correctly

# Source common functions
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

echo "Testing error handling framework..."
echo ""

# Test 1: Successful command
run_safe "Test successful operation" echo "This works!"

# Test 2: Failed command
run_safe "Test failed operation" false

# Test 3: Another successful command
run_safe "Test another success" true

# Test 4: Command that doesn't exist
run_safe "Test nonexistent command" nonexistent_command_xyz 2>/dev/null

# Test 5: Successful echo
run_safe "Test echo message" echo "Another successful operation"

# Show the summary
echo ""
echo "End of test. Summary should appear below:"
echo ""
show_summary
