#!/bin/sh

GTKDIALOG=gtkdialog

MAIN_DIALOG='
<window>
    <vbox>
        <frame Description>
            <text>
                <label>This is an example window.</label>
            </text>
        </frame>
        <hbox>
            <button ok></button>
            <button cancel></button>
        </hbox>
    </vbox>
</window>
'
export MAIN_DIALOG

case $1 in
    -d | --dump) echo "$MAIN_DIALOG" ;;
    *) $GTKDIALOG --program=MAIN_DIALOG ;;
esac
