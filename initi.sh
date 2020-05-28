#!/bin/bash
# -*- ENCODING: UTF-8 -*-

# Author: Victor Ruben Farias Rolon
# creado 26 febrero 2016
# modificaciones
# 26 de mayo 2020 autor Victor Ruben Farias Rolon
# rev-1
#Notas: para mandar o ejecutar un comando root sin comprometer los noveles de usuario etc se usa >| echo "passroot" | sudo -S ls /root && |< y se envia por medio de tuberias, esto normalmente no es recomendable en entornos no live
#notas: para notify-send "titulo" "texto" -i nameicono -u (low, normal, critical) -t 2000 milisegundos
# rutas generales del sistema

rutaP=/home/ghiatest/Pruebas
rutaH=/home/ghiatest/Pruebas/Hardware


#gnome-terminal -x sh rutA1/control_de_ventanas.sh


# Inician rutinas de pruebas
# Audio
amixer sset Master  100% unmute & amixer sset Speaker  100% unmute & amixer sset PCM  100% unmute & amixer sset Headphone  100% unmute
notify-send "Audio" "Se reproduce en modo suffle los archivos" -i audio-speakers -t 500
nohup gnome-terminal --title="mplayer" -- mplayer -shuffle /home/ghiatest/Música/*.mp4
notify-send "Audio" "Se abre Cava para vizualizar el audio" -i basilisk2 -t 500
nohup gnome-terminal --title="cava" -- cava

#Fin Audio

#Inicio de pruebas de Hardware
#Inicio de revision de carpetas
if ls  /home/ghiatest/Pruebas/ | grep Hardware >> /dev/null ;
  then
    notify-send "Alerta" "ya existia carpeta de Pruebas /home/ghiatest/Pruebas" -i abrt -t 500
  else
    gnome-terminal -- mkdir $rutaP
    gnome-terminal -- mkdir $rutaH
    notify-send "Alerta" "Se crea carpeta de pruebas /home/ghiatest/Pruebas/Hardware" -i folder-red-visiting -t 500
fi
#Inicio de revision de webcams
if ls /dev/video* -lh | grep "video0" >> /dev/null ;
  then
  nohup glmark2 &
  nohup io.elementary.camera &
  sleep 2

  #  sleep 1  nohup /home/$ruta0/$ruta1/lshw.sh & este se cambiara por otro script externo
  else
  nohup glmark2 &
  sleep 2

  #  nohup /home/$ruta0/$ruta1/lshw.sh & este se cambiara por otro script externo
fi
# notas para mover una ventana ya cambia la estructura wmctrl -r "nombre del programa" -t 5 , el nombre se saca con wmctrl -p -G -l (geometria, PID, escritorio)
sleep 2
notify-send "Alerta" "inicia ordenamiento de ventanas con wmctrl" -i minitube -t 500
wmctrl -r "io.elementary.camera" -t 5
wmctrl -r "io.elementary.camera" -e 10,324,10,700,603
wmctrl -r "cava" -t 4
wmctrl -r "mplayer" -t 4
wmctrl -r "glmark2" -t 3
wmctrl -r "glmark2" -e 10,276,117,800,600
sleep 2s;
# ciclo para realizar las capturas de pantalla de las estaciones
for i in 1 2 3 4 5
do
  wmctrl -s $i &
  notify-send "Captura" "captura de estación de trabajo $i" -i minitube -t 2700 &&
  sleep 2s
  scrot -m $rutaH"$i".png &&
  sleep 1.1s

done
wmctrl -s 0

# Fin de ciclo de capturas

notify-send "Inicia LSHW y busca llave OEM"

echo martha456 | sudo -S ls /root && sudo lshw -html > $rutaH/informe_de_Hardware.html
echo martha456 | sudo -S ls /root && sudo lshw -short > $rutaH/hardware_corto.txt
echo martha456 | sudo -S ls /root && sudo lsblk -fm > $rutaH/particiones.txt
echo martha456 | sudo -S ls /root && sudo cat /sys/firmware/acpi/tables/MSDM* >> $rutaH/hardware_corto.txt
echo martha456 | sudo -S ls /root && sudo ls -l /sys/firmware/acpi/tables >> $rutaH/hardware_corto.txt
echo martha456 | sudo -S ls /root && sudo lsblk -fm >> $rutaH/hardware_corto.txt


$ blog=$(zenity --list --text "Selecciona tus blogs..."
--title "Hipertextual" --checklist  --column "Blog" --column "URL"
FALSE http://alt1040.com
FALSE http://bitelia.com
FALSE http://motorfull.com | tr "|" " ")
