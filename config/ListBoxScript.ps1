# liste box de sélection
$menu = New-Object System.Windows.Forms.ListBox
$menu.Width = 230
$menu.Height = 500
$menu.Location = [System.Drawing.Point]::new(($form.Width - $menu.Width) / 2, $buttonExecute.Bottom + 10)
$menu.ScrollAlwaysVisible = $true  
$menu.HorizontalScrollbar = $true
$form.Controls.Add($menu)

