# XDG
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"

# Default apps
export EDITOR="nvim"
export BROWSER="firefox"
export VIDEO="mpv"
export IMAGE="sxiv"
export READER="mupdf"
export MANPAGER="nvim +Man!"

# zsh
export HISTSIZE=50000
export SAVEHIST=50000
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export HISTFILE="${XDG_CACHE_HOME}/zsh/history"

# Tools
export PROJECTS_TOOLS="${HOME}/projects/tools"
export GOPATH="${PROJECTS_TOOLS}/go"
export CARGO_HOME="${PROJECTS_TOOLS}/rust"
export RUSTUP_HOME="${PROJECTS_TOOLS}/rustup"
export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/starship.toml"

PATH="${PATH}:${HOME}/.local/bin:${CARGO_HOME}/bin:${GOPATH}/bin"
export PATH
