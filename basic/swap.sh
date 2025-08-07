#!/bin/bash

echo "Enter the value of a"
read a

echo "Enter the value of b"
read b

echo "Before swapping: a = $a ; b = $b"

temp=$a
a=$b
b=$temp

echo "After swapping: a = $a ; b = $b"
