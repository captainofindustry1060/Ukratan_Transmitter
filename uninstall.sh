#!/bin/bash

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

# Get the current username
username=$(logname)

# Function to display help
display_help() {
  echo "uninstall.sh [OPTION]"
  echo "deletes transmitter.bin and number_of_transmissions.txt"
  echo "-h: displays this."
  echo "-t: deletes the TRANSMISSIONS folder."
}
# Parse options
while getopts ":ht" opt; do
  case ${opt} in
    h)
      display_help
      exit 0
      ;;
    t)
      # Remove the TRANSMISSIONS folder
      rm /usr/local/bin/transmitter.bin
      rm /etc/number_of_transmissions.txt      
      rm -r /home/$username/Documents/TRANSMISSIONS	
      exit 0
      ;;
    ?)
      echo "Invalid option: -${OPTARG}."
      exit 1
      ;;
  esac
done
# Remove files only if no options are provided
if [ $OPTIND -eq 1 ]; then
  # removes files, DUH
  rm /usr/local/bin/transmitter.bin
  rm /etc/number_of_transmissions.txt
  echo "Nyoo~! >W< Whyy~?!"
else
  echo "No files were removed. Use -h for help."
fi
