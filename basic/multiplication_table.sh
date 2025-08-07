#!/bin/bash

echo "Enter the number:"
read n

echo "Enter the number of times:"
read m

echo "The multiplication table of $n is"
for (( i=1 ; i<=$m ; i++ ))
do
    echo "$n * $i = `expr $i \* $n`"
done

