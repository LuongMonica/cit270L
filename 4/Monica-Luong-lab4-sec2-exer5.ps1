# search the event log for errors
$logs= ('Application', 'System')
foreach ($log in $logs) { Get-EventLog -EntryType Error -LogName $log -ErrorAction SilentlyContinue }