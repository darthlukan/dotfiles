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

# Aliases
alias ls='ls --color=always -aF'
alias less='less -r'
alias tree='tree -C -L 2'
alias cat='$HOME/go/bin/gocat'

# Vars
export TERMINAL="urxvt"
export TERM="xterm-256color"
export EDITOR="vim"
export RTV_EDITOR=$EDITOR
export BROWSER="chromium"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export XDG_CONFIG_HOME="$HOME/.config"
source ~/.secrets

# .deb packaging
export DEBFULLNAME="Brian Tomlinson"
export DEBEMAIL="darthlukan@gmail.com"

# Scheme and Guile
export GUILE_AUTO_COMPILE=0

# GOPATH
export GOPATH="$HOME/go"

# $PATH
export PATH=$PATH:$HOME/bin:$GOPATH/bin:/sbin:/usr/sbin

# Java Fonts
export JAVA_FONTS=/usr/share/fonts/TTF
export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# Prompt
autoload -U colors; colors # Colors are good

build_prompt() {
    local p
    p=()
    if [[ $UID -eq 0 ]]; then
        p+="%{$fg[yellow]%}⚡" 
    else
        p+="%{$fg[green]%}⊡"
    fi
    [[ -n $p ]] && echo "$p"  # Need 'echo' or the color escapes cause errors
}
# Engage
PROMPT=" $(build_prompt)%{$reset_color%} ❱ "  # Spaces count!
