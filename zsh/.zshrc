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
# Vi mode
bindkey -v
# End of lines configured by zsh-newuser-install

# Aliases
alias ls='ls --color=always -aF'
alias less='less -r'
alias tree='tree -C -L 2'
#alias cat='$HOME/go/bin/gocat'
alias fatfiles='find $(pwd) -xdev -type f -size +1000M'

# Vars
export vblank_mode=0
export TERMINAL="urxvt"
export TERM="xterm-256color"
export EDITOR="vim"
export RTV_EDITOR=$EDITOR
export BROWSER="firefox"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export XDG_CONFIG_HOME="$HOME/.config"
source $HOME/.secrets

# snaps
export SNAP_PATH="/snap"

# .deb packaging
export DEBFULLNAME="Brian Tomlinson"
export DEBEMAIL="darthlukan@gmail.com"

# Scheme and Guile
export GUILE_AUTO_COMPILE=0

# Python
export WORKON_HOME="$HOME/.virtualenvs"
# source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

# GOPATH
export GOPATH="$HOME/go"

# Rust
export CARGO_PATH="$HOME/.cargo"

# Raspberry Pi Pico
export PICO_SDK_PATH="$HOME/projects/pico-sdk"

# $PATH
export PATH=$PATH:$HOME/bin:$GOPATH/bin:$CARGO_PATH/bin:/sbin:/usr/sbin:$SNAP_PATH/bin:/usr/local/bin

# Java Fonts
export JAVA_FONTS=/usr/share/fonts/TTF
export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# Prompt
autoload -U colors; colors # Colors are good

function ins-mode() { echo "λ" }
function cmd-mode() { echo "Ω" }

function build_prompt() {
    local p
    p=()
    if [[ $UID -eq 0 ]]; then
        p+="%{$fg[yellow]%}⚡"
    else
        p+="%{$fg[green]%}⊡"
    fi
    [[ -n $p ]] && echo "$p"  # Need 'echo' or the color escapes cause errors
}

function TRAPINT() {
    VIM_MODE=$(ins-mode)
    zle && zle reset-prompt
    return $(( 128 + $1 ))
}

function set-prompt() {
    case ${KEYMAP} in
        (vicmd)
            VIM_MODE="%{$fg[red]%}$(cmd-mode)"
            ;;
        (main | viins)
            VIM_MODE="%{$fg[green]%}$(ins-mode)"
            ;;
        (*)
            VIM_MODE="%{$fg[green]%}$(ins-mode)"
            ;;
    esac

    PROMPT=" ${VIM_MODE}%{$reset_color%} $(build_prompt)%{$reset_color%} ❱ "
}

function zle-line-init zle-keymap-select {
  set-prompt
  zle && zle reset-prompt
}

function zle-line-finish {
    VIM_MODE=$(ins-mode)
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
