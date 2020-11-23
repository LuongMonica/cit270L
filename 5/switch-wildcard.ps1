$x='apple', 'ant', 'bat', 'cat';
[int] $aCount, $bCount, $cCount;
switch -Wildcard ($x) {
  'a*' {$aCount++;}
  'b*' {$bCount++;}
  'c*' {$cCount++;}
}
"a: $aCount, b: $bCount, c: $cCount";