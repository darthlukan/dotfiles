# The following lines were added by compinstall 
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate 
zstyle ':completion:*' completions 1 
zstyle ':completion:*' format ''\''Completing %d'\''' 
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name '' 
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} 
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' max-errors 2 numeric
zstyle ':completion:*' menu select=1
zstyle ':completion:*' prompt '`%e'\'''
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 1
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/darthlukan/.zshrc'

# source /usr/share/doc/pkgfile/command-not-found.zsh

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install

# OH MY ZSH
ZSH=/usr/share/oh-my-zsh
ZSH_THEME="agnoster"
source $ZSH/oh-my-zsh.sh

# Aliases
alias ls='ls --color=always -aF'
alias cat='$HOME/go/bin/gocat'
alias echo='$HOME/go/bin/gecho'

# Vars
export EDITOR="vim"
export BROWSER="chromium"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

# GOPATH
export GOPATH="$HOME/go"

# $PATH
export PATH=$PATH:$HOME/bin:$GOPATH/bin

# Java Fonts
export JAVA_FONTS=/usr/share/fonts/TTF
export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

