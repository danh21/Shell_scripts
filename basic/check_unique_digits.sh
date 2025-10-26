#!/bin/bash

# check if the number has unique digits
read num

isLucky=1

while [ $num -ne 0 ]
do
    remainder=`expr $num % 10`
    arr+=($remainder)
    num=`expr $num / 10`
done

for (( i=0 ; i<`expr ${#arr[*]} - 1` ; i++ ))
do
    for (( j=`expr $i + 1` ; j<${#arr[*]} ; j++ ))
    do
        if [ ${arr[$i]} -eq ${arr[$j]} ]
        then
            isLucky=0
            break
        fi
    done
    
    if [ $isLucky -eq 0 ]
    then
        echo "no"
        break
    fi
done

if [ $isLucky -eq 1 ]
then
    echo "yes"
fi
