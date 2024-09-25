New-Item -ItemType SymbolicLink -Path $HOME\Documents\PowerShell  -Target (Get-Item .\PowerShell).FullName

New-Item -ItemType SymbolicLink -Path $HOME\AppData\Local\nvim  -Target (Get-Item .\neovim\.config\nvim).FullName

New-Item -ItemType SymbolicLink -Path $HOME\.vimrc -Target (Get-Item .\vim\.vimrc).FullName
