#!/bin/bash

findType() {
    sum=0
    
    for (( i=1 ; i<$1 ; i++ ))
    do
        if [ `expr $1 % $i` -eq 0 ]
        then
            sum=`expr $sum + $i`
        fi
    done
    
    if [ $sum -lt $1 ] #Tổng các ước nhỏ hơn chính số đó.
    then
        echo "$1 is a deficient number"
    elif [ $sum -gt $1 ] # Tổng các ước lớn hơn chính số đó.
    then
        echo "$1 is an abundant number"
    else #Tổng các ước đúng bằng chính số đó.
        echo "$1 is a perfect number"
    fi
}

read num

findType $num

