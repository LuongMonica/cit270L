#!/bin/bash                    

echo -n "Enter a number: " ; read num

function line() { 
  # print ". " with a width of 1+num, keep going until you reach the first column, then quit printing, also delete the newlines 
  printf "%$(($1+num))s\n" "$(yes ". " | sed ${1}q | tr -d \\n)"; 
}

# loop from 1..num...num - 1...1 calling line() each time
for i in $(seq $num) $(seq $((num-1)) -1 1); do line $i; 
  # if the counter is num then call line() again
  if [[ "$i" == "$num" ]] ; then line $i ; fi ; done
