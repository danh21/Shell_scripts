#!/bin/bash

computeNumber() {
    count=0
    n=$1
    if [ $n -eq 0 ]
    then
        echo 1
    else
        while [ $n -ne 0 ]
        do
            n=$((n/10))    
            ((count++))
        done
        echo $count
    fi
}

echo "Enter the value of n"
read num
echo -n "The number of digits is "
computeNumber $num

