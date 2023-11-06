      # variable utilisée dans LogsFichierXLSX.ps1 (plusieurs fois dans se code)
      $action = "CREATION SCRIPT"
  
  
  # script pour récuperer l'application qui va éditer le code $EditeurDeCode
. "$PSScriptRoot\EditeurDeCodeParDefaultApplique.ps1"


  # Varriable du répertoire des scripts
$scriptDirectory = ".\script"

# Vérifie si le dossier 'script' existe, sinon le crée
if (-Not (Test-Path $scriptDirectory)) {
    New-Item -Path $scriptDirectory -ItemType Directory
}

# Crée une boîte de dialogue pour saisir le nom du script
$inputBox = New-Object System.Windows.Forms.Form 
$inputBox.Size = New-Object System.Drawing.Size(450,150)
$inputBox.Text = 'Entrez le nom du script'

$textBox = New-Object System.Windows.Forms.TextBox 
$textBox.Location = New-Object System.Drawing.Point(10,10)
$textBox.Size = New-Object System.Drawing.Size(400,20)

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(10,40)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'OK'
$okButton.Add_Click({
    $inputBox.Tag = $textBox.Text
    $inputBox.Close()
})

$inputBox.Controls.Add($textBox)
$inputBox.Controls.Add($okButton)

$inputBox.ShowDialog()

# Récupère le nom du script depuis la boîte de dialogue
$scriptName = $inputBox.Tag

# Ajoute l'extension .ps1 au nom du script
$scriptName = "$scriptName.ps1"

# Crée le chemin complet où le script sera sauvegardé
$PathCreationScript = Join-Path -Path $scriptDirectory -ChildPath $scriptName  


# Vérification de l'existence du fichier
if (Test-Path $PathCreationScript) {
    # Affichage de la MessageBox si le fichier existe déjà et sera ouvert"
    [System.Windows.Forms.MessageBox]::Show("LE FICHIER EXISTE DEJA ET VA ETRE OUVERT.", "Attention", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
        
    # variable utilisée dans LogsFichierXLSX.ps1 (plusieurs fois dans se code)
        $action = "CREATION SCRIPT (LE SCRIPT EXISTE DEJA)"
} else {
    # Création du fichier s'il n'existe pas
    New-Item -Path $PathCreationScript -ItemType File
}

# ouvre le script avec l'éditeur de code par default
Start-Process -FilePath $EditeurDeCode -ArgumentList "`"$PathCreationScript`""


   
	
	

    # variable utilisée dans LogsFichierXLSX.ps1 (plusieurs fois dans se code)
	$CheminDesLogs = Join-Path -Path (Get-Location).Path -ChildPath $PathCreationScript
	$CheminDesLogs = Resolve-Path $CheminDesLogs 
    

	
    # Script pour l'ajout dans le fichier de logs 
    & ".\config\LogsFichierXLSX.ps1" -action $action -Script $scriptName -'CheminDesLogs' $CheminDesLogs

    Write-Host $CheminDesLogs