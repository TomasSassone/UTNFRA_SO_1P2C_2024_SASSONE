#!/bin/bash

# Creo los grupos Alumno y Profesores

sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores

# Creo los usuarios (los 3 alumnos con un loop for, y un solo profesor)
# Les asigno ademas su grupo correspondiente y la misma contraseña que mi usuario (whoami) usando el hash

for i in {1..3}; do
	sudo useradd -m -s /bin/bash -G p1c2_2024_gAlumno -c "Alumno $i" -p "$(sudo grep $whoami /etc/shadow | awk -F ':' '{print $2}')" p1c2_2024_A$i
done

sudo useradd -m -s /bin/bash -G p1c2_2024_gProfesores -c "Profesor 1" -p "$(sudo grep $whoami /etc/shadow | awk -F ':' '{print $2}')" p1c2_2024_P1

# asigno los permisos correspondientes para cada usuario

# Permisos para alumno_1
sudo chown p1c2_2024_A1:p1c2_2024_A1 /Examenes-UTN/alumno_1
sudo chmod 750 /Examenes-UTN/alumno_1

# Permisos para alumno_2
sudo chown p1c2_2024_A2:p1c2_2024_A2 /Examenes-UTN/alumno_2
sudo chmod 640 /Examenes-UTN/alumno_2

#Permisos para alumno_3
sudo chown p1c2_2024_A3:p1c2_2024_A3 /Examenes-UTN/alumno_3
sudo chmod 700 /Examenes-UTN/alumno_3

#Permisos para profesores
sudo chown p1c2_2024_P1:p1c2_2024_P1 /Examenes-UTN/profesores
sudo chmod 770 /Examenes-UTN/profesores

# Creo archivo validar.txt en cada carpeta con su respectivo usuario
for i in {1..3}; do
	echo "Usuario: $(whoami)" > /Examenes-UTN/alumno_$i/validar.txt
done

echo "Usuario: $(whoami)" > /Examenes-UTN/profesores/validar.txt


