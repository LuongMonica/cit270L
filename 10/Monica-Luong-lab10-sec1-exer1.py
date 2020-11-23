#!/usr/bin/python3

user_input = str(input("Enter a string: "))
file = open("file.txt", "a")
file.write(user_input + "\n")
file.close()
print("String added to file.txt")
