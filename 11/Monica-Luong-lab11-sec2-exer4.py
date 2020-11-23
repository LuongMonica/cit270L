#!/usr/bin/python3
# Using turtle graphics draw shape of heart (red color) on a light blue canvas.
import turtle

wn = turtle.getscreen()
wn.bgcolor("lightblue")

turtle1 = turtle.Turtle()
turtle1.color("red")


def curve():
    for i in range(200):
        # slowly make a smooth curve
        turtle1.right(1)
        turtle1.forward(1)


def heart():
    # left line
    turtle1.left(135)
    turtle1.forward(113)
    # left curve
    curve()
    turtle1.left(115)
    # right curve
    curve()
    # right line
    turtle1.forward(112)


heart()
wn.exitonclick()
