#!/data/data/com.termux/files/usr/bin/zsh
# uncomment to profile prompt startup with zprof
# zmodload zsh/zprof

# ZSH Theme
eval "$(starship init zsh)"
# makes - and _ interchangable
HYPHEN_INSENSITIVE="true"
# Dont ask about omz update
DISABLE_UPDATE_PROMPT="true"
# auto update
export UPDATE_ZSH_DAYS=400
# show dots while processing
COMPLETION_WAITING_DOTS="true"
# speed up git when repo is large
DISABLE_UNTRACKED_FILES_DIRTY="true"
# do not save duplicates in zsh history
setopt hist_ignore_all_dups
# how date in history is showed
HIST_STAMPS="mm/dd/yyyy"
# where is keep my custom stuff/scripts
ZSH_CUSTOM="$HOME/z-stuff"

zstyle ':completion:*:complete:(cd|pushd):*' tag-order 'local-directories named-directories'

# omz plugins
plugins=(
        cod
        common-aliases
        gh
        git-extras
        web-search
        z
        zsh-syntax-highlighting
)
# load oh my zsh
source $ZSH/oh-my-zsh.sh
# editor languange
export LANG=en_US.UTF-8
# Use vim as default editor
export EDITOR='vim'
if [[ -n $SSH_CONNECTION ]]; then
        export EDITOR='vim'
fi

# my local zsh control file
source "$ZSH_CUSTOM/zsh.local"

# zprof
