#!/bin/bash

echo "Enter a character:"
read c

if [[ $c = [AEIOUaeiou] ]]
then
    	echo "Vowel"
elif [[ $c = [BCDFGHJKLMNPQRSTVWXYZbcdfghjklmnpqrstvwxyz] ]]
then
        echo "Consonant"
else
    	echo "Not an alphabet"
fi

