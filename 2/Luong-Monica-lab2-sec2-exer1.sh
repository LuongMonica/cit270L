#!/bin/sh
num1=$1
num2=$2
sum=$(( $num1 + $num2 ))
diff=$(( $num1 - $num2 ))
mult=$(( $num1 * $num2 ))
div=$(( $num1 / $num2 ))
echo "Num1=$num1, Num2=$num2"
echo "Sum=$sum, Diff=$diff, Mult=$mult, Div=$div"
