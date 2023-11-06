# bouton pour Exécuter le script"
$buttonExecute = New-Object System.Windows.Forms.Button
$buttonExecute.Text = "EXECUTER"
$buttonExecute.Width = 80
$buttonExecute.BackColor = [System.Drawing.Color]::Red
$buttonExecute.Location = [System.Drawing.Point]::new(($form.Width - $buttonExecute.Width) / 2 - 65, $searchBox.Bottom + 5)

$buttonExecute.Add_Click({
    
	if (-not $menu.SelectedItem) {
		# indique qu'il faut selectionner un script
        [System.Windows.Forms.MessageBox]::Show("Veuillez selectionner un script avant de continuer.", "Erreur", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    
	} else {

    # appel le script qui lance l'enregistrement   .\config\LogsScriptDeCaptureFenetrePowershell.ps1" et la varriable (se script appel LogsFichierXLSX.ps1)
    Start-Process powershell.exe -ArgumentList "-NoExit", "-ExecutionPolicy Bypass", "-File .\config\LogsScriptDeCaptureFenetrePowershell.ps1", "-selectedScript $($menu.SelectedItem)"
    
	
	}
})


$form.Controls.Add($buttonExecute)

