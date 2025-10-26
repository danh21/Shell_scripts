#!/bin/bash

echo "Arguments :"

args=($*)

for (( i=0 ; i<$# ; i++ ))
do
    echo ${args[$i]}
done

echo "The number of arguments is $#"

