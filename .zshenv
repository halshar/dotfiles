# default apps
export EDITOR="nvim"
export READER="zathura"
export TERMINAL="alacritty"
export BROWSER="firefox"

# other program settings:
export LESS=-R

# clipmenu
export CM_SELECTIONS="clipboard"
export CM_MAX_CLIPS=50

# colored man pages
# start blinking
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
# start bold
export LESS_TERMCAP_md=$(tput bold; tput setaf 2) # green
# start stand out
export LESS_TERMCAP_so=$(tput bold; tput setaf 3) # yellow
# end standout
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
# start underline
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1) # red
# end underline
export LESS_TERMCAP_ue=$(tput sgr0)
# end bold, blinking, standout, underline
export LESS_TERMCAP_me=$(tput sgr0)
