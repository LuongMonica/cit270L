#!/usr/bin/python3

# get input
file = str(input("Enter a txt file you want to count the number of lines for: "))

# open file for reading
lines = 0
file1 = open(file, "r")

# read the file and put everything in the file into "file_content"
file_content = file1.read()

# split that list by newline char
content_list = file_content.split('\n')

# every split is a line
for i in content_list:
  if i:
    lines +=1

file1.close()

print("Number of lines in", file, ":", lines)
