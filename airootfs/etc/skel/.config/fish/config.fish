if status is-interactive
    # Commands to run in interactive sessions can go here
    export MANPAGER='nvim +Man!'
    set -g fish_key_bindings fish_vi_key_bindings

    alias ls="eza"
    alias ll='ls -alF'
    alias la='ls -A'
    #alias l='ls -CF'
    #alias l='ls -l'

    #pip
    alias pi="pip install -i https://mirrors.aliyun.com/pypi/simple"

    #show all user environment variable
    alias allenv="systemctl --user show-environment"

    #show cp speed
    alias vcp='rsync -ah --progress'

    # duf
    alias duf="LANG=C.UTF-8 /usr/bin/duf --hide-mp '/run/credentials/*'"

    # sysz
    alias sysz="LANG=C.UTF-8 sysz"

    #fzf
    alias fzf="LANG=en_US.UTF-8 fzf"

    # upload command output to fars.ee
    # cmd | curl -F "c=@-" "http://fars.ee/"
    alias upload_farsee='curl -F "c=@-" "http://fars.ee/"'

    # colorful command
    alias cmount="grc mount"
    alias ip="ip -color=auto"
    export LESS='-R --use-color -Dd+r$Du+b'
    alias dmesg="dmesg --color=always"
    alias ping="grc ping"
    alias netstat="grc netstat"
    alias ps="grc ps"
    alias tail="grc tail"
    alias head="grc head"
    alias lspci="grc lspci"
    alias ifconfig="grc ifconfig"
    alias env="grc env"
    alias lsmod="grc lsmod"
    alias traceroute="grc traceroute"
    alias lsblk="grc lsblk"
    alias blkid="grc blkid"
    alias checkupdates="checkupdates | column -t | ccze -A"
    alias bathelp='bat --plain --language=help'

    #let nvim can find cmake project headerfile
    #alias cmake="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON"

    #cp
    alias cp="cp --reflink=always -i"
    alias mv="mv -i"
    alias rm="rm -i"

    #trash
    alias tp="trash-put"
    alias tl="trash-list"
    alias te="trash-empty"

    #systemd-run
    alias srun="systemd-run --uid=1000 --gid=1000 --working-directory=."

    #git
    alias ghis="git log -p --"
end
