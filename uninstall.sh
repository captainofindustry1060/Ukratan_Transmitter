#!/bin/bash

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

# Get the current username
username=$(logname)
echo $username
# removes files, DUH
rm /usr/local/bin/transmitter.bin
rm /etc/number_of_transmissions.txt

while getopts ":ht" opt; do
case ${opt} in
 h)
   echo "uninstall.sh [OPTION]"
   echo "deletes transmitter.bin and number_of_transmissions.txt"
   echo "-h: displays this."
   echo "-t: deletes the TRANSMISSIONS folder."
   ;;
 t)
   rm -r /home/$username/Documents/TRANSMISSIONS
   ;;
 ?)
   echo "Invalid option: -${OPTARG}."
   exit 1
   ;;
esac
done

echo "I can't say I aproove, but unistallation was completed."
