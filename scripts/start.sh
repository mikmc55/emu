#!/bin/bash
set -e

echo "Starting Android Emulator Container..."

# Source other scripts
source /home/scripts/setup-display.sh
source /home/scripts/setup-emulator.sh

# Start services
setup_display
setup_emulator

# Keep container running
tail -f /dev/null