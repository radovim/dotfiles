# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000

bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ary/.zshrc'

#PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '
eval "$(starship init zsh)"

source ~/.bash_aliases
autoload -Uz compinit
compinit
# End of lines added by compinstall
