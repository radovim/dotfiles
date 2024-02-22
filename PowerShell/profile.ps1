Set-Variable -Name "PROFILE" -Value "C:\Users\$Env:USERNAME\Documents\PowerShell\profile.ps1"

Import-Module -Name Terminal-Icons
Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })

function jumpIntoNvimConfigFolder {
    cd C:\Users\$Env:USERNAME\AppData\Local\nvim
}

function jumpIntoPsConfigFolder {
    cd C:\Users\$Env:USERNAME\Documents\PowerShell
}
Set-Alias -Name vim     -Value nvim
Set-Alias -Name v       -Value nvim
Set-Alias -Name nvimcfg -Value jumpIntoNvimConfigFolder
Set-Alias -Name pscfg   -Value jumpIntoPsConfigFolder

$DotFilesPath = "C:\Users\radovim\dotfiles"
