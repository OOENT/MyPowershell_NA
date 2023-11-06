# Vérifiez si le module ImportExcel est installé
if (-not (Get-Module -ListAvailable -Name ImportExcel)) {
    Write-Error "Le module 'ImportExcel' n'est pas installé. Installez-le avec 'Install-Module -Name ImportExcel'."
    exit
}

# Paramétres
$cheminFichierLog = ".\log\logs.xlsx"
$date = Get-Date
$heure = $date.ToShortTimeString()
$utilisateur = $env:USERNAME
$HostName = $env:COMPUTERNAME

# $action = pour information la valeur est récupéré : 
                         # Pour EXECUTER LogsScriptDeCaptureFenetrePowershell.ps1
                         # 
                         #
                         #
                         #
                         #

#$scriptName = pour information la valeur est récupéré :
                         #  LogsScriptDeCaptureFenetrePowershell.ps1
                         # 
                         #
                         #
                         #
                         #
 
# $CheminDesLogs = pour information la valeur est récupéré :
                         #  LogsScriptHistory.ps1
                         # 
                         #
                         #
                         #
                         #


# Importer le fichier Excel
$logs = @()
if (Test-Path $cheminFichierLog) {
    $currentLogs = @(Import-Excel -Path $cheminFichierLog)  # Assurez-vous que c'est toujours un tableau
    if ($currentLogs) {
        $logs = $currentLogs
    }
}

# Ajouter la nouvelle entrée
$newLog = [PSCustomObject]@{
    'Dates' = $date.ToShortDateString();
    'Heures' = $heure;
    'Utilisateur' = $utilisateur;
    'HostName' = $HostName;
    'Action' = $action;
    'Script' = $scriptName;
    'CheminDesLogs' = "=HYPERLINK(`"$CheminDesLogs`", `"$CheminDesLogs`")";
}

# Créez une nouvelle liste et ajoutez-y les éléments
$logsList = [System.Collections.Generic.List[PSCustomObject]]::new()
foreach ($log in $logs) {
    $logsList.Add($log)
}
$logsList.Add($newLog)

# Enregistrer le fichier Excel avec la nouvelle entrée
$logsList | Export-Excel -Path $cheminFichierLog -WorksheetName "Logs" -AutoSize -FreezeTopRow -AutoFilter

