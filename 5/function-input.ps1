# can now get the sum of object properties
function get-sum ($property) {
  $total =0;
  while ($input.MoveNext()) {
    $total += $input.Current.$property
  }
  "Total is: " + $total
}
