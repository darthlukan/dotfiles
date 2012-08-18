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
zstyle :compinstall filename '/home/your_username/.zshrc'

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

# Path stuffs
export PATH=$PATH:$HOME/bin

# Locale settings, this fixes PYTHONENV errors related to locale returning (None, None)
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# Aliases
alias ls='ls --color=always -aF'
    # Known networked computers
alias sshwife='ssh -X -p 22 username@ip_or_hostname'
alias sshkid1='ssh -X -p 22 username@ip_or_hostname'
alias sshkid2='ssh -X -p 22 username@ip_or_hostname'
alias sshminisith='ssh -X -p 22 username@ip_or_hostname'

# Colorize grep
alias grep='grep --color=always'


#Prompt
autoload -U promptinit
promptinit 
prompt elite2 green
