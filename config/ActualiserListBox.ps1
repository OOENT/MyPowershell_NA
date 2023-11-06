# Actualisation de la liste des script ListBox
  $menu.Items.Clear()
  $scripts = Get-ChildItem -Path $scriptPath -Filter *.ps1
  $scripts | ForEach-Object {
  $menu.Items.Add($_.Name)
}