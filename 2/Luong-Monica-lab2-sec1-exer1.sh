#!/bin/sh
echo -n "Filename? "; read FILE
touch ./$FILE
echo "$FILE has been created"
