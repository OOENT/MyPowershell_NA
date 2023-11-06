# bouton pour ouvrir le répertoire des scripts
$buttonOpenScriptDirectory = New-Object System.Windows.Forms.Button
$buttonOpenScriptDirectory.Text = "OUVRIR LE REPERTOIRE DES SCRIPTS"
$buttonOpenScriptDirectory.Width = 225
$buttonOpenScriptDirectory.Location = [System.Drawing.Point]::new(($form.Width - $buttonOpenScriptDirectory.Width) / 2, $buttonRefresh.Bottom + 5)
$buttonOpenScriptDirectory.Add_Click({
    
	
	
	# ouverture du répertoire des script
	Invoke-Item -Path $scriptPath
	
	
	
	
	# variable utilisée dans LogsFichierXLSX.ps1
    $action = "OUVERTURE DU REPERTOIRE DES SCRIPT"
    $scriptName = "MyPowershell_NA"  
    # Script pour l'ajout dans le fichier de logs 
    & ".\config\LogsFichierXLSX.ps1" -action $action -Script $scriptName 


})


$form.Controls.Add($buttonOpenScriptDirectory)