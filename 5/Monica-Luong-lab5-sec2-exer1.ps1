$Header = @"
<style>
TABLE {border-width: 1px; border-style: solid; border-color: black; border-collapse: collapse;}
TH {border-width: 1px; padding: 3px; border-style: solid; border-color: black;}
TD {border-width: 1px; padding: 3px; border-style: solid; border-color: black;}
</style>
"@

function Make-Summary {
  $hash = @{ file1Info = 0; file1Debug = 0; file1Error = 0; 
             file2Info = 0; file2Debug = 0; file2Error = 0;
             file3Info = 0; file3Debug = 0; file3Error = 0;
             totalInfo = 0; totalDebug = 0; totalError = 0;}

  foreach ( $txtFile in (Get-ChildItem -Path "C:\courses\cit270\lab5" *.txt)) {
    foreach ( $line in (Get-Content "C:\courses\cit270\lab5\$txtFile")) {
      if ($line -match "Info") {
        if ($txtFile -match "File1") { $hash.file1Info++ }
        elseif ($txtFile -match "File2") { $hash.file2Info++ }
        elseif ($txtFile -match "File3") { $hash.file3Info++ }
      }
      elseif ($line -match "Debug") {
        if ($txtFile -match "File1") { $hash.file1Debug++ }
        elseif ($txtFile -match "File2") { $hash.file2Debug++ }
        elseif ($txtFile -match "File3") { $hash.file3Debug++ }
      }
      elseif ($line -match "Error") {
        if ($txtFile -match "File1") { $hash.file1Error++ }
        elseif ($txtFile -match "File2") { $hash.file2Error++ }
        elseif ($txtFile -match "File3") { $hash.file3Error++ }
      }
    }
  }

  $hash.totalInfo = $hash.file1Info + $hash.file2Info + $hash.file3Info
  $hash.totalDebug = $hash.file1Debug + $hash.file2Debug + $hash.file3Debug
  $hash.totalError = $hash.file1Error + $hash.file2Error + $hash.file3Error

  $hash.GetEnumerator() | sort -Property name | select name, value | ConvertTo-Html -Head $Header | Out-File table.html
}
Make-Summary 