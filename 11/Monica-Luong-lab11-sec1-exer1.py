#!/usr/bin/python3
from tkinter import *

top = Tk()
C = Canvas(top)
C.pack()


def draw_circle(x, y, r, canvas_name):  # center coords, radius
    x0 = x - r
    y0 = y - r
    x1 = x + r
    y1 = y + r
    return canvas_name.create_oval(x0, y0, x1, y1)


draw_circle(100, 100, 20, C)
top.mainloop()
