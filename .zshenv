#!/bin/zsh

# zsh
SHELL_SESSIONS_DISABLE=1
export XDG_CONFIG_HOME="$HOME/.config"
export ZSH_HISTORY="$HOME/.config/zsh/.zsh_history"
export ZSH_COMPDUMP="$HOME/.config/zsh/.zsh_compdump"
# dont keep logfiles for:
export LESSHISTFILE=/dev/null
export WGETHISTFILE=/dev/null

# homebrew
export PATH=/opt/homebrew/bin:$PATH

export LANG=en_US.UTF-8

. $HOME/zsh/paths
# paths to include
path+=("/Users/stefan/Library/Application Support/fnm")
path+=(/opt/homebrew/bin/brew)
path+=(/usr/bin)
path+=(/usr/local/bin)
path+=(/usr/local/sbin)
path+=(/usr/local/share/zsh/site-functions)
path+=(/usr/sbin)
path+=(usr/local/share)
path+=(~/.local/bin)
# fpath=(/usr/share/zsh/5.8.1/functions $fpath)
export PATH

# homebrew
export HOMEBREW_NO_ENV_HINTS=true

# kubernetes
export KUBECONFIG="/Users/stefan/.kube/config"

# GO path
export GOPATH=$HOME/go
export PATH=$PATH:~/go/bin
export CGO_ENABLED=1

# Java
export JAVA_HOME=$(/usr/libexec/java_home)

# Dotnet
export PATH="$PATH:/Users/stefan/.dotnet/tools"

# Rust | cargo
. "$HOME/.cargo/env"

# plugin config
export _Z_DATA=~/.config/z/.z
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export STARSHIP_CACHE=~/.config/starship/cache/
export PATH="/opt/homebrew/sbin:$PATH"
