function Test-Switch ([int] $x) {
  switch ($x) {
    1 {'One'; break;}
    2 {'Two'; break;}
    3 {'Three'; break;}
  }
}