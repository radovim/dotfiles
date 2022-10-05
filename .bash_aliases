#================================
#          MY ALIASES
#================================
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls='exa --oneline --icons' #"exa" is version of "ls" rewritten in Rust
alias ll='exa -al --icons'
alias myip='curl ifconfig.co'
alias tftp='atftp'
alias suspend='sudo systemctl suspend'
alias homepi='ssh -p 6435 mark@192.168.0.100 -i ~/.ssh/id_ed25519'
alias weather='curl wttr.in'
alias rsync='rsync -av --info=progress2 --info=name0'
alias fd='fd --hidden'
alias rg='rg --hidden'
alias mkdir='mkdir -p'
alias alacrittycfg='nvim ~/.dotfiles/.config/alacritty/alacritty.yml'
alias nvimcfg='nvim ~/.dotfiles/.config/nvim/init.vim'
alias qtilecfg='nvim ~/.dotfiles/.config/qtile/config.py'
alias picomcfg='nvim ~/.dotfiles/.config/picom/picom.conf'
alias myip='curl ifconfig.co'
alias homepi='ssh -p 6435 mark@192.168.0.100 -i ~/.ssh/id_ed25519'
alias telnet='rlwrap nc'
alias ef='find ./ | fzf -e -x | xargs -r -o vim'
alias mntnextcloud='rclone mount --daemon nextcloud:/ ~/Nextcloud'
alias notes='vim ~/Sync/Notes/'
#=================================
#        PACMAN
#=================================
alias p='sudo pacman'
alias pqs='sudo pacamn -Qs'
alias pss='sudo pacman -Ss'
alias psy='sudo pacman -Sy'
alias psyu='sudo pacman -Syu'
alias prns='sudo pacman -Rns'
alias pscc='sudo pacman -Scc'

#==================================
#        GIT
#==================================
alias gd='git diff'
alias gs='git status'
alias gaa='git add .'

#===================================
#        MELEXIS RELATED
#===================================
alias ptc05_server='ssh matija@192.168.35.30'
alias ptc05='rlwrap nc 192.168.0.10 2001'
alias ptc05_build='docker run --rm -v ~/.ssh/:/root/.ssh/ -v $PWD:/root/project dryodon/stm32:1.1.0 bash -c "cd /root/project; make clean all"'
alias flash_ptc05='STM32_Programmer_CLI -c port=swd freq=1 -d ~/Melexis/PTC05_PXI/Release-NoBL/PTC05_DEV_NOBL.hex -rst'
alias flash_ptc05_btl='STM32_Programmer_CLI -c port=swd freq=1 -d ~/Melexis/PTC05_Bootloader-0.6.0.hex -rst'
alias mlxdev='cd ~/Melexis/PTC05_PXI & nvim'
