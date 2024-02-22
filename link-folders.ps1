New-Item -ItemType Junction -Path C:\Users\$Env:USERNAME\Documents\PowerShell  -Target C:\Users\$Env:USERNAME\.dotfiles\PowerShell

New-Item -ItemType Junction -Path C:\Users\$env:USERNAME\AppData\Local\nvim  -Target C:\Users\$Env:USERNAME\.dotfiles\neovim\.config\nvim

