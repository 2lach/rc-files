#!/data/data/com.termux/files/usr/bin/zsh
#
# Config
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.config/cache"
export STARSHIP_CACHE="$XDG_CACHE_HOME"
export PIP_CACHE_DIR="$XDG_CACHE_HOME"
# zsh 5.8 (aarch64-unknown-linux-android)
export HISTFILE="$HOME/.config/zsh/.zsh_history"
export ZSH=$HOME/.oh-my-zsh
export ZSH_COMPDUMP="$HOME/.config/zsh/.zcompdump"
export Z_STUFF="$HOME/z-stuff"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export SYSTEM_LOG="/data/data/com.termux/files/usr/var/log/sys_logs/system_updated.txt"

# keep a clean(ish) home
export LESSHISTFILE=/dev/null
export WGETHISTFILE="$HOME/.config/wget/.wget-hsts"
export HORS_ENGINE=bing

# z history
export _Z_DATA="$HOME/.config/z/.z"

# add new $PATH to shell
# source $HOME/z-stuff/paths.sh

##########
# EXPORTS
##########

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export HORS_ENGINE=bing

# cod completions learner
export CODPATH="/data/data/com.termux/files/home/go/bin/cod"

export MANPATH="/usr/local/man:$MANPATH"
export GEMPATH=$(gem env gempath)
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$(go env GOPATH)/bin

# gpg key
export GPG_TTY=$(tty)
