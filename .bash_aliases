# Alias definitions

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -AF --color=auto --group-directories-first'
    alias ll='ls -lAFh --color=auto --group-directories-first'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    alias ls='ls -A --group-directories-first'
    alias ll='ls -lAh --group-directories-first'
fi

# prompt before overwriting
alias cp='cp --interactive --verbose'
alias mv='mv --interactive --verbose'
alias rm='rm --interactive --verbose'

# capture webcam output with mpv
alias mpvcam='mpv --demuxer-lavf-format=video4linux2 --demuxer-lavf-o-set=input_format=mjpeg av://v5l2:/dev/video0'
