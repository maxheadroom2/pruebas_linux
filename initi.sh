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
nohup gnome-terminal -- cava
nohup gnome-terminal -- mplayer -shuffle /home/ghiatest/Música/*.mp4
notify-send "Audio" "Se reproduce en modo suffle los archivos"
