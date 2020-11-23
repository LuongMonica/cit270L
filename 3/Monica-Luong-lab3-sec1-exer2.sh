#!/bin/bash
for file in `ls | grep "\.txt"`
do
  filename=${file%%.*}
  mv "$file" ${filename##*/}.txt.done
done
