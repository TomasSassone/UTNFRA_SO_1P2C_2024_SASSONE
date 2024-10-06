#!/bin/bash

# Defino la ruta del archivo en una variable mayor legibilidad
archivo="/home/vagrant/repogit/UTNFRA_SO_1P2C_2024_SASSONE/RTA_ARCHIVOS_Examen_20241004/Filtro_Avanzado.txt"

# Defino el hash de mi usuario
hash=$(sudo grep "^$whoami:" /etc/shadow | awk -F ':' '{print $2}')

# Defino la URL de mi repositorio (Se debe ejecutar dentro de la carpeta del repositorio)
url_repo=$(git remote get-url origin)

# Escribo todo en el archivo Filtro_Avanzado.txt
echo "Mi IP Publica es: $(sudo curl -s ifconfig.me)" > "$archivo"
echo "Mi usuario es: $(whoami)" >> "$archivo"
echo "El Hash de mi Usuario es: $hash" >> "$archivo"
echo "La URL de mi repositorio es: $url_repo" >> "$archivo"
