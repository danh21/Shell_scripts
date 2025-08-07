#!/bin/bash

read num

dozens=`expr $num / 10`
units=`expr $num % 10`

if (( (dozens==0 || dozens==1 || dozens==6 || dozens==8 || dozens==9) && (units==0 || units==1 || units==6 || units==8 || units==9) ))
then
    echo "yes"
else
    echo "no"
fi

