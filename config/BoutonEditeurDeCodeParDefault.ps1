# bouton pour fermer la fenétre et PowerShell ISE
$buttonClose = New-Object System.Windows.Forms.Button
$buttonClose.Text = "CHANGER D'EDITEUR DE CODE"
$buttonClose.Width = 225
$buttonClose.Location = [System.Drawing.Point]::new(($form.Width - $buttonClose.Width) / 2, $boutonCreationScript.Bottom + 5)
$buttonClose.Add_Click({
	        
# Bouton de fermeture avec création des logs
. "$PSScriptRoot\EditeurDeCodeParDefaultSelection.ps1"

})


$form.Controls.Add($buttonClose)