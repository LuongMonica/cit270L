$files = Get-ChildItem C:\Windows -Recurse -ErrorAction SilentlyContinue
switch -wildcard ($files) {
  '*.dll' {$dllCount++;}
  '*.log' {$dllCount++;}
  '*.txt' {$dllCount++;}
}
".dll files: $dllCount"
".log files: $logCount"
".txt files: $txtCount"