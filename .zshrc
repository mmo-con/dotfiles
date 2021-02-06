# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
# Use FZF keybindings if installed
if [[ -e /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
fi

unsetopt nomatch

export FZF_DEFAULT_COMMAND='rg --files'

# exa as ls-substitute
alias la='exa -agl --time-style=long-iso --group-directories-first'
alias ll='exa -gl --time-style=long-iso --group-directories-first'
alias lt='exa -gl --sort=time --time-style=long-iso --group-directories-first'
alias lr='exa -glT --time-style=long-iso --group-directories-first'

alias vv='vim -o `fzf`'
alias uyd='sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /dropbox/skripte/ytd'
alias ytd='/dropbox/skripte/ytd'

ex ()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1   ;;
            *.tar.gz)    tar xzf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1   ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1   ;;
            *.tgz)       tar xzf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

kp ()
{
    ### PROCESS
    # mnemonic: [K]ill [P]rocess
    # show output of "ps -ef", use [tab] to select one or multiple entries
    # press [enter] to kill selected processes and go back to the process list.
    # or press [escape] to go back to the process list. Press [escape] twice to exit completely.

    local pid=$(ps -ef | sed 1d | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[kill:process]'" | awk '{print $2}')

    if [ "x$pid" != "x" ]
        then
            echo $pid | xargs kill -${1:-9}
            kp
    fi
}

gcs ()
{
    # mnemonic: [G]it [C]ommit [S]how
    git lg --color=always |\
    fzf --ansi --no-sort --reverse --tiebreak=index --preview \
    'f() { set -- $(echo -- "$@" | grep -o "[a-f0-9]\{7\}"); [ $# -eq 0 ] || git show --color=always $1 ; }; f {}' \
    --bind "alt-j:preview-down,alt-k:preview-up,ctrl-f:preview-page-down,ctrl-b:preview-page-up,q:abort,ctrl-m:execute:
            (grep -o '[a-f0-9]\{7\}' | head -1 |
            xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
            {}
FZF-EOF" --preview-window=right:60%
}
