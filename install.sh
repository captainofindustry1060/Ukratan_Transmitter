#!/bin/bash

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

# move files to the appropriate locations
mv transmitter.bin /usr/local/bin/
mv number_of_transmissions.txt /etc/

# Set executable permissions
chmod +x /usr/local/bin/transmitter.bin

echo "Installation complete!"
