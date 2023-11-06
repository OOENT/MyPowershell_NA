# Créez le bouton "EDITER LE CODE"
$BoutonEditeurDeCode = New-Object System.Windows.Forms.Button
$BoutonEditeurDeCode.Text = "EDITER LE CODE"
$BoutonEditeurDeCode.Width = 115
$BoutonEditeurDeCode.BackColor = [System.Drawing.Color]::FromArgb(1, 36, 86) 
$BoutonEditeurDeCode.ForeColor = [System.Drawing.Color]::White
$BoutonEditeurDeCode.Location = [System.Drawing.Point]::new(($form.Width - $BoutonEditeurDeCode.Width) / 2 + 40, $searchBox.Bottom + 5)

$BoutonEditeurDeCode.Add_Click({
	
   # variable repertoire des scripts	
   $scriptDirectory = ".\script"
  # script pour récuperer l'application qui va éditer le code $EditeurDeCode
. "$PSScriptRoot\EditeurDeCodeParDefaultApplique.ps1"
   
   # affiche un message si l'on a pas selectionné de script
   # si pas selectionné dans la ListBox
    if (-not $menu.SelectedItem) {
		# message 
        [System.Windows.Forms.MessageBox]::Show("Veuillez sélectionner un script avant de continuer.", "Erreur", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
   

   } else {
	   # nom du script selectionné
        $selectedScript = $menu.SelectedItem.ToString()
       
	   # création du chemin du script selectionné
        $scriptPath = Join-Path -Path $scriptDirectory -ChildPath $selectedScript 
        
        # ouvre le script avec l'éditeur de code par default
        Start-Process -FilePath $EditeurDeCode -ArgumentList "`"$scriptPath`""





        # Exécuter LogsScriptHistory.ps1 
        .\config\LogsScriptHistory.ps1 $scriptPath 

    }
})

$form.Controls.Add($BoutonEditeurDeCode)


