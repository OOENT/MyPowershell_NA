param(
    [string]$scriptPath

)



# Copier le script actuellement ouvert vers le dossier ScriptHistory
$scriptHistoryFolder = ".\log\ScriptHistory"
if (-not (Test-Path -Path $scriptHistoryFolder -PathType Container)) {
    New-Item -Path $scriptHistoryFolder -ItemType Directory
}

$scriptNameWithoutExtension = [System.IO.Path]::GetFileNameWithoutExtension($scriptPath)
$dateSuffix = Get-Date -Format "yyyy-MM-dd-HH-mm-ss"
$newScriptFileName = "$scriptNameWithoutExtension-$dateSuffix.ps1"
$newScriptPath = Join-Path -Path $scriptHistoryFolder -ChildPath $newScriptFileName

Copy-Item -Path $scriptPath -Destination $newScriptPath

# Limiter l'historique à 20 fichiers par script
#$scriptHistoryFiles = Get-ChildItem -Path $scriptHistoryFolder -Filter "$scriptNameWithoutExtension-*.ps1" | Sort-Object -Property LastWriteTime -Descending
#if ($scriptHistoryFiles.Count -gt 20) {
#    $filesToRemove = $scriptHistoryFiles | Select-Object -Skip 20
#    $filesToRemove | ForEach-Object {
#        Remove-Item -Path $_.FullName -Force
#   }
#}







    #varriable utilisé dans LogsFichierXLSX.ps1
     $action = "EDITER LE CODE"
     $scriptName = $selectedScript
	$CheminDesLogs = Join-Path -Path (Get-Location).Path -ChildPath $newScriptPath
	$CheminDesLogs = Resolve-Path $CheminDesLogs 
	 
# Script pour l'ajout dans le fichier de logs bien mettre les varriables 
.\config\LogsFichierXLSX.ps1 -action $action, -Script $scriptName, -'CheminDesLogs' $CheminDesLogs


