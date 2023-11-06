# Chemin de base pour le répertoire où le fichier CSV 
$variablesDir = "$PSScriptRoot\Variables\EditeurDeCode"

# Nom du fichier CSV en utilisant le nom d'utilisateur et le nom de l'hôte
$username = $env:USERNAME
$hostname = $env:COMPUTERNAME
$csvFilePath = "$variablesDir\${username}_${hostname}.csv"

# Vérifier si le fichier CSV existe
if (Test-Path -Path $csvFilePath) {
    # Lire le contenu si le fichier existe
    $EditeurDeCode = Get-Content -Path $csvFilePath
} else {
    # Valeur par défaut si le fichier n'existe pas
    $EditeurDeCode = "powershell_ise.exe"
}

# Afficher le chemin de l'éditeur de code
# Write-Host "L'éditeur de code est configuré sur: $EditeurDeCode"
