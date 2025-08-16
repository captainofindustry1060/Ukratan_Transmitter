import os

#defining the paths
user_directory = os.path.expanduser("~")
documents_directory = os.path.join(user_directory, "Documents")

#fetching message
os.system('cd /tmp/ && curl -O https://raw.githubusercontent.com/captainofindustry1060/Ukratan_Transmitter/refs/heads/main/message.txt')
with open('/tmp/message.txt', 'r') as m:
    message = m.read()

#fetching transmission number
with open('/etc/number_of_transmissions.txt', 'r') as f:
    transmission_number = f.read()

os.system(f'mkdir {documents_directory}/TRANSMISSIONS') #creating parent folder
os.system(f'touch {documents_directory}/TRANSMISSIONS/TRANSMISSION#{transmission_number}.txt') #sending the transmission ;)
#transmission package
os.system(f'echo -e "-----------------------START TRANSMISSION-----------------------\nThis message is from the Great Technocratic Insitute of Ukratan!\n{message}\nThis is transmission #{transmission_number}.\nGLORY TO THE GREAT TECHNOCRATIC INSTITUTE OF UKRATAN!\n-----------------------END TRANSMISSION-----------------------" >> {documents_directory}/TRANSMISSIONS/TRANSMISSION#{transmission_number}.txt')

#updating transmission number
transmission_number = int(transmission_number) + 1

with open('/etc/number_of_transmissions.txt', 'w') as f1:
    f1.write(str(transmission_number))
os.remove('/tmp/message.txt')
