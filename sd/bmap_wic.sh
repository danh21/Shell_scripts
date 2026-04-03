#!/bin/bash

sd="/dev/sdb"
device=$1

if [ "$device" = "g3s" ]; then
    bmap="core*rzg3s*.wic.bmap"
	gz="core*rzg3s*.wic.gz"
elif [ "$device" = "v2h" ]; then
    bmap="core*rzv2h*.wic.bmap"
	gz="core*rzv2h*.wic.gz"
elif [ "$device" = "g3e" ]; then
    bmap="core-image-*-smarc-rzg3e*.wic.bmap"
	gz="core-image-*-smarc-rzg3e*.wic.gz"
elif [ "$device" = "v2n" ]; then
    bmap="core-image-*-rzv2n*.wic.bmap"
	gz="core-image-*-rzv2n*.wic.gz"
elif [ "$device" = "g2l" ]; then
    bmap="core*rzg2l.*.wic.bmap"
	gz="core*rzg2l.*.wic.gz"
elif [ "$device" = "g2lc" ]; then
    bmap="core-image-*-smarc-rzg2lc*.wic.bmap"
	gz="core-image-*-smarc-rzg2lc*.wic.gz"
elif [ "$device" = "g2ul" ]; then
    bmap="core-image-*-smarc-rzg2ul*.wic.bmap"
	gz="core-image-*-smarc-rzg2ul*.wic.gz"
elif [ "$device" = "g3l" ]; then
    bmap="core-image-*-smarc-rzg3l*.wic.bmap"
	gz="core-image-*-smarc-rzg3l*.wic.gz"
else
	echo "nothing"
fi

sudo bmaptool copy --bmap ${bmap} ${gz} ${sd}

sync