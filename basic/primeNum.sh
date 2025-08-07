#!/bin/bash

echo "Enter the number:"
read num
isPrime=1

if [ $num -le 1 ]
then
    isPrime=0 
fi

for (( i=2 ; i<$num ; i++ ))
do
    if [ `expr $num % $i` -eq 0 ]
    then
        isPrime=0
        break
    fi
done

if [ $isPrime -eq 1 ]
then
    echo "$num is a prime number"
else
    echo "$num is not a prime number"
fi

