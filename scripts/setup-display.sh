#!/bin/bash

setup_display() {
    echo "Setting up display and VNC..."
    
    # Start X server
    Xvfb :0 -screen 0 ${SCREEN_WIDTH}x${SCREEN_HEIGHT}x${SCREEN_DEPTH} &
    sleep 2
    
    # Start window manager
    openbox-session &
    sleep 1
    
    # Start VNC server
    x11vnc -display :0 -forever -nopw -quiet -rfbport ${VNC_PORT} &
    sleep 2
    
    # Start noVNC web interface
    ${OPT_PATH}/noVNC/utils/novnc_proxy --vnc localhost:${VNC_PORT} --listen ${WEB_VNC_PORT} &
    
    echo "Display setup complete"
}