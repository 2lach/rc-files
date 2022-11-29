# include omv-packages
path+=(/home/pi/.local/bin)
path+=(/home/pi/.local/lib)
path+=(/home/pi/.local/share)
path+=(/usr/bin)
path+=(/usr/local/bin)
path+=(/usr/sbin)                 # omv- scripts
path+=(/usr/share/openmediavault) # omv_ helper functions
export PATH
export LESSHISTFILE=/dev/null
export WGETHISTFILE=$HOME/.config/wget/.wget-hsts
# zsh stuff
export HISTFILE="$HOME/.config/zsh/.zsh_history"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP="$HOME/.config/zsh/.zcompdump"

# GO path
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export GO111MODULE=on

export PKG_CONFIG_PATH=/usr/lib/pkgconfig
#export LIBVA_DRIVER_NAME=i965
export LC_ALL="en_GB.UTF-8"
export LC_CTYPE="en_GB.UTF-8"
export LC_MESSAGES="en_GB.UTF-8"
# export LC_ALL=C
#
# gpg key
export GPG_TTY=$(tty)
