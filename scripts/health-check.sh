#!/bin/bash

# Simple health check script
if pgrep -x "emulator" > /dev/null; then
    echo "Emulator is running"
    exit 0
else
    echo "Emulator is not running"
    exit 1
fi