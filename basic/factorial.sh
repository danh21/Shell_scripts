#!/bin/bash

factorial() {
    fac=1
    for (( i=2 ; i<=$1 ; i++ ))
    do
        fac=$((fac * i))
    done
    echo "$fac"
}

read num

factorial $num
