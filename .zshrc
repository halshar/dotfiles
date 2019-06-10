export ZSH="/home/itachi/.oh-my-zsh"
export PATH=$PATH:$HOME/bin
export WORKON_HOME="$HOME/.virtualenvs"
source /usr/bin/virtualenvwrapper.sh
export EDITOR=vim

ZSH_THEME="agnoster"


plugins=(
  git
  postgres
  django
)

source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

neofetch

alias v='vim'
alias t='tmux'
alias c='tty-clock -cbs -C1'
