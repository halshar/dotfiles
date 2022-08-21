# default apps
export EDITOR="nvim"
export READER="zathura"
export BROWSER="firefox"
export FILE="lf"
export VIDEO="mpv"
export IMAGE="sxiv"

# update path env variable
PATH="$PATH:$HOME/.local/bin:/usr/local/go/bin:$HOME/go/bin"
export PATH

# zsh specific env variables
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE="$HOME/.cache/zsh/history"
export ZDOTDIR="$HOME/.config/zsh"

# clean up
export LESS=-R
export LESSHISTFILE="-"

# xdg paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
