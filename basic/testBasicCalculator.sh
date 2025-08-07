#!/bin/bash

echo "Price of old scooter:"
read oldPrice

echo "Repair amount:"
read repairPrice

echo "Selling price:"
read sellPrice

currentPrice=`expr $oldPrice + $repairPrice`
percent=$(bc <<< "scale=2; ($sellPrice - $currentPrice) * 100 / $currentPrice")

printf "Gain percentage is %.2f\n" $percent

