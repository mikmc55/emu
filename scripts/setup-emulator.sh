#!/bin/bash

setup_emulator() {
    echo "Setting up Android Emulator..."
    
    # Create AVD if it doesn't exist
    if [ ! -d "/home/.android/avd/test.avd" ]; then
        echo "Creating Android Virtual Device..."
        echo "no" | avdmanager create avd \
            -n test \
            -k "system-images;android-${EMULATOR_API_LEVEL};${EMULATOR_IMG_TYPE};${EMULATOR_SYS_IMG}" \
            --force
    fi
    
    echo "Starting Android Emulator..."
    emulator -avd test \
        -no-audio \
        -no-window \
        -gpu swiftshader_indirect \
        -no-snapshot \
        -wipe-data \
        -verbose &
        
    echo "Emulator startup initiated"
}