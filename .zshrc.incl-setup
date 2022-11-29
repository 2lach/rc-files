#!/bin/zsh
# zmodload zsh/zprof # start zsh profiling
################################################
#
# Resources:
#  https://grml.org/zsh/zsh-lovers.html : tips and tricks
#
#  https://linux.die.net/man/1/zshbuiltins : zshbuiltins
#
#  https://www.zsh.org/ & https://www.mankier.com/1/zsh
#
################################################

OMZ_HOME="$HOME/.oh-my-zsh"

if [ ! -d "$OMZ_HOME" ]; then
  echo "$OMZ_HOME does not exist."
  echo "Would you like to install oh my- sh? (y)es or (n)o"
  read yesorno

if [ "$yesorno" = yes ] || [ "$yesorno" = y ]; then

    sleep 2
    echo "does zsh exists?"
      if (hash "zsh" 2>/dev/null); then
       echo "yes"
      else
        echo "no, installing zsh"
        brew install zsh
      fi
    echo "installing oh my zsh"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [ "$yesorno" = no ] || [ "$yesorno" = n ]; then
    echo 'you choose no and oh my zsh will not be installed'
else
    echo "Not a valid answer."
    exit 1
fi

else
export ZSH="$OMZ_HOME"
fi

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
eval "$(starship init zsh)"
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# History date format
HIST_STAMPS="mm/dd/yyyy"

# where is keep my custom stuff/scripts
ZSH_CUSTOM="$HOME/z-stuff"

# omz plugins
plugins=(git-extras web-search z zsh-syntax-highlighting gh)

source $ZSH/oh-my-zsh.sh

# where i source my local/custom stuff/scripts
source $ZSH_CUSTOM/zsh.local

# zsh options
export HISTFILE=~/.config/zsh/.zsh_history
# ----------------------------------------------
# perform the cd command to dir without 'cd'
setopt AUTO_CD
# Don’t push multiple copies of the same directory onto the directory stack.
setopt PUSHD_IGNORE_DUPS
setopt EXTENDEDGLOB
# User configuration
setopt appendhistory          # Append don't create new
setopt BANG_HIST              # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY       # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY          # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY            # Don't execute immediately upon history expansion.

HISTSIZE=10000000
SAVEHIST=10000000
# note* if 'History' breaks it can be hacked/reseted by adding
# "fc -p /path/to/new_history" at the end zshrc

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# GPG
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent -q updatestartuptty /bye >/dev/null

# Preferred editor for local and remote sessions
# editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# zsh completions path (also some brew stuff)
fpath=(/usr/local/share/zsh-completions $fpath)
fpath+=~/.zfunc

# iterm2 shell integration
# "${HOME}/.config/iterm2/.iterm2_shell_integration.zsh"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# fix weird green color when tabbing folders
zstyle ':completion:*' list-colors
# ----------------------------------------------
# uncomment to finish profiling
# zprof
#  End of zshrc #
################################################
