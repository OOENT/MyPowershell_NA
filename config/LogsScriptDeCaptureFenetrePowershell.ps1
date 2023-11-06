param($selectedScript)

# Variables Capture fenetre powershell
# Varriable du répertoire des scripts
$scriptPath = ".\script"
$scriptLancer = Join-Path -Path $scriptPath -ChildPath $selectedScript
$currentUser = $env:USERNAME
$date = Get-Date -Format "yyyyMMdd_HHmmss"
$logFolder = "log\ScriptExecute\$env:COMPUTERNAME"
$logFileName = "${selectedScript}_${currentUser}_$date.log"
$logPath = Join-Path -Path $logFolder -ChildPath $logFileName







    #varriable utilisé dans LogsFichierXLSX.ps1
     $action = "EXECUTER"
     $scriptName = $selectedScript
	 $CheminDesLogs = Join-Path -Path (Get-Location).Path -ChildPath $logPath
	 
	 
# Script pour l'ajout dans le fichier de logs bien mettre les varriables 
.\config\LogsFichierXLSX.ps1 -action $action, -Script $scriptName, -'CheminDesLogs' $CheminDesLogs










# ----------------------------------------------------------------------
# Capture fenetre powershell
# ----------------------------------------------------------------------
if (-not (Test-Path -Path $logFolder -PathType Container)) {
    New-Item -Path $logFolder -ItemType Directory -Force | Out-Null
}

Start-Transcript -Path $logPath -Append

function Write-Section($title) {
    Write-Output "`r`n`r`n`r`n`r`n`r`n____________________________________________"
    Write-Output $title
    Write-Output "____________________________________________`r`n"
}

# -----------------------------------------------------------
# SECTION : CODE
# -----------------------------------------------------------
Write-Section "SECTION : CODE"
Get-Content -Path $scriptLancer

# -----------------------------------------------------------
# SECTION : Résultat et saisie utilisateur
# -----------------------------------------------------------
Write-Section "SECTION : Résultat et saisie utilisateur"
Invoke-Expression "& '$scriptLancer'"


