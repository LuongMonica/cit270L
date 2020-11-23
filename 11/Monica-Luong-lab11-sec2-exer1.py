#!/usr/bin/python3
from random import randint

# Write  a  script  that  randomly  chooses  a  number  between  1  and  100.
# It  then  asks  user  to  guess  it.  Upon  reading  the  user  input,
# it  compares  with  random  number  and  tell  user  to  guess higher to lower.
# It repeats until user guess number correctly.

print("Let's play a game!")
num = randint(1, 100)
guess = int(input("Guess the number. It's between 1 and 100: "))
while guess != num:
    if guess <= 1 or guess >= 100:
        guess = int(input("Guess again! Remember the number is between 1 and 100: "))
    elif guess < num:
        guess = int(input("Incorrect! Guess higher: "))
    elif guess > num:
        guess = int(input("Incorrect! Guess lower: "))

print("Correct! The number was", num)





