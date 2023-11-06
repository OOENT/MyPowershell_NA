# bouton "Actualiser"
$buttonRefresh = New-Object System.Windows.Forms.Button
$buttonRefresh.Text = "ACTUALISER"
$buttonRefresh.Width = 225
$buttonRefresh.Location = [System.Drawing.Point]::new(($form.Width - $buttonRefresh.Width) / 2, $menu.Bottom + 5)
$buttonRefresh.Add_Click({
    
	
	# script pour actualiser la ListBox
	.\config\ActualiserListBox.ps1
	
	
	

    # variable utilisée dans LogsFichierXLSX.ps1
    $action = "ACTUALISER LA ListBox"
    $scriptName = "MyPowershell_NA" 
	
    # Script pour l'ajout dans le fichier de logs 
    & ".\config\LogsFichierXLSX.ps1" -action $action -Script $scriptName 


})



$form.Controls.Add($buttonRefresh)

