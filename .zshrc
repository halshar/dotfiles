export PATH=$PATH:$HOME/bin
export WORKON_HOME="$HOME/.virtualenvs"
source /usr/bin/virtualenvwrapper.sh
export EDITOR=vim

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey -v
export KEYTIMEOUT=1

autoload -U promptinit && promptinit
prompt fade
# prompt fire red magenta blue white white white

neofetch

alias la='ls -lAh'
alias ll='ls -lh'
alias v='vim'
alias t='tmux'
alias yt='youtube-dl'
alias img='sxiv -f'
alias bat='acpi -bti'
alias fm='ranger'
alias nw='newsboat'
