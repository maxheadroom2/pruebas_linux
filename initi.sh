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

rutaP=/home/ghiatest/Pruebas # imagenes i/o otros datos
rutaL=/home/ghiatest/Pruebas/Logs #Logs de txt y html


#gnome-terminal -x sh rutA1/control_de_ventanas.sh

# Seccion para matar procesos y limpiar directorios y archivos, esto se puede dejar o anular
killall mplayer
killall cava
killall glmark2
killall io.elementary.camera
killall Caracteristicas
killall terminal_1
rm -r $rutaP
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
if ls  /home/ghiatest/Pruebas/ | grep Logs >> /dev/null ;
  then
    notify-send "Alerta" "ya existia carpeta de Pruebas /home/ghiatest/Pruebas" -i abrt -t 500
  else
    gnome-terminal -- mkdir $rutaP
    gnome-terminal -- mkdir $rutaL
    notify-send "Alerta" "Se crea carpeta de pruebas /home/ghiatest/Pruebas/Logs" -i folder-red-visiting -t 500
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
  scrot -m $rutaL"$i".png &&
  sleep 1.1s

done
wmctrl -s 0

# Fin de ciclo de capturas

notify-send "Inicia LSHW y busca llave OEM"

echo martha456 | sudo -S ls /root && sudo lshw -html > $rutaL/informe_de_Hardware.html
echo martha456 | sudo -S ls /root && sudo lshw -short > $rutaL/hardware_corto.txt
echo martha456 | sudo -S ls /root && sudo lsblk -fm > $rutaL/particiones.txt
echo martha456 | sudo -S ls /root && sudo cat /sys/firmware/acpi/tables/MSDM* >> $rutaL/hardware_corto.txt
echo martha456 | sudo -S ls /root && sudo ls -l /sys/firmware/acpi/tables >> $rutaL/hardware_corto.txt
echo martha456 | sudo -S ls /root && sudo lsblk -fm > $rutaL/listado_de_disco_particiones.txt
echo martha456 | sudo -S ls /root && sudo dmidecode system > $rutaL/system.txt
echo martha456 | sudo -S ls /root && sudo lshw > $rutaL/lshw.txt

datoRam= grep -n "DIMM" $rutaL/hardware_corto.txt |  awk -F" " '{ for (x=3; x<=20; x++) printf("%s ", $x);printf("\n"); }'  > $rutaL/perfil.txt
datoPro= grep -n "processor" $rutaL/hardware_corto.txt | awk -F" " '{ for (x=3; x<=9; x++) printf("%s ", $x);printf("\n"); }' >> $rutaL/perfil.txt
datoDisc= grep -n "disk" $rutaL/hardware_corto.txt | awk -F" " '{ for (x=3; x<=9; x++) printf("%s ", $x);printf("\n"); }'     >> $rutaL/perfil.txt
#datoPart= grep -n "disk" $rutaL/listado_de_disco_particiones.txt                                                              >> $rutaL/perfil.txt se omite para añadir en otra sección

echo $datoRam
echo $datoPro
echo $datoDisc
echo $datoPart

#zenity --question --text "Desea Continuar"

nohup xterm -hold -e --title="terminal_1" 'bash /home/ghiatest/git/yad.shr' &
sleep 2s
wmctrl -r "terminal_1" -t 1
wmctrl -r "Caracteristicas" -t 1

# sh /home/ghiatest/git/yad.sh
# cat $rutaL/perfil.txt  | zenity --text-info --title "Caracteristicas" lo mando a un .sh externo


notify-send "Termino" "Termina initi.sh"
