#!/bin/bash

computePower() {
    res=$1
    if [ $2 -eq 0 ]
    then
        res=1
    else
        for (( i=1 ; i<$2 ; i++ ))
        do
            res=$((res * $1))
        done
    fi
    echo $res
}

echo "Enter the value of a"
read a
echo "Enter the value of n"
read n
echo -n "The value of $a power $n is "
computePower $a $n

