#!/usr/bin/python3
user_input = int(input("Enter a number: "))

def factorial(num):
  "info: takes in number, does factorial and returns result"
  if num ==1:
    return num
  else:
    return num*factorial(num-1)

if user_input < 0:
  print("Can't compute factorial of negative num")
elif user_input == 0:
  print("Factorial of 0 is 1")
else:
  print(user_input, "! is", factorial(user_input))
