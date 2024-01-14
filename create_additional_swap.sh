#!/bin/bash

# Set the swap file path and size
SWAPFILE_PATH="/swapfile2"
SWAPFILE_SIZE="4G"  # Adjust the size as needed

# Create the swap file
sudo fallocate -l $SWAPFILE_SIZE $SWAPFILE_PATH
sudo chmod 600 $SWAPFILE_PATH
sudo mkswap $SWAPFILE_PATH
sudo swapon $SWAPFILE_PATH

# Update /etc/fstab for persistence
echo "$SWAPFILE_PATH none swap sw 0 0" | sudo tee -a /etc/fstab

echo "Additional swap file created and activated."
