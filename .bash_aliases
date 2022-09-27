#================================
#          MY ALIASES
#================================
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls='exa --oneline --icons' #"exa" is version of "ls" rewritten in Rust
alias ll='exa -al --icons'
alias myip='curl ifconfig.co'
alias ptc05_server='ssh matija@192.168.35.30'
alias ptc05='rlwrap nc 192.168.0.10 2001'
alias ptc05_build='docker run --rm -v ~/.ssh/:/root/.ssh/ -v $PWD:/root/project dryodon/stm32:1.1.0 bash -c "cd /root/project; make clean all"'
alias tftp='atftp'
alias suspend='sudo systemctl suspend'
alias homepi='ssh -p 6435 mark@192.168.0.100 -i ~/.ssh/id_ed25519'
alias weather='curl wttr.in'
alias rsync='rsync -av --info=progress2 --info=name0'
alias fd='fd --hidden'
alias rg='rg --hidden'
alias mkdir='mkdir -p'
alias alacrittyconf='nvim ~/.dotfiles/.config/alacritty/alacritty.yml'
alias nvimconf='nvim ~/.dotfiles/.config/nvim/init.vim'
alias qtileconf='nvim ~/.dotfiles/.config/qtile/config.py'
alias picomconf='nvim ~/.dotfiles/.config/picom/picom.conf'
alias myip='curl ifconfig.co'
alias homepi='ssh -p 6435 mark@192.168.0.100 -i ~/.ssh/id_ed25519'
alias telnet='rlwrap nc'

#===================================
#        MELEXIS RELATED
#===================================
alias ptc05_server='ssh matija@192.168.35.30'
alias ptc05='rlwrap nc 192.168.0.10 2001'
alias ptc05_build='docker run --rm -v ~/.ssh/:/root/.ssh/ -v $PWD:/root/project dryodon/stm32:1.1.0 bash -c "cd /root/project; make clean all"'
alias tftp='atftp'
alias suspend='sudo systemctl suspend'
alias flash_ptc05='STM32_Programmer_CLI -c port=swd -d ~/Melexis/PTC05_PXI/Release-NoBL/PTC05_DEV_NOBL.hex -vb 3 -rst'
alias mlxdev='cd ~/Melexis/PTC05_PXI; nvim'
