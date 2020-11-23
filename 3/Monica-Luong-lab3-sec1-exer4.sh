#!/bin/bash

time_date=$(date +"%m%d%Y_%H%M%S")
file="test_$time_date.log"

for i in {1..5000}
  do
    updated_td=`date +"%m-%d-%Y %H:%M:%S"`
    echo "$updated_td - $i" >> $file
done

