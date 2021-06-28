# Prompt
PS1="%B%F{207}%~ %F{135}❯%f "

git_branch_test_color() {
  local ref=$(git symbolic-ref --short HEAD 2> /dev/null)
  if [ -n "${ref}" ]; then
    if [ -n "$(git status --porcelain)" ]; then
      local gitstatuscolor='%F{red}'
    else
      local gitstatuscolor='%F{green}'
    fi
    echo "${gitstatuscolor}(${ref})"
  else
    echo ""
  fi
}

setopt PROMPT_SUBST
RPROMPT='%f$(git_branch_test_color)%f'

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)       # Include hidden files.

# Auto complete with case insenstivity:
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Vim mode:
bindkey -v
export KEYTIMEOUT=1

# Aliases:
alias ls='ls --color=auto'
alias la='ls -lAh'
alias ll='ls -lh'
alias v='nvim'
alias t='tmux'
alias yt='youtube-dl'
alias img='sxiv -f'
alias ds='du -sh ./* | sort -h; du -sh'
alias myip='curl https://ipinfo.io/ip'
alias tp='trash-put'
alias grep='grep --color=auto'
alias history='history 1'
alias ev='nvim ~/.config/nvim/init.vim'
alias es='nvim ~/.config/sxhkd/sxhkdrc'
alias eb='nvim ~/.config/bspwm/bspwmrc'
alias ez='nvim ~/.zshrc'
alias et='nvim ~/.tmux.conf'

# Execute the contents of the files:
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
