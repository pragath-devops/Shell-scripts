#!/bin/bash

# Directory to search for log directories
log_directory="/path/to/logs"

# Number of days threshold
threshold_days=10

# Find directories older than threshold_days days
old_directories=$(find "$log_directory" -maxdepth 1 -type d -mtime +$threshold_days)

# Iterate over found directories and delete them
for dir in $old_directories; do
    echo "Deleting directory: $dir"
    rm -rf "$dir"
done



You can achieve this with a shell script using the find command to locate directories older than a certain number of days and the rm command to delete them. Here's a script to accomplish that:
