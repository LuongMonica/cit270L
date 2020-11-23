function Test-Number ([int] $x) {
  if ($x -gt 100) {
    "It's greater than one hundred"
  }
  elseif ($x -gt 50) {
    "It's greater than 50"
  }
  else {
    "It's not very big"
  }
}