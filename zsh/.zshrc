# Lines configured by zsh-newuser-install

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000

bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

# Automatically update PATH entries
zstyle ':completion:*' rehash true

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '[󰘬 %b]'

setopt PROMPT_SUBST

PROMPT='%F{white}[%n@%F{green}%m%F{white}]%F{blue}%~%F{red}${vcs_info_msg_0_}%F{white}$ '

[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_variables ] && source ~/.bash_variables

autoload -Uz compinit
compinit
# End of lines added by compinstall

if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Resolves the appearance of the "%" character in a new Foot terminal window
# if [[ "$TERM" == "foot" || "$TERM" == "foot-extra" ]]; then
#     # Hide the character completely for Foot
#     PROMPT_EOL_MARK=""
# fi

