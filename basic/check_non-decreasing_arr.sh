#!/bin/bash

# check if the digits of a given number are in non-decreasing order
read num

isNondecreasing=1

while [ $num -ne 0 ]
do
    remainder=`expr $num % 10`
    arr=($remainder ${arr[@]})
    num=`expr $num / 10`
done

# echo "${arr[@]}"

for (( i=0 ; i<`expr ${#arr[*]} - 1` ; i++ ))
do
    if [ ${arr[$i]} -gt ${arr[$i+1]} ]
    then
        isNondecreasing=0
        echo "no"
        break
    fi
done

if [ $isNondecreasing -eq 1 ]
then
    echo "yes"
fi
