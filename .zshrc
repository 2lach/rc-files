#!/bin/zsh
# uncomment to debug zsh startup
# zmodload zsh/zprof
## -----------------------------.

# setup paths and stuff
. ~/zsh/paths

## HISTFILE
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=20000000
SAVEHIST=15000000
## append history
setopt INC_APPEND_HISTORY
## share history
setopt sharehistory

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Use starship prompt
eval "$(starship init zsh)"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode reminder # just remind me to update when it's time
# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 30

# see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"

## Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="false"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	# use vim when ssh:ing
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi

# custom folder than $ZSH/custom? default path is ~/.oh-my-zsh/custom
ZSH_CUSTOM=~/zsh/customs

plugins=(
	zsh-async
	alias-tips
	# azure-subscription-prompt
	command-not-found
	fnm
	git-extras
	web-search
	z
	zsh-autosuggestions
	fast-syntax-highlighting
	zsh-completions
	cod
)

source $ZSH/oh-my-zsh.sh

# User configuration
## my functions, aliases and whatnots
# source $HOME/zsh/kube-commands
source $HOME/zsh/aliases
source $HOME/zsh/az.zsh
source $HOME/zsh/docker-functions
source $HOME/zsh/functions
source $HOME/zsh/cafanistan
source $HOME/zsh/osx-scripts
source $HOME/zsh/.secrets
source $HOME/zsh/starship-theme-selector.sh
export MANPATH="/usr/local/man:$MANPATH"

## fnm
export PATH="/Users/stefan/Library/Application Support/fnm:$PATH"
eval "$(fnm env --use-on-cd)"

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8

## azure subscriptopm prompt, show current subscription
# autoload -U colors
# RPROMPT='%{$fg[blue]%}ﴃ $ZSH_SUBSCRIPTION_PROMPT%{$reset_color%}'

# Homebrew command-not-found
HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
if [ -f "$HB_CNF_HANDLER" ]; then
	source "$HB_CNF_HANDLER"
fi

## iterm shell integrations
[ -f ~/.config/.iterm2_shell_integration.zsh ] && source ~/.config/.iterm2_shell_integration.zsh

## fzf shell integration
[ -f ~/.config/.fzf.zsh ] && source ~/.config/.fzf.zsh
# zsh
eval "$(fzf --zsh)"

# show all completions after first tab
bindkey '\t' menu-complete

## partial completion suggestions
zstyle ':completion:*' list-suffixeszstyle ':completion:*' expand prefix suffix

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/stefan/.config/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/stefan/.config/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/stefan/.config/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/stefan/.config/google-cloud-sdk/completion.zsh.inc'; fi

# fuck you omz forcing me to use weird grep
unalias grep

# check startup time
#function zsh_startup_time() {
#	time zsh -i -c exit
#}

## uncomment to debug zsh startup
# -----------------------------.
# zprof
