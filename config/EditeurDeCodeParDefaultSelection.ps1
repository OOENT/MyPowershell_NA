# Chemin de base pour le répertoire où le fichier CSV sera enregistré
 
$variablesDir = "$PSScriptRoot\Variables\EditeurDeCode"

# Vérifie si le répertoire existe, sinon le créer
if (-not (Test-Path -Path $variablesDir)) {
    New-Item -ItemType Directory -Path $variablesDir
}

# Fonction pour ouvrir une boîte de dialogue permettant de sélectionner un fichier
function Select-Executable {
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

    $dialog = New-Object System.Windows.Forms.OpenFileDialog
    $dialog.Filter = "Executables (*.exe)|*.exe"
    $dialog.Title = "Aller choisir l'editeur de code"
    $result = $dialog.ShowDialog()

    if ($result -eq "OK") {
        return $dialog.FileName
    } else {
        return $null
    }
}

# Utilisation de la fonction pour obtenir le chemin de l'exécutable
$PathEditeurDeCode = Select-Executable

if ($PathEditeurDeCode) {
    # Créer le nom du fichier CSV en utilisant le nom d'utilisateur et le nom de l'hôte
    $username = $env:USERNAME
    $hostname = $env:COMPUTERNAME
    $csvFileName = "$variablesDir\${username}_${hostname}.csv"

    # Écrire le chemin dans le fichier CSV
    $PathEditeurDeCode | Out-File -FilePath $csvFileName -Encoding UTF8

}




		# variable utilisée dans LogsFichierXLSX.ps1
        $action = "CHANGER D'EDITEUR DE CODE PAR DEFAULT"
        $scriptName = "MyPowershell_NA" 
      $CheminDesLogs = "$PathEditeurDeCode"
    
        # Script pour l'ajout dans le fichier de logs 
        & ".\config\LogsFichierXLSX.ps1" -action $action -Script $scriptName -'CheminDesLogs' $CheminDesLogs
