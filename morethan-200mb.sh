#!/bin/bash

# Directory to search for large files
directory="/home/ubuntu/"

# Minimum file size in bytes (200MB)
min_size=$((200*1024*1024))

# Find files larger than min_size in the specified directory
echo "Files larger than 200MB in $directory:"
find "$directory" -type f -size +${min_size}c -exec ls -lh {} \;



-----------------------------------------------------------------------
#!/bin/bash

# Define the directory to search
SEARCH_DIR="/home/ubuntu/"

# Find files larger than 200MB in the specified directory
echo "Finding files larger than 200MB in $SEARCH_DIR ..."
find "$SEARCH_DIR" -type f -size +200M -exec ls -lh {} \;


sh -x 200mb.sh
+ directory=/home/ubuntu/
+ min_size=209715200
+ echo Files larger than 200MB in /home/ubuntu/:
Files larger than 200MB in /home/ubuntu/:
+ find /home/ubuntu/ -type f -size +209715200c -exec ls -lh {} ;
-rw-r--r-- 1 ubuntu ubuntu 1.5G May  2 15:42 /home/ubuntu/garuda.mkv
