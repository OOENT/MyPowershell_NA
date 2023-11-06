# Charger l'assembly System.Windows.Forms
Add-Type -AssemblyName System.Windows.Forms

# Fenétre de l'application
$form = New-Object System.Windows.Forms.Form
$form.Text = "MyPowerShell_NA"
$form.Size = New-Object System.Drawing.Size(250, 800)
$form.StartPosition = [System.Windows.Forms.FormStartPosition]::Manual
$form.Location = New-Object System.Drawing.Point(0, 0)
$form.Font = [System.Drawing.Font]::new("Arial", 8)

# Varriable du répertoire des scripts
$scriptPath = ".\script"




    #varriable utilisé dans LogsFichierXLSX.ps1 pour l'ouverture
     $action = "OUVERTURE DE MyPowerShell_NA"
     $scriptName = $MyInvocation.MyCommand.Name
	$CheminDesLogs = ""
	 
	 
# Script pour l'ajout dans le fichier de logs bien mettre les varriables 
.\config\LogsFichierXLSX.ps1 -action $action, -Script $scriptName, -'CheminDesLogs' $CheminDesLogs





#Barre de recherche
. "$PSScriptRoot\BarreDeRecherche.ps1"

# Bouton pour Executer le script avec création des logs
. "$PSScriptRoot\BoutonExecuter.ps1"

# Bouton pour Ouvrir le script dans éditeur de code avec une sauvegarde .\ScriptHistory avec création des logs
. "$PSScriptRoot\BoutonEditerLeCode.ps1"

# ListBox qui contient les scripts du répertoire .\script
. "$PSScriptRoot\ListBoxScript.ps1"

# Actualise a l'ouverture la ListBox avec création des logs
. "$PSScriptRoot\ActualiserListBox.ps1"

# Bouton pour actualiser la ListBox des scripts avec création des logs
. "$PSScriptRoot\BoutonActualiser.ps1"

# Ouvre le répertoire des scripts avec création des logs
. "$PSScriptRoot\BoutonOuvrirRepertoireScript.ps1"


# Ouvre une copie du fichier de log sauvegardé .\ConsultationLogs avec création des logs
. "$PSScriptRoot\BoutonVoirLesLogs.ps1"

# Bouton de création de script
. "$PSScriptRoot\BoutonCreationScript.ps1"

# Bouton de fermeture avec création des logs
. "$PSScriptRoot\BoutonEditeurDeCodeParDefault.ps1"



# Bouton fermer de la femétre appel le script LogsFichierXLSX.ps1
$form.Add_FormClosing({
    # Variables utilisées dans LogsFichierXLSX.ps1 pour la fermeture (utilise aussi ceux de l'ouverture au début)
    $action = "FERMETURE DE MyPowerShell_NA"


    # Script pour l'ajout dans le fichier de logs
    .\config\LogsFichierXLSX.ps1 -action $action -Script $scriptName -CheminDesLogs $CheminDesLogs
})

# Afficher la fenétre
$form.ShowDialog()
