#!/usr/bin/python3
import re

# get input
file = str(input("Enter a txt file: "))

# open file for reading
file1 = open(file, "r")

# read the file and put everything in the file into "file_content"
file_content = file1.read()

# find all digits in file
numbers = re.findall(r'[0-9]+', file_content)

file1.close()

print("All numbers in", file, ":", numbers)
