#!/usr/bin/python3
import re
# Write a python script that asks user for email address.
# It then extracts the username and domain name and displays each individually

email = str(input("Enter an email address: "))

# input validation
if "@" in email:
    pass
else:
    email = str(input("Enter a valid email address: "))
    while "@" not in email:
        email = str(input("Enter a valid email address: "))

# split the email up into username and domain
x = email.split("@")
username = x[0]
domain = x[1]
print("username:", username)
print("domain:", domain)


