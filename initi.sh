#!/bin/bash
# -*- ENCODING: UTF-8 -*-

# Author: Victor Ruben Farias Rolon
# creado 26 febrero 2016
# modificaciones
# 26 de mayo 2020 autor Victor Ruben Farias Rolon
# rev-1
#Notas: para mandar o ejecutar un comando root sin comprometer los noveles de usuario etc se usa >| echo "passroot" | sudo -S ls /root && |< y se envia por medio de tuberias, esto normalmente no es recomendable en entornos no live

# rutas generales del sistema

rutA1=/home/ghiatest/rutinas


#gnome-terminal -x sh rutA1/control_de_ventanas.sh


# Inician rutinas de pruebas
# Audio
amixer sset Master  100% unmute & amixer sset Speaker  100% unmute & amixer sset PCM  100% unmute & amixer sset Headphone  100% unmute
notify-send "Audio" "Se reproduce en modo suffle los archivos" -i audio-speakers
notify-send "Audio" "Se abre Cava para vizualizar el audio" -i basilisk2
nohup gnome-terminal -x mplayer -shuffle /home/ghiatest/Música/*.mp3

#Fin Audio

#Inicio de pruebas de Hardware

if ls  /home/ghiatest/Pruebas/ | grep Hardware >> /dev/null ;
then
  notify-send "Alerta" "ya existia carpeta de pruebas" -i abrt
else
  mkdir /home/ghiatest/Pruebas/Hardware
  notify-send "Alerta" "Se crea carpeta de pruebas" -i folder-red-visiting
fi
