# prompt
PS1="%B%F{207}%~ %F{135}❯%f "

# auto complete with case insenstivity
zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"

# vi mode
bindkey -v
export KEYTIMEOUT=1

# load aliasrc file if it exists
[ -f "$HOME/.config/zsh/aliasrc" ] && source "$HOME/.config/zsh/aliasrc"
