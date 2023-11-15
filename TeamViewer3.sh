#!/bin/bash

# Check if TeamViewer is installed
if command -v teamviewer &>/dev/null; then
    echo "TeamViewer is already installed. Opening..."
    teamviewer
else
    # TeamViewer is not installed, so install it
    echo "TeamViewer is not installed. Installing..."
    
    # Add TeamViewer repository
    sudo wget https://download.teamviewer.com/download/linux/teamviewer.list -O /etc/apt/sources.list.d/teamviewer.list
    sudo wget https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc -O /tmp/TeamViewer2017.asc
    sudo apt-key add /tmp/TeamViewer2017.asc
    sudo apt-get update
    
    # Install TeamViewer
    sudo apt-get install teamviewer -y
    
    # Open TeamViewer
    teamviewer
fi

# Script ends after TeamViewer is opened
