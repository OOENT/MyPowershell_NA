# Charger l'assembly pour la boîte de dialogue
Add-Type -AssemblyName System.Windows.Forms

# Créer et configurer la boîte de dialogue
$openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$openFileDialog.InitialDirectory = "C:\"
$openFileDialog.Filter = "All files (*.*)|*.*"

# Afficher la boîte de dialogue et obtenir le chemin du fichier sélectionné
$openFileDialog.ShowDialog() | Out-Null
$filePath = $openFileDialog.FileName

# Chemin complet vers handle.exe en se basant sur le répertoire du script
$handlePath = Join-Path -Path $PSScriptRoot -ChildPath "ModulesComplementaire\Handle\handle.exe"

# Recherche des processus utilisant le fichier avec handle.exe
$handleOutput = & $handlePath $filePath 2>$null

if ($handleOutput) {
    Write-Host "Processus utilisant le fichier :"
    $handleOutput -split "`n" | ForEach-Object {
        if ($_ -match "pid: (\d+)")
        {
            $pid = $matches[1]
            $process = Get-Process -Id $pid -ErrorAction SilentlyContinue
            if ($process) {
                Write-Host "$pid - $($process.ProcessName)"
            }
        }
    }
} else {
    Write-Host "Aucun processus n'utilise ce fichier."
}
