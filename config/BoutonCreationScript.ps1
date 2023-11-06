# Bouton pour créer le script
$boutonCreationScript = New-Object System.Windows.Forms.Button
$boutonCreationScript.Text = "CREATION SCRIPT"
$boutonCreationScript.Width = 225
$boutonCreationScript.Location = [System.Drawing.Point]::new(($form.Width - $boutonCreationScript.Width) / 2, $BoutonVoirLesLogs.Bottom + 5)


 
$boutonCreationScript.Add_Click({
    # Appelle le script CreationScript.ps1  
    & '.\config\CreationScript.ps1'
})


$form.Controls.Add($boutonCreationScript)
