# test.ps1
# Show Hello and time
"" # Blank Line
"Hello " +$env:USERNAME + "!"
"Time is " + "{0:HH}:{0:mm}" -f(get-date)
""