# git branch prompt
parse_git_branch() {
    git symbolic-ref --short HEAD 2> /dev/null
}
# left and right prompt
setopt PROMPT_SUBST
PROMPT='%B%F{207}%~ %f%F{135}❯%b%f '
RPROMPT='%B%F{46}$(parse_git_branch)%b%f'

# auto complete with case insenstivity
zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"

# vi mode
bindkey -v
export KEYTIMEOUT=1

# load the alias file
source "$HOME/.config/zsh/aliasrc"
