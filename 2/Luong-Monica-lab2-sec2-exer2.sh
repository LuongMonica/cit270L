#!/bin/bash
ext=$1
case $ext in 
  txt) echo "$ext is text file"
  ;;
  exe) echo "$ext is an executable file"
  ;;
  jpg) echo "$ext is an Joint Photographic experts Group (image) file"
  ;;
  mov) echo "$ext is movie file (QuickTime File)"
  ;;
  *) echo "$ext is an unknown file type"
  ;;
esac
