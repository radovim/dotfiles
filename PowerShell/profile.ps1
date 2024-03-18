Set-Variable -Name "PROFILE" -Value "C:\Users\$Env:USERNAME\Documents\PowerShell\profile.ps1"

Import-Module -Name Terminal-Icons
Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })

Import-Module "C:\Users\$Env:USERNAME\Documents\PowerShell\aliases.ps1"
