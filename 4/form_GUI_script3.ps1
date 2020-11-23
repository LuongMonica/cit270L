[void][reflection.assembly]::LoadWithPartialName("System.WindowsForms")
$form=new-object Windows.Forms.Form
$form.Text="My First Form"
$button=new-object Windows.Forms.Button 
$button.Text="Push Me!"
$button.Dock="fill"
$button.add_click({$form.close()})
$form.controls.Add($button)
$form.add_shown({$form.Activate()})
$form.ShowDialog()
