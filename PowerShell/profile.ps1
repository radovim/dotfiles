$PROFILE="$HOME\Documents\PowerShell\profile.ps1"

Invoke-Expression (& { (zoxide init powershell | Out-String) })

Import-Module -Name Terminal-Icons

Import-Module posh-git

Invoke-Expression (&starship init powershell)

Import-Module PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PsFzfOption -EnableAliasFuzzyEdit
Set-PsFzfOption -EnableAliasFuzzyGitStatus

function gs {
    git status
}

function rmfr {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [string[]]$Path
    )

    process {
        foreach ($item in $Path) {
            if (Test-Path $item) {
                try {
                    Remove-Item -Path $item -Recurse -Force -ErrorAction Stop
                    Write-Verbose "Successfully removed '$item'"
                } catch {
                    Write-Error "Failed to remove '$item': $_"
                }
            } else {
                Write-Warning "Path '$item' does not exist."
            }
        }
    }
}

function gl {
    git log --pretty=format:"%C(yellow)%h%C(reset) | %C(blue)%ar%C(reset) | %C(cyan)%an%C(reset) | %s" --date=short -n23
}

function gc {
    git commit
}

function gf {
    git fetch --all
}

function nvimcfg {
    cd C:\Users\$Env:USERNAME\AppData\Local\nvim
}

function pscfg {
    cd C:\Users\$Env:USERNAME\Documents\PowerShell
}

function radio {
    cd C:\skyworks\si4790_firmware\fw\products
    cls
    .\mk96.bat radio
}

function api {
    cd C:\skyworks\si4790_firmware\fw\products
    cls
    .\mk96.bat cleanhapi hapi html VERBOSEOUTPUT=1
}

function all {
    cd C:\skyworks\si4790_firmware\fw\products
    cls
    .\mk96.bat cleanhapi hapi html VERBOSEOUTPUT=1
}

function eagle {
    cd C:\skyworks\eaglefw\fw
}

function build {
    .\release_proto.bat digits:4796
}

function buildge {
    .\release_proto.bat digits:4790
}

function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

#Set-Alias -Name vim  -Value nvim
Set-Alias -Name v    -Value nvim
Set-Alias -Name ll   -Value ls
Set-Alias -Name c    -Value cls
Set-Alias -Name g    -Value git
Set-Alias -Name lg   -Value lazygit
Set-Alias -Name tig  -Value 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias -Name find -Value C:\msys64\usr\bin\find.exe
Remove-Alias -Name gl -force
Remove-Alias -Name gc -force
Remove-Alias -Name man -Force
