# Default apps
export EDITOR="nvim"
export READER="zathura"
export BROWSER="firefox"
export FILE="lf"
export VIDEO="mpv"
export IMAGE="sxiv"

# ZSH specific env variables
export HISTSIZE=50000
export SAVEHIST=50000
export HISTFILE="$HOME/.cache/zsh/history"
export ZDOTDIR="$HOME/.config/zsh"

# XDG paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Clean up
export LESS=-R
export LESSHISTFILE="-"

# App paths
export PROJECTS_TOOLS="$HOME/projects/tools"
export GOPATH="$PROJECTS_TOOLS/go"
export CARGO_HOME="$PROJECTS_TOOLS/rust"
export RUSTUP_HOME="$PROJECTS_TOOLS/rustup"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

PATH="$PATH:$HOME/.local/bin:/usr/local/go/bin:$CARGO_HOME/bin:$GOPATH/bin"
export PATH
