#!/bin/bash

read n1
read operator
read n2

case $operator in
    "+") echo "The sum is `expr $n1 + $n2`"
    ;;
    "-") echo "The difference is `expr $n1 - $n2`"
    ;;
    "*") echo "The product is `expr $n1 \* $n2`"
    ;;
    "/") echo "The quotient is `expr $n1 / $n2`"
    ;;
    "%") echo "The remainder is `expr $n1 % $n2`"
    ;;
    *) echo "Invalid Input"
    ;;
esac

