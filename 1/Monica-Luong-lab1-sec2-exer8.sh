#!/bin/sh
head -1 aboutme.txt
echo 
grep "CIT210/L" aboutme.txt > myfav.txt
echo
less myfav.txt
echo
find . | grep -lr "CIT210/L"
echo
grep -v 'CIT210/L\|Monica Luong' aboutme.txt
echo
