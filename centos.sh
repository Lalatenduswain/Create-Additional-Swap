#!/bin/bash

# Set the swap file path and size
SWAPFILE_PATH="/swapfile2"
SWAPFILE_SIZE="4G"  # Adjust as needed

# Create the swap file
fallocate -l $SWAPFILE_SIZE $SWAPFILE_PATH || dd if=/dev/zero of=$SWAPFILE_PATH bs=1M count=4096
chmod 600 $SWAPFILE_PATH
mkswap $SWAPFILE_PATH
swapon $SWAPFILE_PATH

# Update /etc/fstab for persistence
grep -q "$SWAPFILE_PATH" /etc/fstab || echo "$SWAPFILE_PATH none swap sw 0 0" >> /etc/fstab

echo "✅ Additional swap file created and activated."
