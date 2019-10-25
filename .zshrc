export ZSH="/home/itachi/.oh-my-zsh"
export PATH=$PATH:$HOME/bin:$HOME/.local/bin
export WORKON_HOME="$HOME/.virtualenvs"
source /usr/bin/virtualenvwrapper.sh
export EDITOR=vim

ZSH_THEME="agnoster"

source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey -v
export KEYTIMEOUT=1

neofetch

alias v='vim'
alias t='tmux'
alias c='tty-clock -cbs -C1'
alias yt='youtube-dl'
alias img='sxiv -f'
alias bat='acpi -bti'
