function createTable($dir, $string1, $string2, $string3) {
  Set-Location \

  New-Item C:courses\cit270\lab5\table.html
  Add-Content C:courses\cit270\lab5\table.html "<html>`n"
  Add-Content C:courses\cit270\lab5\table.html "<table border>`n"
  Add-Content C:courses\cit270\lab5\table.html "`t<tr>`n"
  Add-Content C:courses\cit270\lab5\table.html "`t`t<th>Name</th>`n"
  Add-Content C:courses\cit270\lab5\table.html "`t`t<th>$string1</th>`n"
  Add-Content C:courses\cit270\lab5\table.html "`t`t<th>$string2</th>`n"
  Add-Content C:courses\cit270\lab5\table.html "`t`t<th>$string3</th>`n"
  Add-Content C:courses\cit270\lab5\table.html "`t</tr>`n"

  $hash = @{}
  $hash.Add("`"$string1`" Total", 0)
  $hash.Add("`"$string2`" Total", 0)
  $hash.Add("`"$string3`" Total", 0)

  foreach ( $txtFile in (Get-ChildItem -Path "$dir" -Recurse *.txt)) {
    Add-Content C:courses\cit270\lab5\table.html "`t<tr>`n"
    Add-Content C:courses\cit270\lab5\table.html "`t`t<th>$txtfile</th>`n"

    if ($hash.contains("$txtfile `"$string1`" Count")) {} else { $hash.Add("$txtfile `"$string1`" Count", 0) }
    if ($hash.contains("$txtfile `"$string2`" Count")) {} else { $hash.Add("$txtfile `"$string2`" Count", 0) }
    if ($hash.contains("$txtfile `"$string3`" Count")) {} else { $hash.Add("$txtfile `"$string3`" Count", 0) }

    foreach ( $line in (Get-Content $txtFile.fullName)) {
      if ($line -match "$string1" ) {
        $hash."$txtfile $string1 Count"++
        $hash."`"$string1`" Total" += $hash."$txtfile $string1 Count"
        Add-Content C:courses\cit270\lab5\table.html "`t`t<td>$hash.$txtfile $string1 Count</td>`n"
      }
      elseif ($line -match "$string2") {
        $hash."$txtfile $string2 Count"++
        $hash."`"$string2`" Total" += $hash."$txtfile $string2 Count"
        Add-Content C:courses\cit270\lab5\table.html "`t`t<td>$hash.$txtfile $string2 Count</td>`n"
      }
      elseif ($line -match "$string3") {
        $hash."$txtfile $string3 Count"++
        $hash."`"$string3`" Total" += $hash."$txtfile $string3 Count"
        Add-Content C:courses\cit270\lab5\table.html "`t`t<td>$hash.$txtfile $string3 Count</td>`n"
      }
    }
    Add-Content C:courses\cit270\lab5\table.html "`t`</tr>`n"
  }
  Add-Content C:courses\cit270\lab5\table.html "`t`<tr>`n"
  Add-Content C:courses\cit270\lab5\table.html "`t`t<td>Total</td>`n"
  Add-Content C:courses\cit270\lab5\table.html "`t`t<td>$hash.$string1 Total</td>`n"
  Add-Content C:courses\cit270\lab5\table.html "`t`t<td>$hash.$string2 Total</td>`n"
  Add-Content C:courses\cit270\lab5\table.html "`t`t<td>$hash.getEnumerator()</td>`n"
  Add-Content C:courses\cit270\lab5\table.html "`t`</tr>`n"
  Add-Content C:courses\cit270\lab5\table.html "</table>`n"
  Add-Content C:courses\cit270\lab5\table.html "</html>`n"
}

createTable -dir 'C:courses\cit270\lab5\' -string1 this -string2 that -string3 error