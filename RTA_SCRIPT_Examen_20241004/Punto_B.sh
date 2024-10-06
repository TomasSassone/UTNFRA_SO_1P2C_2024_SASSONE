#!/bin/bash

# Variables
DISK="/dev/sdc"
MOUNT_BASE="/mnt/particion"

# Creo las particiones
echo "Creando 10 particiones en $DISK..."
{
	for i in {1..10}; do
		echo "n" #creo nueva particion
		echo ""  #uso el n de particion default
		echo "+1G" #tamaño de la particion (1/10 del disco, 1GB)
	done
	echo "w" #escribo los cambios y salgo
} | sudo fdisk $DISK

# Formateo las particioness
echo "Formateando las particiones con ext4..."
for i in {1..10}; do
	PART="${DISK}p$i"
	sudo mkfs.ext4 $PART
done

# Monto las particiones de forma persistente
echo "Montando las particiiones..."
sudo mkdir -p $MOUNT_BASE # creo el directorio base de montaje

for i in {1..10}; do
	MOUNT_POINT="$MOUNT_BASE/particion_$i"
	sudo mkdir -p $MOUNT_POINT # creo el directorio de montaje
	sudo mount "${DISK}p$i" $MOUNT_POINT #monto la particion

	#agrego al fstab para montaje persistente
	echo "${DISK}p$i $MOUNT_POINT ext4 defaults 0 2" | sudo tee -a /etc/fstab
done

echo "Proceso completado."
