#!/bin/bash

grep -i 'MemTotal:' /proc/meminfo > /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_SASSONE/RTA_ARCHIVOS_Examen_20241004/Filtro_Basico.txt

sudo dmidecode -t chassis | grep -E "Chassis Information|Manufacturer" >> /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_SASSONE/RTA_ARCHIVOS_Examen_20241004/Filtro_Basico.txt
