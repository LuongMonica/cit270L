#!/usr/bin/python3
courses = ['cit-210', 'cit-270', 'is-431', 'soc-305']
print("All Courses: ") 
print(courses)
print("Favorite: " + courses[1])
print(" ")
least_fav = courses.pop(3)
print("Courses: ")
print(courses)
print("Least fav: " + least_fav)
