$Header = @"
<style>
TABLE {border-width: 1px; border-style: solid; border-color: black; border-collapse: collapse;}
TH {border-width: 1px; padding: 3px; border-style: solid; border-color: black;}
TD {border-width: 1px; padding: 3px; border-style: solid; border-color: black;}
</style>
"@

function Make-Summary2 ($dir, $string1, $string2, $string3) {

  # empty hash
  $hash = @{}
  # total entries
  $hash.Add("`"$string1`" Total", 0)
  $hash.Add("`"$string2`" Total", 0)
  $hash.Add("`"$string3`" Total", 0)

  foreach ( $txtFile in (Get-ChildItem -Path "$dir" -Recurse *.txt)) {
    
    # check if the key exists, if not add to hash table
    if ($hash.contains("$txtfile `"$string1`" Count")) {} else { $hash.Add("$txtfile `"$string1`" Count", 0) }
    if ($hash.contains("$txtfile `"$string2`" Count")) {} else { $hash.Add("$txtfile `"$string2`" Count", 0) }
    if ($hash.contains("$txtfile `"$string3`" Count")) {} else { $hash.Add("$txtfile `"$string3`" Count", 0) }
    
    foreach ( $line in (Get-Content $txtFile.fullName)) {
      if ($line -match "$string1" ) {
        $hash."$txtfile $string1 Count"++
        $hash."`"$string1`" Total" += $hash."$txtfile $string1 Count"
      }
      elseif ($line -match "$string2") {
        $hash."$txtfile $string2 Count"++
        $hash."`"$string2`" Total" += $hash."$txtfile $string2 Count"
      }
      elseif ($line -match "$string3") {
        $hash."$txtfile $string3 Count"++
        $hash."`"$string3`" Total" += $hash."$txtfile $string3 Count"
      }
    }
  }
  $hash.GetEnumerator() | sort -Property name | select name, value | ConvertTo-Html -Head $Header | Out-File table.html
}