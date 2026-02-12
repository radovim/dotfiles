parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ 󰘬 \1/'
}

PS1='[\[\033[00;32m\]\u@\h\[\033[00m\]]\[\033[00;34m\]\w\[\033[00m\]\[\033[00;31m\]$(parse_git_branch)\[\033[00m\]\$ '

[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bash_variables ] && . ~/.bash_variables
[ -f ~/.bash_zoxide ] && . ~/.bash_zoxide

export EDITOR=/usr/bin/nvim

# Ctrl+S typically suspends (freezes) terminal output, a legacy feature for flow control
# This line disables that legacy feature, which allows Ctrl+S to be used for forward-search-history
stty -ixon

#Start fish
#~/.scripts/fish_abbrs_auto_gen.sh
#fish

#if [ -z "$TMUX" ]; then
#    tmux attach -t default || tmux new -s default
#fi
# Use bash-completion, if available, and avoid double-sourcing
[[ $PS1 &&
  ! ${BASH_COMPLETION_VERSINFO:-} &&
  -f /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

. "${SWIFTLY_HOME_DIR:-$HOME/.local/share/swiftly}/env.sh"
