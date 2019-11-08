export PATH=$PATH:$HOME/bin
export WORKON_HOME="$HOME/.virtualenvs"
export EDITOR=vim

# Theme:
autoload -U promptinit && promptinit
prompt fade

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

bindkey -v
export KEYTIMEOUT=1

alias la='ls -lAh'
alias ll='ls -lh'
alias v='vim'
alias t='tmux'
alias yt='youtube-dl'
alias img='sxiv -f'
alias bat='acpi -bti'
alias ev='v ~/.vimrc'
alias ez='v ~/.zshrc'
alias et='v ~/.tmux.conf'
alias se='du -a ~/bin/* ~/Documents/* ~/.config/* | awk "{print \$2}" | fzf | xargs -r -o $EDITOR'

neofetch

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/bin/virtualenvwrapper.sh
