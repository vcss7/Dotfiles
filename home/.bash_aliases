# Alias definitions

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias ls='ls  -X            \
                  --almost-all  \
                  --classify    \
                  --color=auto  \
                  --group-directories-first'
    alias ll='ls  -lX               \
                  --almost-all      \
                  --classify        \
                  --human-readable  \
                  --color=auto      \
                  --group-directories-first'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    alias ls='ls  -X
                  --almost-all  \
                  --classify    \
                  --group-directories-first'
    alias ll='ls  -lX               \
                  --almost-all      \
                  --classify        \
                  --human-readable  \
                  --group-directories-first'
fi


# prompt before overwriting
alias cp='cp --interactive --verbose'
alias mv='mv --interactive --verbose'
alias rm='rm --interactive=once --verbose'

# git aliases
alias ga='git add'
alias gaa='git add .'
alias gb='git branch'
alias gc='git commit'
alias gl='git log'
alias gs='git status'
alias gsubup='git submodule update --init'
alias gsubpull='git submodule foreach git pull origin master'
alias gsubpush='git submodule foreach git push origin master'

# some tree aliases for better output
if tree -v &> /dev/null; then
  alias t='tree -aCF --dirsfirst -I *.git*'
fi

# print working directory
alias p='pwd'

# capture webcam output with mpv
alias mpvcam='mpv --demuxer-lavf-format=video4linux2      \
                  --demuxer-lavf-o-set=input_format=mjpeg \
                  av://v5l2:/dev/video0'
