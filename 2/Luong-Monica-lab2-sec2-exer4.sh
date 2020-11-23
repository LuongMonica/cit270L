#!/bin/bash
num=$1
factorial=1
i=$num

while [ "$i" -gt "0" ]
do
  factorial=$(( factorial * $i ))
  i=$(( $i - 1 ))
done
echo "$num! = $factorial"
