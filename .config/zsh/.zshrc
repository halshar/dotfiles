# Prompt
PS1="%B%F{207}%~ %F{135}❯%f "

git_branch_test_color() {
  local ref=$(git symbolic-ref --short HEAD 2> /dev/null)
  if [ -n "${ref}" ]; then
    if [ -n "$(git status --porcelain)" ]; then
      local gitstatuscolor="%F{red}"
    else
      local gitstatuscolor="%F{green}"
    fi
    echo "${gitstatuscolor}(${ref})"
  else
    echo ""
  fi
}

setopt PROMPT_SUBST
RPROMPT='%f$(git_branch_test_color)%f'

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
