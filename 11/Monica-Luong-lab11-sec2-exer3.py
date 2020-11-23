#!/usr/bin/python3
# Write  a  python  script  that  asks  user  for  a  number
# and  then  checks  whether  the  number  belongs to the Fibonacci sequence or not


# fib function that generates Fibonacci numbers
# note: not very efficient; takes a while to calculate if the number is large ( > 35)
def fib(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1
    else:
        return fib(n-1) + fib(n-2)


num = int(input("Enter a number: "))
# if number inputted isn't the same as a Fib number returned, it's not in the sequence
if fib(num) != num:
    print(num, "is not part of the Fibonacci sequence")
elif fib(num) == num:
    print(num, "is part of the Fibonacci sequence")
