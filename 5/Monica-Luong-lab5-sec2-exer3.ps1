function Restart-Comp {
  Add-Type -AssemblyName System.Windows.Forms
  Add-Type -AssemblyName System.Drawing

  $form = New-Object System.Windows.Forms.Form
  $form.Text = 'Restart Computer'
  $form.ClientSize = '400,200'
  $form.StartPosition = 'CenterScreen'

  $okButton = New-Object System.Windows.Forms.Button
  $okButton.Location = New-Object System.Drawing.Point(75,120)
  $okButton.Size = New-Object System.Drawing.Size(75,23)
  $okButton.Text = 'OK'
  $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
  $form.AcceptButton = $okButton
  $form.Controls.Add($okButton)

  $cancelButton = New-Object System.Windows.Forms.Button
  $cancelButton.Location = New-Object System.Drawing.Point(150,120)
  $cancelButton.Size = New-Object System.Drawing.Size(75,23)
  $cancelButton.Text = 'Cancel'
  $cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
  $form.CancelButton = $cancelButton
  $form.Controls.Add($cancelButton)

  $label = New-Object System.Windows.Forms.Label
  $label.Location = New-Object System.Drawing.Point(10,20)
  $label.Size = New-Object System.Drawing.Size(280,40)
  $label.Text = 'Do a system restart?'
  $form.Controls.Add($label)

  $result = $form.ShowDialog()

  if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
  
    $form2 = New-Object System.Windows.Forms.Form
    $form2.Text = 'Restart Computer'
    $form2.ClientSize = '400,200'
    $form2.StartPosition = 'CenterScreen'

    $label2 = New-Object System.Windows.Forms.Label
    $label2.Location = New-Object System.Drawing.Point(10,20)
    $label2.Size = New-Object System.Drawing.Size(280,40)
    $label2.Text = 'Restarting computer in 2 minutes...'
    $form2.Controls.Add($label2)

    $timer = New-Object 'System.Windows.Forms.Timer'

    $form2_Load = {
      $TotalTime = 120 #in seconds
	  $script:StartTime = (Get-Date).AddSeconds($TotalTime)
      $timer.Start()
	}
   
    $timer_Tick={
	  [TimeSpan]$span = $script:StartTime - (Get-Date)
	  
      if ($span.TotalSeconds -le 0) {
		$timer.Stop()
		$form2.Close()
        Restart-Computer
	  }
	}

    $form2.add_Load($form2_Load)
    $timer.add_Tick($timer_Tick)

    $cancelButton2 = New-Object System.Windows.Forms.Button
    $cancelButton2.Location = New-Object System.Drawing.Point(150,120)
    $cancelButton2.Size = New-Object System.Drawing.Size(75,23)
    $cancelButton2.Text = 'Cancel'
    $cancelButton2.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
    $form2.CancelButton = $cancelButton
    $form2.Controls.Add($cancelButton)

    $result2 = $form2.ShowDialog() 
    $form2.remove_Load($form2_Load)
    
  }
}
Restart-Comp