#================================
#          MY ALIASES
#================================
alias ls='exa --oneline --icons' #"exa" is version of "ls" rewritten in Rust
alias ll='exa -al --icons'
alias myip='curl ifconfig.co'
alias ptc05_server='ssh matija@192.168.35.30'
alias ptc05='telnet 192.168.0.10 2001'
alias ptc05_build='docker run --rm -v ~/.ssh/:/root/.ssh/ -v $PWD:/root/project dryodon/stm32:1.1.0 bash -c "cd /root/project; make all"'
alias tftp='atftp'
alias suspend='sudo systemctl suspend'
alias confnvim='nvim ~/.config/nvim/init.vim'
#alias vim='nvim'
#alias cat='bat' #"bat" is version of "cat" rewritten in Rust
alias homepi='ssh -p 6435 mark@homepi.nsupdate.info -i ~/.ssh/homepi_rsa'
alias flash_ptc05='STM32_Programmer_CLI -c port=swd -d ~/Melexis/PTC05_PXI/Release-NoBL/PTC05_DEV_NOBL.hex -vb 3 -rst'
alias weather='curl wttr.in'
alias rsync='rsync -av --info=progress2 --info=name0'
alias fd='fd --hidden'
