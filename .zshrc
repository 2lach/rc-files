#!/usr/local/bin/zsh

# uncomment to debug zsh startup
# zmodload zsh/zprof
# -----------------------------.

# HISTFILE
HISTFILE=~/zsh/.zsh_history
HISTSIZE=20000000
SAVEHIST=15000000
setopt INC_APPEND_HISTORY
# share history
setopt sharehistory
# omz path
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="sorin" "af-magic"
eval "$(starship init zsh)"

# switch prompts theme
function stefan_theme() {
	cat /Users/stefan/.config/starship/stefan_starship.toml >/Users/stefan/.config/starship/starship.toml
}

function pure_theme() {
	cat /Users/stefan/.config/starship/pure-preset.toml >/Users/stefan/.config/starship/starship.toml
}
function power_theme() {
	cat /Users/stefan/.config/starship/powerline.toml >/Users/stefan/.config/starship/starship.toml
}

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto # update automatically without asking

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="false"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

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
# ZSH_CUSTOM=/path/to/new-custom-folder
# default path is ~/.oh-my-zsh/custom

plugins=(
	zsh-async
	alias-tips
	azure-subscription-prompt
	command-not-found
	fnm
	git-extras
	web-search
	z
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	# ise vim when ssh:ing
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# my functions, aliases and what nots
source $HOME/zsh/aliases
source $HOME/zsh/az.zsh
source $HOME/zsh/cafanistan
source $HOME/zsh/docker-functions
source $HOME/zsh/functions
source $HOME/zsh/kube-commands
source $HOME/zsh/osx-scripts
source $HOME/zsh/.secrets

function zsh_startup_time() {
	time zsh -i -c exit
}

# azure subscriptopm prompt, show current subscription
autoload -U colors
RPROMPT='%{$fg[blue]%}ﴃ $ZSH_SUBSCRIPTION_PROMPT%{$reset_color%}'

# enable vi mode
bindkey -v

# iterm shell integrations
[ -f ~/.config/.iterm2_shell_integration.zsh ] && source ~/.config/.iterm2_shell_integration.zsh

# fzf shell integration
[ -f ~/.config/.fzf.zsh ] && source ~/.config/.fzf.zsh

# nvm is heavy to load so lazy load it on use
# shell startup time goes from ~2.2s to ~0.8s
function lazy_load_nvm() {
	unset -f nvm node npm
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
}

function nvm() {
	lazy_load_nvm
	nvm $@
}

function node() {
	lazy_load_nvm
	node $@
}

function npm() {
	lazy_load_nvm
	npm $@
}

# load PYENV
export PYENV_ROOT="$HOME/config/.pyenv"
# verifies pyenv is installed
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# uncomment to debug zsh startup
# -----------------------------.
# zprof
