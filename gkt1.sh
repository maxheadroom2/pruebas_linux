#!/bin/bash
# -*- ENCODING: UTF-8 -*-

MAIN_DIALOG_FILE=/tmp/ex01.gtkd

cat <<-'EOUIDFEINITION' > ${MAIN_DIALOG_FILE}
<window>
  <vbox>
    <text>
      <label>I am a window.</label>
    </text>
    <button ok></button>
  </vbox>
</window>
EOUIDFEINITION

case ${1} in
    -d | --dump) cat ${MAIN_DIALOG_FILE} ;;
    *) gtkdialog --center --file=${MAIN_DIALOG_FILE} ;;
esac

rm -f ${MAIN_DIALOG_FILE}
EOSCRIPT
