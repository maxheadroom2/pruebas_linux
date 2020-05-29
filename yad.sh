#!/bin/bash
# -*- ENCODING: UTF-8 -*-

fnUpdateFieldsSBR() {
    echo "3:${title:-MR}"
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
--title="Find Patient by EUID" \
--text="<span size=\"xx-large\">Find Patient Details by EUID</span>\n" \
--form \
--width=550 \
--borders=5 \
--columns=2 \
--date-format="%m/%d/%Y" \
--align=right \
--field="Enterprise Unique ID" "${USAPatXEUIDX:-0001234567}" \
--field="Demographics:LBL" "" \
--field="Title:RO" "" \
--field="Last Name:RO" "" \
--field="Sex:RO" "" \
--field="Social Security Number:RO" "" \
--field="Options:LBL" "" \
--field="Show XML Request?:CHK" "FALSE" \
 \
--field "  Search!gtk-find:FBTN" "@bash -c \"fnUpdateFieldsSBR \"%16\" \"%8\" \"%1\"  \" " \
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
