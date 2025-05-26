alias ls="eza"
alias ll='ls -alF'
alias la='ls -A'
#alias l='ls -CF'
#alias l='ls -l'

alias httptemp='python3 -m http.server 8000'
alias down="axel -n 8 -a"
alias chrome="google-chrome"

#pip 
alias pi="pip3 install -i https://mirrors.aliyun.com/pypi/simple"

alias port="netstat -tlunp"

#command's another name
alias pdf="evince"

alias backgroud="gsettings set org.gnome.desktop.background picture-uri"

#playerctl
alias pause="playerctl pause"
alias play="playerctl play"
alias next="playerctl next"
alias prev="playerctl previous"
alias meta="playerctl metadata"

#show all user environment variable
alias allenv="systemctl --user show-environment"

#show cp speed
alias vcp='rsync -ah --progress'

alias refresh="source ~/.zshrc"

alias myactivate="omz theme use juanghurtado;conda activate"
alias mydeactivate="omz theme use gnzh;conda deactivate"

alias x="xclip -selection c"
alias autoremove="pacman -Qdtq | sudo pacman -Rscn"

#qrcp
alias send="qrcp --keep-alive"
alias rece="qrcp receive"

#crash clean
alias crash-clean="ll -A /var/lib/systemd/coredump;sudo rm /var/lib/systemd/coredump/*"
alias crash-list="ll -A /var/lib/systemd/coredump"

# duf
alias duf="LANG=C.UTF-8 duf --hide-mp '/run/credentials/*'"

# sysz
alias sysz="LANG=C.UTF-8 sysz"

#fzf
alias fzf="LANG=en_US.UTF-8 fzf"

#default preview bind is shift+up and shift+down, use --bind can change this.
alias pfzf="LANG=en_US.UTF-8 fzf --preview 'bat  --wrap=character --style=numbers --color=always --line-range :500 {}' --preview-window 'right:70%,wrap'"
alias cf="rg . --color ansi --colors 'match:fg:0x64,0xB5,0xF6' --colors 'path:fg:0xF4,0x8F,0xB1'| fzf --ansi"

#aria2
alias adown="/usr/bin/aria2c --allow-overwrite=true -c --file-allocation=none --log-level=error -m2 --max-connection-per-server=2 --max-file-not-found=5 --min-split-size=5M --no-conf --remote-time=true --summary-interval=60 -t5 -d ."

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
alias bathelp='bat --plain --language=help'

#let nvim can find cmake project headerfile
alias cmake="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON"

#cp 
alias cp="cp -i"
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

# ssh rm host
alias sshrm="ssh-keygen -f '/home/xiao/.ssh/known_hosts' -R"
