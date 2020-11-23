#!/bin/sh
file=$1
if [ -e $file ]
then
  echo "File exists"
else
  echo "Files doesn't exist"
fi

if [ -s $file ]
then
  echo "File size is not zero"
else
  echo "File size is zero"
fi

if [ -d $file ]
then
  echo "This is a directory"
else
  echo "This isn't a directory"
fi

if [ -w $file ]
then
  echo "File has write permission"
else
  echo "Files doesn't have write permission"
fi

if [ -x $file ]
then
  echo "File has execute permission"
else
  echo "Files doesn't have execute permission"
fi
