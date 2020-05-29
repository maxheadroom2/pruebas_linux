#!/bin/bash
# -*- ENCODING: UTF-8 -*-

fnUpdateFieldsSBR() {
    echo "1:${title:-MR}"
    echo "4:${lastName:-Smith}"
    echo "5:${gender:-Male}"
    echo "6:${ssn:-123456789}"

    echo "11:${firstName:-John}"
    echo "12:${suffix:-III}"
    echo "13:${dob:-10/10/1978}"
}
export -f fnUpdateFieldsSBR

yad \
--center \
--title="Caracteristicas" \
--text="<span size=\"xx-large\">Caracteristicas Equipo de Computo</span>\n" \
--form \
--width=550 \
--borders=5 \
--columns=2 \
--date-format="%m/%d/%Y" \
--align=right \
--field="Informacion de Hardware:LBL" "" \
--field="Modelo:RO"" """ \
--field="Serie:RO" "" \
--field="Disco Duro:RO" "" \
--field="Memoria Ram:RO" "" \
--field="Detalles particiones:LBL" "" \
 \
--field "  Actualizar!gtk-find:FBTN" "@bash -c \"fnUpdateFieldsSBR \"%16\" \"%8\" \"%1\"  \" " \
--field=":LBL" "" \
--field="Procesador:RO" "" \
--field="Tecnico:RO" "" \
--field="Modelo de Motherboard:RO" "" \
--field=".:LBL" "." \
--field=":LBL" "" \

 \
--dialog-sep \
