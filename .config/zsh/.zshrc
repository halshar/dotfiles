# Prompt
PS1="%B%F{207}%~ %F{135}❯%f "

# History in cache directory:
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)       # Include hidden files.

# Auto complete with case insenstivity:
zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"

# Vim mode:
bindkey -v
export KEYTIMEOUT=1

# load alias and function files if they exist
[ -f "$HOME/.config/zsh/aliasrc" ] && source "$HOME/.config/zsh/aliasrc"
[ -f "$HOME/.config/zsh/functrc" ] && source "$HOME/.config/zsh/functrc"
