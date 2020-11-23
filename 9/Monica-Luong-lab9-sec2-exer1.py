#!/usr/bin/python3
vowel_count = 0
space_count = 0

user_input = str(input("Enter a string: "))

for i in user_input:
  if i in ('a','e','i','o','u'):
    vowel_count+=1
  elif i == ' ':
    space_count+=1

print("length of string: ",len(user_input))
print("number of vowels: ", vowel_count)
print("number of spaces: ", space_count)
