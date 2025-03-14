# additional shell options
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY

# autocomplete with case insenstivity
autoload -Uz +X compinit edit-command-line && compinit
zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}"
zstyle ":completion:*" menu select

# vi mode
bindkey -v
export KEYTIMEOUT=1

# enable command line edit option in insert and normal modes
zle -N edit-command-line
bindkey -M viins '^X^E' edit-command-line
bindkey -M vicmd '^X^E' edit-command-line

# load the aliases files
source "$HOME/.config/zsh/aliasrc"
source "$HOME/.config/private/privaterc"

# setup mise
eval "$(mise activate zsh)"

# starship prompt
eval "$(starship init zsh)"

# set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
