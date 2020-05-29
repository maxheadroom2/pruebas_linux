#!/bin/bash
# -*- ENCODING: UTF-8 -*-

fnUpdateFieldsSBR() {

    datoRam= grep -n "DIMM" $rutaL/hardware_corto.txt |  awk -F" " '{ for (x=3; x<=20; x++) printf("%s ", $x);printf("\n"); }'
    datoPro= grep -n "processor" $rutaL/hardware_corto.txt | awk -F" " '{ for (x=3; x<=9; x++) printf("%s ", $x);printf("\n"); }' >> $rutaL/perfil.txt
    datoDisc= grep -n "disk" $rutaL/hardware_corto.txt | awk -F" " '{ for (x=3; x<=9; x++) printf("%s ", $x);printf("\n"); }'     >> $rutaL/perfil.txt
    echo "1:${datoPro}"
    echo "3:${title:-MR}"
    echo "4:${lastName:-Smith}"
    echo "5:${gender:-Male}"
    echo "6:${ssn:-123456789}"

    echo "11:${firstName:-John}"
    echo "12:${suffix:-III}"
    echo "13:${dob:-10/10/1978}"
    notify-send "Inicia LSHW y busca llave OEM"
}
export -f fnUpdateFieldsSBR

yad \
--center \
--title="Analisis" \
--text="<span size=\"xx-large\">Caracteristicas de Equipo de Computo</span>\n" \
--form \
--width=750 \
--borders=5 \
--columns=2 \
--date-format="%m/%d/%Y" \
--align=right \
--field="Enterprise Unique ID" "${datoPro}" \
--field="Demographics:LBL" "" \
--field="Title:RO" "" \
--field="Last Name:RO" "" \
--field="Sex:RO" "" \
--field="Social Security Number:RO" "" \
--field="Options:LBL" "" \
--field="Show XML Request?:CHK" "FALSE" \
 \
--field "  Ver resultados!gtk-find:FBTN" "@bash -c \"fnUpdateFieldsSBR \"%16\" \"%8\" \"%1\"  \" " \
--field=":LBL" "" \
--field="First Name:RO" "" \
--field="Suffix:RO" "" \
--field="Date of Birth:RO" "" \
--field=".:LBL" "." \
--field=":LBL" "" \
--field="Show XML Response?:CHK" "FALSE" \
 \
--dialog-sep \
--button="Quit!gtk-quit:0"
