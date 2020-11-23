#!/bin/bash
#Write a script that creates an archive (.tar.gz) of log files created before a certain date & time and then delete .log files.

# check if there's an arg (dir they wanna search)
dir=$1
if [[ "$1" == "" ]] ; then
  echo "No argument given, put the directory you want to search"
  exit 1
fi

# find .log files that were modified before Sept 1 and output to tmp.txt 
find "$dir" -type f -newermt "2000-01-01 00:00:00" -not -newermt "2020-09-01 00:00:00" \
-regextype sed -regex ".*/*\.log" 2>/dev/null > tmp.txt

# check if there were any .log files that matched, if none: exit 
if [[ -e tmp.txt || -s tmp.txt ]] ; then
  echo "No .log files found that were modified before Sept 1"
  echo "Exiting script..."
  exit 0
fi

# read tmp.txt and put it into the array: files
readarray -t files < tmp.txt 

# create a tar of the files
tar -zcvf archived_logs.tar.gz "${files[@]}"  

# remove those log files and the temp file 
rm -f "${files[@]}" ; rm -f tmp.txt
