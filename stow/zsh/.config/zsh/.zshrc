# additional shell options
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY

# autocomplete with case insenstivity
autoload -Uz +X compinit && compinit
zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}"
zstyle ":completion:*" menu select

# vi mode
bindkey -v
export KEYTIMEOUT=1

# load the aliases files
source "$HOME/.config/zsh/aliasrc"
source "$HOME/.config/private/privaterc"

# setup mise
eval "$(mise activate zsh)"

# starship prompt
eval "$(starship init zsh)"

# set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
