#!/bin/bash

echo "Enter the number :"
read inum
onum=0

while [ $inum -ne 0 ]
do
    onum=`expr $onum \* 10 + $inum % 10`
    inum=`expr $inum / 10`
done

echo "Reverse of the number is $onum"

