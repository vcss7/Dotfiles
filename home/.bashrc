#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# vi mode
set -o vi

# git branch for PS1
parse_git_branch() {
  if command -v git &> /dev/null; then
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
  fi
}

# Prompt urxvt
# PS1="$POWDER_BLUE_FG[\u@\h $NORMAL_FG\W$POWDER_BLUE_FG] \$(parse_git_branch)\$ $NORMAL_FG"
PS1="\[\e[34m\][\u@\h \[\e[m\]\W\[\e[34m\]] \$(parse_git_branch)$\[\e[m\] "
# PS2="$POWDER_BLUE_FG>$NORMAL_FG"

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# grab aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features bash
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# enable programmable completion features git
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

## auto ssh athentication git
# ssh-add ~/.ssh/id_ed25519

# add local binaries to path
export PATH=~/local/bin:$PATH

# add editor
export EDITOR=nvim

#################### Functions ###################

# move up $1 directories
up () {
  local d=""
  local limit="$1"

  # Default to limit of 1
  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
    limit=1
  fi

  for ((i=1;i<=limit;i++)); do
    d="../$d"
  done
  
  # perform cd. Show error if cd fails
  if ! cd "$d"; then
    echo "Couldn't go up $limit dirs.";
  fi
}

