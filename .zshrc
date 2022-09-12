# Lines configured by zsh-newuser-install
export HISTFILE=~/.histfile
export HISTSIZE=1000
export SAVEHIST=1000
export DIRHISTORY_SIZE=1000

bindkey -e

# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '- ('$branch')'
  fi
}

zle -N accept-line
accept-line() {
  BUFFER=${BUFFER/' ~?'/' ~/'}
  zle .accept-line
}

# Enabling and setting git info var to be used in prompt config.
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn

# This line obtains information from the vcs.
zstyle ':vcs_info:git*' formats "(%b)"

precmd() {
    vcs_info
}

# Enable substitution in the prompt.
setopt prompt_subst


prompt='%F{green}%n@%m %F{blue}%~%F{red}${vcs_info_msg_0_}%F{white}$ '

source ~/.zsh/lib/functions.zsh
#================================
#          PLUGINS
#================================
source ~/.zsh/plugins/web-search.plugin.zsh
source ~/.zsh/plugins/sudo.plugin.zsh
source ~/.zsh/plugins/dirhistory.plugin.zsh

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
alias flash_ptc05='STM32_Programmer_CLI -c port=swd -d ~/Melexis/PTC05_PXI/Release-NoBL/PTC05_DEV_NOBL.hex -rst'

# End of lines configured by zsh-newuser-install
alias weather='curl wttr.in'
alias rsync='rsync -av --info=progress2 --info=name0'
alias fd='fd --hidden'
