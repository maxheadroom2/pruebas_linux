#!/bin/bash
# -*- ENCODING: UTF-8 -*-

title="Hola"

fnUpdateFieldsSBR() {
    #para linux
    rutaP=/home/ghiatest/Pruebas # imagenes i/o otros datos
    rutaL=/home/ghiatest/Pruebas/Logs #Logs de txt y html
    #rutaL=/mnt/c/Users/sinte/github/pruebas_linux

    datoRam=$(grep -n "DIMM" $rutaL/hardware_corto.txt |  awk -F" " '{ for (x=3; x<=20; x++) printf("%s ", $x);printf("\n"); }')
    datoPro=$(grep -n "processor" $rutaL/hardware_corto.txt | awk -F" " '{ for (x=3; x<=9; x++) printf("%s ", $x);printf("\n"); }')
    datoDisc=$(grep -n "/0/1/0.0.0" $rutaL/hardware_corto.txt | awk -F" " '{ for (x=3; x<=9; x++) printf("%s ", $x);printf("\n"); }')
    datoPart=$(cat $rutaL/particiones.txt)
    echo "1:${numSerie:-343434}"
    echo "3:${datoMod:-PCGHIA-1533}"
    echo "3:${datoPro:- }"
    echo "4:${datoRam:- }"
    echo "5:${datoDisc:- }"
    echo "6:${datoPart:- }"

    echo "11:${nameTec:-ERK}"
    echo "12:${modelMoth:-III}"
    echo "13:${verMoth:-10/10/1978}"
}
export -f fnUpdateFieldsSBR

yad \
--center \
--title="Caracteristicas" \
--text="<span size=\"xx-large\">Detalles de Equipo de Computo</span>\n" \
--form \
--width=1000 \
--borders=5 \
--columns=2 \
--date-format="%m/%d/%Y" \
--align=right \
--field="Numero de Serie:RO" "" \
--field="Modelo:RO" "" \
--field="Procesador:RO" "" \
--field="Memoria Ram total:RO" "" \
--field="Disco duro:RO" "" \
--field="Particiones:TXT"  "${datoPart}" \
--field="Options:LBL" "" \
--field="Show XML Request?:CHK" "FALSE" \
 \
--field "  Ver Informacion PC!gtk-find:FBTN" "@bash -c \"fnUpdateFieldsSBR \"%16\" \"%8\" \"%1\"  \" " \
--field=":LBL" "" \
--field="Tenico:RO" "" \
--field="Motherboard:RO" "" \
--field="Ver. Motherboard:RO" "" \
--field="Version del BIOS:RO" "" \
--field=".:LBL" "." \
--field=":LBL" "" \
--field="Show XML Response?:CHK" "FALSE" \
 \
--dialog-sep \
--button="Quit!gtk-quit:0"
