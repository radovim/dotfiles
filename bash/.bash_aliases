#================================
#        GENERAL ALIASES
#================================
alias c='clear'
alias grep='grep --color=auto'
if [[ -n "$(command -v rg)" ]]; then
  alias grep='rg --hidden'
fi
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias ls='eza --oneline --icons=always'
alias la='eza --all --oneline --icons=always'
alias ll='eza --all --long --header --icons=always'
alias cat='bat'
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
alias mntpasswd='rclone mount --daemon gdrive:Passwords $HOME/gdrive --vfs-cache-mode=full'
alias mntdrive='rclone mount gdrive:/ ~/gdrive/ --vfs-cache-mode=full --daemon'
alias umountdrive='fusermount -u ~/gdrive'
alias vpn-up='wg-quick up homepi-wg'
alias vpn-down='wg-quick down homepi-wg'
alias jd='cd $(find . -type d -print | fzf)'
alias feh='feh -. --edit'
alias lsfont='fc-list | cut -d: -f2 | cut -d, -f1 | sort | uniq'

command -v nvim >/dev/null 2>&1 && alias v="nvim" || {command -v vim >/dev/null 2>&1 && alias v="vim" || alias v="vi"}

#==================================
#            HYPRLAND
#==================================
alias disable_laptop_screen='hyprctl keyword monitor eDP-1,disable'

#==================================
#       PACKAGE MANAGERS
#==================================
DISTRO=$(/usr/bin/cat /etc/os-release | grep -Po "(?<=^ID=)\w+")

if [ "$DISTRO" = "ubuntu" ] || [ "$DISTRO" = "debian" ]; then
  alias install='sudo apt install -y'
  alias remove='sudo apt autoremove'
  alias update='sudo apt update -y'
  alias upgrade='sudo apt update -y && sudo apt upgrade -y'
elif [ "$DISTRO" = "arch" ]; then
  alias yay='yay --color=always'
  alias install='sudo pacman -S'
  alias update='sudo pacman -Sy'
  alias upgrade='sudo pacman -Syu'
  alias remove='sudo pacman -Runs'
  alias p='sudo pacman'
  alias pqs='sudo pacamn -Qs'
  alias pss='sudo pacman -Ss'
  alias psy='sudo pacman -Sy'
  alias psyu='sudo pacman -Syu'
  alias pruns='sudo pacman -Runs'
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
#       ESPRESSIF
#===================================
alias get_idf='. $HOME/esp/esp-idf/export.sh'
