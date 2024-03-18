function gs {
    git status
}

function gl {
    git log
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
    cd C:\skyworks\si4790_firmware
}

Set-Alias -Name vim -Value nvim
Set-Alias -Name v   -Value nvim
Set-Alias -Name c   -Value cls
