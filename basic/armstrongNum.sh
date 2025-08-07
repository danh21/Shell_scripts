#!/bin/bash

echo "Enter the number:"
read num 
temp=$num
sum=0

while [ $temp -ne 0 ]
do
    remainder=`expr $temp % 10`
    temp=`expr $temp / 10`
    sum=`expr $sum + $remainder \* $remainder \* $remainder`
done

if [ $sum -eq $num ]
then
    echo "$num is an armstrong number"
else
    echo "$num is not an armstrong number"
fi

