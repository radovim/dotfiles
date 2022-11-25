parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/<\1>/'
}

PS1='\[\033[00;32m\]\u@\h\[\033[00m\]:\[\033[00;34m\]\w\[\033[00m\]\[\033[00;31m\]$(parse_git_branch)\[\033[00m\]\$ '

[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bash_variables ] && . ~/.bash_variables

#Start fish
~/.scripts/fish_abbrs_auto_gen.sh
fish

