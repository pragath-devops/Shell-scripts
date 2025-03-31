#!/bin/bash

# Check if Jenkins is running
if systemctl is-active --quiet jenkins; then
    echo "Jenkins is running."
else
    echo "Jenkins is not running. Starting Jenkins..."
    sudo systemctl start jenkins
    echo "Jenkins started successfully."
fi
