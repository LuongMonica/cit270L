#!/usr/bin/python3
# this script gets name of a server log file, 
# reads it and censors the first 3 segments of all IP addrs
# i.e: 123.4.56.78 --> xxx.xxx.xxx.78

# used for regex
import re
# used for renaming file
import os

# get input for server log file
log = str(input("Enter the server log file you want to censor the IP addresses of: "))

# read inputted server log file,
# make a temp file
# mask the first 3 segments of all IP addrs and write that to the temp file
file = open(log, "r+")
temp_file = open("tmp.txt", "w")
content = file.read()

new_content= re.sub(r"\b(\d{1,3}\.){3}\b", r"xxx.xxx.xxx.", content)
temp_file.write(new_content)

file.close()
temp_file.close()

# get rid of temp file, rename it to the original log file
os.rename("tmp.txt", log)

print(str(log) + " has been censored, check it out")
