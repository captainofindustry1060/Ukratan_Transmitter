#!/bin/bash

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

if [ -e /usr/local/bin/transmitter.bin ]
then
	echo "transmitter is deployed"
else
	if [ -e ./transmitter.bin ]
	then
		mv transmitter.bin /usr/local/bin/
	else
		curl -O https://raw.githubusercontent.com/captainofindustry1060/Ukratan_Transmitter/refs/heads/main/transmitter.bin
		mv transmitter.bin /usr/local/bin/
	fi
fi

if [ -e /etc/number_of_transmissions.txt ]
then
	echo "log is deployed"
else
	if [ -e ./number_of_transmissions.txt ]
	then
		mv number_of_transmissions.txt /etc/
	else
		curl -O https://raw.githubusercontent.com/captainofindustry1060/Ukratan_Transmitter/refs/heads/main/number_of_transmissions.txt
		mv number_of_transmissions.txt /etc
	fi
fi

if [ -e /tmp/message.txt ]
then
	echo "message is deployed"
else
 	if [ -e ./message.txt ]
 	then
   		mv message.txt /tmp/
	else
  		curl -O https://raw.githubusercontent.com/captainofindustry1060/Ukratan_Transmitter/refs/heads/main/message.txt
		mv message.txt /tmp/
  	fi
fi
# Set executable permissions
chmod +x /usr/local/bin/transmitter.bin

echo "Nyaa~ Installation complete!"
