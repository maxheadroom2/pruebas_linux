#!/bin/bash
# -*- ENCODING: UTF-8 -*-



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
--field="Modelo:RO"prueba \
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
