#!/bin/bash

fiboLastDigit() {
    n=2
    n1=1
    n2=1
    
    if [ $1 -eq 0 ]
    then
        fibo=0
    elif [ $1 -eq 1 ] || [ $1 -eq 2 ]
    then
        fibo=1
    else
        while [ $n -ne $1 ]
        do
            ((n++))
            fibo=`expr $n1 + $n2`
            n1=$n2
            n2=$fibo
        done
    fi
    
    lastDigit=`expr $fibo % 10`
    echo $lastDigit
}

read num

fiboLastDigit $num

