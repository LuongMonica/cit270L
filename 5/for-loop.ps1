$files=Get-ChildItem -Recurse *.txt
for ($i=0; $i -lt $files.Length; $i++) {
  $files[$i].FullName
}