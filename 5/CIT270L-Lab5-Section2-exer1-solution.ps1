function createTable() {
 Set-Location C:\courses\CIT270\lab5Exercise2

$F1I = Get-Content -Path .\File1.txt | Select-String -Pattern "Info:" -AllMatches
$F2I = Get-Content -Path .\File2.txt | Select-String -Pattern "Info:" -AllMatches
$F3I = Get-Content -Path .\File3.txt | Select-String -Pattern "Info:" -AllMatches

$F1D = Get-Content -Path .\File1.txt | Select-String -Pattern "Debug:" -AllMatches
$F2D = Get-Content -Path .\File2.txt | Select-String -Pattern "Debug:" -AllMatches
$F3D = Get-Content -Path .\File3.txt | Select-String -Pattern "Debug:" -AllMatches

$F1E = Get-Content -Path .\File1.txt | Select-String -Pattern "Error:" -AllMatches
$F2E = Get-Content -Path .\File2.txt | Select-String -Pattern "Error:" -AllMatches
$F3E = Get-Content -Path .\File3.txt | Select-String -Pattern "Error:" -AllMatches

$output="<html>
<table border>
    <tr>
        <th>Name</th>
        <th>Info</th>
        <th>Debug</th>
        <th>Error</th>
    </tr>
    <tr>
        <td>File 1</td>
        <td> $($F1I.Count) </td>
        <td> $($F1D.Count) </td>
        <td> $($F1E.Count) </td>
    </tr>
    <tr>
        <td>File 2</td>
        <td> $($F2I.Count) </td>
        <td> $($F2D.Count) </td>
        <td> $($F2E.Count) </td>
    </tr>
    <tr>
        <td>File 3</td>
        <td> $($F3I.Count) </td>
        <td> $($F3D.Count) </td>
        <td> $($F3E.Count) </td>
    </tr>
    <tr>
        <td>Total</td>
        <td> $($($F1I.Count) + $($F2I.Count) + $($F3I.Count)) </td>
        <td> $($($F1D.Count) + $($F2D.Count) + $($F3D.Count)) </td>
        <td> $($($F1E.Count) + $($F2E.Count) + $($F3E.Count)) </td>
    </tr>
</table>
</html>"

Out-File -FilePath C:\courses\CIT270\lab5Exercise2\test.html -InputObject $output

}


createTable