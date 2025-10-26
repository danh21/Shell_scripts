#!/bin/bash

squareroot() {
    res=$(echo "scale=2 ; sqrt($1)" | bc)
    echo $res
}

echo "Enter a number"
read num
echo -n "The square root of $num is "
squareroot $num
