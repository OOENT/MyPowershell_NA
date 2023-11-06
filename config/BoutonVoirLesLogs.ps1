# bouton voir les logs
$BoutonVoirLesLogs = New-Object System.Windows.Forms.Button
$BoutonVoirLesLogs.Text = "VOIR LES LOGS"
$BoutonVoirLesLogs.Width = 225
$BoutonVoirLesLogs.Location = [System.Drawing.Point]::new(($form.Width - $BoutonVoirLesLogs.Width) / 2, $buttonOpenScriptDirectory.Bottom + 5)
$BoutonVoirLesLogs.Add_Click({



       # Lance le script qui fait une copie de consoltation des logs 
      Start-Process powershell.exe -ArgumentList "-NoExit", "-ExecutionPolicy Bypass", "-File .\config\LogsVoir.ps1"



})
$form.Controls.Add($BoutonVoirLesLogs)