function Create-Table {
        #region Parameters
            param(
                [Parameter(Mandatory=$true)]
                [string]$TableName,
                [Parameter(Mandatory=$true)]
                $ColumnNames
            )
        #endregion
        #region Validate ColumnNames data type
            if ($ColumnNames.GetType().Name -eq "String") {
                $ColumnNames = $ColumnNames -split "," #convert provided string to array
            } elseif ($ColumnNames.GetType().BaseType.Name -ne "Array") {
                Write-Error "ColumnNames parameters accepts only String or Array value."
                break
            }
        #endregion
        #region Set variables
            $TempTable = New-Object System.Data.DataTable
            $Count = 0
        #endregion
        #region Temp Table construction
            if ($ColumnNames.count -ne 0) {
                do {
                    Remove-Variable -Name datatype -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
                    $TempTable.Columns.Add() | Out-Null #add a column to the Temp Table
                    #region if data type specified for current column
                        if ($ColumnNames[$Count] -like "*/?*") {
                            $datatype = $ColumnNames[$Count].Substring($ColumnNames[$Count].IndexOf("/?")+2)
                            $ColumnNames[$Count] = $ColumnNames[$Count].Substring(0,$ColumnNames[$Count].IndexOf("/?"))
                            if ($datatype -notlike "System.*") {
                                $datatype = "System."+$datatype
                            }
                            $TempTable.Columns[$Count].DataType = $datatype
                        }
                    #endregion
                    $TempTable.Columns[$Count].ColumnName = $ColumnNames[$Count] #set Temp Table empty column Name
                    $TempTable.Columns[$Count].Caption = $ColumnNames[$Count] #set Temp Table empty column Caption
                    $Count++ #change Count + 1 to select next Column Name to add into the Temp Table
                } until ($Count -eq $ColumnNames.Count)
            }
        #endregion
        #region Copy created Temp Table to the table with a name created by user and remove Temp Table
            Set-Variable -Name $TableName -Scope Global -Value (New-Object System.Data.DataTable)
            Set-Variable -Name $TableName -Scope Global -Value $TempTable
            Remove-Variable -Name TempTable -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
        #endregion
}
#Create-Table -TableName TestTable -ColumnNames this
#$TestTable.Row