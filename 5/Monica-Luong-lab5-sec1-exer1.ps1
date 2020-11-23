$dllCount = 0 ; $logCount = 0 ; $txtCount = 0
foreach ($file  in  (Get-ChildItem C:\Windows -Recurse -ErrorAction SilentlyContinue) ) {
  if ($file.Extension -in ".dll") {
    $dllCount++
  }
  elseif ($file.Extension -in ".log") {
    $logCount++
  }
  elseif ($file.Extension -in ".txt") {
    $txtCount++
  }
}
".dll files: $dllCount"
".log files: $logCount"
".txt files: $txtCount"