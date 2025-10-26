#!/bin/bash

printValue() {
    int=`expr $1 / $2`

    if [ `expr $1 % $2` -eq 0 ]
    then
        echo $int
    elif [ $1 -gt $2 ]
    then
        numerator=$(($1 - $int * $2))
        denominator=$2
        div=$numerator
        
        while [ $div -ne 1 ]
        do
            if (( numerator % div == 0 && denominator % div == 0 )) 
            then
                numerator=`expr $numerator / $div`
                denominator=`expr $denominator / $div`
            fi
            ((div--))                   
        done
        
        echo "$int $numerator/$denominator"
    else
        numerator=$1
        denominator=$2
        div=$numerator
        
        while [ $div -ne 1 ]
        do
            if (( numerator % div == 0 && denominator % div == 0 )) 
            then
                numerator=`expr $numerator / $div`
                denominator=`expr $denominator / $div`
            fi
            ((div--))                   
        done
        
        echo "$numerator/$denominator"
    fi
}

read n1
read n2

printValue $n1 $n2

