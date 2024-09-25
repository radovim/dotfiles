# How to setup dotfiles on Windows with PowerShell

- Install PowerShell:

        Find more details PowerShell's [github repo](https://github.com/PowerShell/PowerShell)

## Dependencies:
    - [Zoxide](https://github.com/ajeetdsouza/zoxide)
    - [Terminal-Icons](https://github.com/devblackops/Terminal-Icons)
    - [Fzf](https://github.com/junegunn/fzf#installation)
    - [PsFzf](https://github.com/kelleyma49/PSFzf)
    - [posh-git](https://github.com/dahlbyk/posh-git)

Follow these step to install all dependencies:
```
1) Run PowerShell terminal as Admin
2) Execute:
- Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
- ExecuteInvoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
- scoop bucket add extras
- scoop install extras/psfzf fzf zoxide terminal-icons posh-git sudo gcc
- cd ~/.dotfiles && ./link-folders.ps1
```

