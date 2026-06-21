#!/usr/bin/zsh

ZSH_THEME_RANDOM_CANDIDATES=("af-magic" "sorin" "refined")

ZSH_THEME=random

HYPHEN_INSENSITIVE="true"

# resolve symlinks to realpath when using cd
setopt chase_links
# do not save dupes in history
setopt hist_ignore_all_dups
# do not show dupes when viewing history
setopt hist_find_no_dups

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$HOME/z-stuff/custom"

plugins=(
	command-not-found
#	fzf-tab
	gh
	git
	nmap
	uv
	z
)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='vim'
fi

# my aliases n fns
source "$ZSH_CUSTOM/scripts/.functions"
source "$ZSH_CUSTOM/scripts/.docker-functions"
source "$ZSH_CUSTOM/scripts/.aliases"
source "$ZSH_CUSTOM/scripts/network-scan.sh"
source "$HOME/z-stuff/zsh.local"

# competion daemon
source "$ZSH_CUSTOM/plugins/cod/cod.plugin.zsh"

# fix weird green shit when tabbing dirs
zstyle ':completion:*' list-colors

function kill-nuts-log() {
	sudo systemctl stop nut-monitor.service
}

# custom plugins this should always be loaded last according to their docs
source "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
