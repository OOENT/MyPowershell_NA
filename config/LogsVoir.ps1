# Chemin du fichier log source
$cheminFichierLog = ".\log\logs.xlsx"

# Répertoire de destination
$destination = ".\log\ConsultationLogs"

# Obtenir la date et l'heure actuelles
$dateHeure = Get-Date -Format "yyyy-MM-dd__HH-mm-ss"

# Obtenir le nom d'utilisateur
$username = $env:USERNAME

# Construire le nom du fichier
$FichierDeConsultationDeLog = "Consultation_${dateHeure}_${username}_log.xlsx"

# Chemin complet de destination
$cheminDestinationConsultationLog = Join-Path -Path $destination -ChildPath $FichierDeConsultationDeLog

# Copier le fichier vers la destination et le renommer
Copy-Item -Path $cheminFichierLog -Destination $cheminDestinationConsultationLog

# Ouvrir le fichier Excel en arrière-plan
Start-Process -FilePath "excel.exe" -ArgumentList "$cheminDestinationConsultationLog"






# Variable utilisée dans LogsFichierXLSX.ps1
$action = "CONSULTATION DES LOGS"
$scriptName = $MyInvocation.MyCommand.Name
$CheminDesLogs = Join-Path -Path (Get-Location).Path -ChildPath $cheminDestinationConsultationLog
$CheminDesLogs = Resolve-Path $CheminDesLogs


# Script pour l'ajout dans le fichier de logs
.\config\LogsFichierXLSX.ps1 -action $action -Script $scriptName -CheminDesLogs $CheminDesLogs



# Fermeture 
$host.SetShouldExit(0)


