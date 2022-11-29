#!/usr/local/bin/zsh

# shell zsh
export XDG_CONFIG_HOME="$HOME/.config"
export ZSH_COMPDUMP="$HOME/.config/zsh/.zcompdump"
export ZSH_HISTORY="$HOME/.config/zsh/.zsh_history"

SHELL_SESSIONS_DISABLE=1

export _Z_DATA=~/.config/z/.z
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export STARSHIP_CACHE=~/.config/starship/cache/

# dont keep logfiles for:
export LESSHISTFILE=/dev/null
export WGETHISTFILE=/dev/null

# homebrew
export HOMEBREW_NO_ENV_HINTS=true
export HOMEBREW_BREWFILE=~/.config/Brew/Brewfile
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# paths to include
path+=(~/.local/bin)
path+=(/home/pi~/.local/lib)
path+=(/home/pi~/.local/share)
path+=(/usr/bin)
path+=(/usr/local/sbin)
path+=(/usr/local/bin)
path+=(/usr/sbin)
path+=(/usr/local/share/zsh/site-functions)
export PATH

# kubernetes
export KUBECONFIG="/Users/stefan/.kube/config"

# GO path
export GOPATH=$HOME/go
export PATH=$PATH:~/go/bin
export CGO_ENABLED=0

# Java
export JAVA_HOME=$(/usr/libexec/java_home)

# Dotnet
export PATH="$PATH:/Users/stefan/.dotnet/tools"
