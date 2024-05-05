# no duplicate commands in history file
setopt HIST_IGNORE_ALL_DUPS

# don't track commands that start with space
setopt HIST_IGNORE_SPACE

# save every command in history file before execution
setopt INC_APPEND_HISTORY

# autocomplete with case insenstivity
autoload -Uz +X compinit && compinit
zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"

# vi mode
bindkey -v
export KEYTIMEOUT=1

# load the aliases file
source "$HOME/.config/zsh/aliasrc"

# node version manager
eval "$(fnm env --use-on-cd)"

# starship prompt
eval "$(starship init zsh)"

# set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
