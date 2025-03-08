#================================
#        GENERAL ALIASES
#================================
alias c='clear'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias rgrep='rgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias ls='exa --oneline' #"exa" is version of "ls" rewritten in Rust
alias ll='exa -al'
alias tftp='atftp'
alias suspend='sudo systemctl suspend'
alias homepi='ssh -p 6435 mark@192.168.0.100 -i ~/.ssh/id_ed25519'
alias weather='curl wttr.in'
alias rsync='rsync -av --info=progress2 --info=name0'
alias fd='fd --hidden'
alias rg='rg --hidden'
alias mkdir='mkdir -p'
alias alacrittycfg='nvim ~/.config/alacritty/alacritty.toml'
alias nvimcfg='nvim ~/.dotfiles/.config/nvim/init.vim'
alias qtilecfg='nvim ~/.dotfiles/.config/qtile/config.py'
alias picomcfg='nvim ~/.dotfiles/.config/picom/picom.conf'
alias myip='curl ifconfig.co'
alias telnet='rlwrap nc'
alias ef='find ./ | fzf -e -x | xargs -r -o nvim'
alias mntpasswd='rclone mount --daemon drive:Passwords $HOME/drive --vfs-cache-mode=full'
alias mnthomepi='sshfs homepi:/home/mark /mnt/homepi'
alias mntwindows='sshfs windows:/C: /mnt/windows'
alias vpn-up='wg-quick up homepi-wg'
alias vpn-down='wg-quick down homepi-wg'
alias jd='cd $(find . -type d -print | fzf)'
alias feh='feh -. --edit'
alias lsfont='fc-list | cut -d: -f2 | cut -d, -f1 | sort | uniq'

#==================================
#            HYPRLAND
#==================================
alias disable_laptop_screen='hyprctl keyword monitor eDP-1,disable'

#==================================
#       PACKAGE MANAGERS
#==================================
DISTRO=$(cat /etc/os-release  | grep -Po "(?<=^ID=)\w+")

if [ "$DISTRO" = "ubuntu" ] || [ "$DISTRO" = "debian" ]; then
    alias install='sudo apt install -y'
    alias remove='sudo apt autoremove'
    alias update='sudo apt update -y'
    alias upgrade='sudo apt update -y && sudo apt upgrade -y'
elif [ "$DISTRO" = "arch" ]; then
    alias paru='paru --bottomup --color=always --skipreview'
    alias install='sudo pacman -S'
    alias update='sudo pacman -Sy'
    alias upgrade='sudo pacman -Syu'
    alias remove='sudo pacman -Rns'
    alias p='sudo pacman'
    alias pqs='sudo pacamn -Qs'
    alias pss='sudo pacman -Ss'
    alias psy='sudo pacman -Sy'
    alias psyu='sudo pacman -Syu'
    alias prns='sudo pacman -Rns'
    alias pscc='sudo pacman -Scc'
fi

#==================================
#        GIT
#==================================
alias g='git'
alias gd='git diff'
alias gs='git status'
alias gl='git log'
alias gaa='git add -A'
alias gau='git add -u'
alias gc='git commit'
alias gf='git fetch --all'
alias gg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all"

#===================================
#        MELEXIS RELATED
#===================================
alias ptc05_server='ssh matija@192.168.35.30'
alias ptc05='rlwrap nc 192.168.0.10 2001'
alias ptc05_build='docker run --rm -v ~/.ssh/:/root/.ssh/ -v $PWD:/root/project dryodon/stm32:1.1.0 bash -c "cd /root/project; make clean all"'
alias flash_ptc05='STM32_Programmer_CLI -c port=swd freq=8000 -d ~/Melexis/PTC05_PXI/Release-NoBL/MIP-DEV_NOBL.hex -rst'
alias flash_ptc05_btl='STM32_Programmer_CLI -c port=swd freq=8000 -d ~/Melexis/PTC05_Bootloader-0.6.0.hex -rst'
alias mlxdev='cd ~/Melexis/PTC05_PXI & vim'

#===================================
#       ESPRESSIF 
#===================================
alias get_idf='. $HOME/esp/esp-idf/export.sh'
