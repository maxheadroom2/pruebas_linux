#!/bin/bash
# -*- ENCODING: UTF-8 -*-

rutaP=/home/ghiatest/Pruebas # imagenes i/o otros datos
rutaL=/home/ghiatest/Pruebas/Logs #Logs de txt y html


cat $rutaL/perfil.txt  | zenity --text-info --title "Caracteristicas"
