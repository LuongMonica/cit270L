# find the type of event log entry that occurs the most frequently
$errors=get-eventlog -EntryType Error -LogName "system"
$info=get-eventlog -EntryType Information -LogName "system"
$fail=get-eventlog -EntryType FailureAudit -LogName "system" -ErrorAction SilentlyContinue
$success=get-eventlog -EntryType SuccessAudit -LogName "system" -ErrorAction SilentlyContinue

# compare numbers
if ($errors.count -gt $info.Count) {
  Write-Host "Error entries occur the most frequently. Errors: "
  Write-host ($errors.count | format-list | out-string) # or simply: $errors.count
}
if ($errors.Count -lt $info.Count) {
  Write-Host "Information entries occur the most frequently. Information count: "
  Write-host ($info.count | format-list | out-string) # or simply: $info.count
}
else {
  Write-Host "Both error and information entries occur in the same amount"
  $errors.Count
}