#!/bin/bash
# -*- ENCODING: UTF-8 -*-

notify-send "Script" "Apertura de Caracteristicas " -i terminal -t 2700
wmctrl -r "Caracteristicas" -t 1

fnUpdateFieldsSBR() {
    #para linux
    rutaP=/home/ghiatest/Pruebas # imagenes i/o otros datos
    rutaL=/home/ghiatest/Pruebas/Logs #Logs de txt y html
    #rutaL=/mnt/c/Users/sinte/github/pruebas_linux

    # para las busquedas avanzadas de dmidecode usar sudo dmidecode system | grep -A 2 'BIOS Information'  | grep Versio
    numSerie=$(cat $rutaL/processor.txt | grep  -A 7 'System Information' | grep -o 'Serial Number:.*' | cut -f2- -d: | sed -e 's/^\s*//')
    datoMod=$(cat $rutaL/processor.txt | grep  -A 7 'System Information' | grep -o 'SKU Number:.*' | cut -f2- -d: | sed -e 's/^\s*//')
    datoPro=$(grep -n "processor" $rutaL/hardware_corto.txt | awk -F" " '{ for (x=3; x<=9; x++) printf("%s ", $x);printf("\n"); }')
    datoPro1=$(cat $rutaL/system.txt | grep  -A 5 'Processor Information' | grep -o 'Socket Designation:.*' | cut -f2- -d:  | sed -e 's/^\s*//')
    datoRam=$(grep -n "DIMM" $rutaL/hardware_corto.txt |  awk -F" " '{ for (x=3; x<=20; x++) printf("%s ", $x);printf("\n"); }')
    datoRam1=$(cat $rutaL/processor.txt | grep  -A 5 'System Information' | grep -o 'tamaño:.*' | cut -f2- -d: | sed -e 's/^\s*//')
    datoDisc=$(grep -n "/0/1/0.0.0" $rutaL/hardware_corto.txt | awk -F" " '{ for (x=3; x<=9; x++) printf("%s ", $x);printf("\n"); }')
    datoPart=$(cat $rutaL/particiones.txt)

    datoMoth=$(cat $rutaL/system.txt | grep  -A 5 'Base Board Information' | grep -o 'Product Name:.*' | cut -f2- -d:  | sed -e 's/^\s*//')
    datoMoth1=$(cat $rutaL/system.txt | grep  -A 5 'Base Board Information' | grep -o 'Version:.*' | cut -f2- -d:  | sed -e 's/^\s*//')
    datoMoth2=$(cat $rutaL/system.txt | grep  -A 5 'Base Board Information' | grep -o 'Manufacturer:.*' | cut -f2- -d:  | sed -e 's/^\s*//')
    datoMoth3=$(cat $rutaL/system.txt | grep  -A 5 'Base Board Information' | grep -o 'Serial Number:.*' | cut -f2- -d:  | sed -e 's/^\s*//')

    datoBios=$(cat $rutaL/system.txt | grep  -A 4 'BIOS Information' | grep grep -o 'Version:.*' | cut -f2- -d:   | sed -e 's/^\s*//')
    datoBios1=$(cat $rutaL/system.txt | grep  -A 4 'BIOS Information' | grep -o 'Vendor:.*' | cut -f2- -d:   | sed -e 's/^\s*//')
    datoBios2=$(cat $rutaL/system.txt | grep  -A 4 'BIOS Information' | grep -o 'Release:.*' | cut -f2- -d:  | sed -e 's/^\s*//')


    echo "2:${numSerie:- }"
    echo "3:${datoMod:- }"  #modelo pc SKU- number pcghia
    echo "4:${datoPro:- }"
    echo "5:${datoPro1:- }"
    echo "6:${datoRam:- }"
    echo "7:${datoRam1:- }"
    echo "8:${datoPart:- }"
    echo "13:${datoMoth:- }"   #Modelo
    echo "14:${datoMoth1:- }"  #Version Mother
    echo "15:${datoMoth2:- }"  #Fabricante
    echo "16:${datoMoth3:- }"  #Serie
    echo "17:${xx:- }"  #
    echo "18:${datoBios1:- }"
    echo "19:${x:- }"


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
--field="Informacion General del Equipo:LBL" "" \
--field="Numero de Serie:RO" "" \
--field="Modelo Equipo:RO" "" \
--field="Procesador:RO" "" \
--field="Socket Designation:RO" "" \
--field="Memoria Ram total:RO" "" \
--field="Memorias instaladas:RO" "" \
--field="Disco duro:RO"  "" \
--field="Options:LBL" "" \
--field="Show XML Request?:CHK" "FALSE" \
 \
--field "  Ver Informacion PC!gtk-find:FBTN" "@bash -c \"fnUpdateFieldsSBR \"%16\" \"%8\" \"%1\"  \" " \
--field=":LBL" "" \
--field="Modelo Motherboard:RO" "" \
--field="Ver. de Motherboard:RO" "" \
--field="Fabr. de Motherboard:RO" "" \
--field="Num serie Motherboard:RO" "" \
--field="Fabricante del bios:RO" "" \
--field="Version del BIOS:RO" "" \
--field="Fecha ver Bios:RO" "" \
--field=".:LBL" "." \
--field=":LBL" "" \
--field="Show XML Response?:CHK" "FALSE" \
 \
--dialog-sep \
--button="Quit!gtk-quit:0"
