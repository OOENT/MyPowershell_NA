# Titre "Rechercher"
$labelTitle = New-Object System.Windows.Forms.Label
$labelTitle.Text = "Rechercher"
$labelTitle.Width = $form.Width
$labelTitle.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$labelTitle.Location = [System.Drawing.Point]::new(0, 10)
$form.Controls.Add($labelTitle)

# Cellule de recherche (TextBox)
$searchBox = New-Object System.Windows.Forms.TextBox
$searchBox.Width = 200
$searchBox.Location = [System.Drawing.Point]::new(($form.Width - $searchBox.Width) / 2, $labelTitle.Bottom + 5)
$form.Controls.Add($searchBox)

# Gestionnaire d'événements pour le changement de texte de la zone de recherche
$searchBox.Add_TextChanged({
    $filter = $searchBox.Text.ToLower()
    $menu.Items.Clear()
    if ($scripts) {
        $scripts | Where-Object { $_.Name.ToLower() -like "*$filter*" } | ForEach-Object {
            $menu.Items.Add($_.Name)
        }
    }
})
