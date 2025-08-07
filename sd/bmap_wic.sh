#!/bin/bash

sd="/dev/sdb"
device=$1

if [ "$device" = "g3s" ]; then
    bmap="core-image-minimal-smarc-rzg3s*.wic.bmap"
	gz="core-image-minimal-smarc-rzg3s*.wic.gz"
elif [ "$device" = "v2h" ]; then
    bmap="core-image-minimal-rzv2h-evk-ver1*.wic.bmap"
	gz="core-image-minimal-rzv2h-evk-ver1*.wic.gz"
elif [ "$device" = "g3e" ]; then
    bmap="core-image-minimal-smarc-rzg3e*.wic.bmap"
	gz="core-image-minimal-smarc-rzg3e*.wic.gz"
elif [ "$device" = "v2n" ]; then
    bmap="core-image-minimal-rzv2n-evk*.wic.bmap"
	gz="core-image-minimal-rzv2n-evk*.wic.gz"
elif [ "$device" = "g2l" ]; then
    bmap="core-image-minimal-smarc-rzg2l*.wic.bmap"
	gz="core-image-minimal-smarc-rzg2l*.wic.gz"
elif [ "$device" = "g2lc" ]; then
    bmap="core-image-minimal-smarc-rzg2lc*.wic.bmap"
	gz="core-image-minimal-smarc-rzg2lc*.wic.gz"
else
	echo "nothing"
fi

sudo bmaptool copy --bmap ${bmap} ${gz} ${sd}

sync