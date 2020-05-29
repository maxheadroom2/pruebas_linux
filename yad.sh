#!/bin/bash
# -*- ENCODING: UTF-8 -*-

echo "1:${title:-MR}"
echo "2:${lastName:-Smith}"
echo "3:${gender:-Male}"
echo "6:${ssn:-123456789}"

echo "11:${firstName:-John}"
echo "12:${suffix:-III}"
echo "13:${dob:-10/10/1978}"

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
--field=":LBL" "" \
--field="Procesador:RO" "" \
--field="Tecnico:RO" "" \
--field="Modelo de Motherboard:RO" "" \
--field=".:LBL" "." \
--field=":LBL" "" \

 \
--dialog-sep \
--button="Quit!gtk-quit:0"
