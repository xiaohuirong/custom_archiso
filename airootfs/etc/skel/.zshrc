export PATH=$PATH:$HOME/.local/bin
export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search copypath copyfile copybuffer history jsontools zsh-vi-mode)

ZSH_DISABLE_COMPFIX=true
ZSH_THEME="gnzh"

[ "$SSH_TTY" = "" -a "$XDG_SESSION_TYPE" = "tty" ] && ZSH_THEME="lukerandall" && LANG=en_US.UTF-8
source $ZSH/oh-my-zsh.sh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[global-alias]=fg=magenta
ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[path]=underline
ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[command-substitution]=none
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta
ZSH_HIGHLIGHT_STYLES[process-substitution]=none
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=magenta
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=magenta
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta
ZSH_HIGHLIGHT_STYLES[assign]=none
ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
ZSH_HIGHLIGHT_STYLES[named-fd]=none
ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
ZSH_HIGHLIGHT_STYLES[arg0]=fg=green
ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout

### functions ###
wayfire-debug() {
    LANG=zh_CN.UTF-8 \
    XDG_CURRENT_DESKTOP=Wayfire \
    GVIM_ENABLE_WAYLAND=1 \
    MOZ_ENABLE_WAYLAND=1 \
    QT_AUTO_SCREEN_SCALE_FACTOR=1 \
    QT_QPA_PLATFORMTHEME=qt5ct \
    MOZ_USE_XINPUT2=1 \
    QT_QPA_PLATFORM="wayland;xcb" \
    SDL_VIDEODRIVER=wayland \
    WINIT_WAYLAND_CSD_THEME=Dark \
    GTK_THEME=Tokyonight-Storm-B \
    QT_WAYLAND_DISABLE_WINDOWDECORATION=1 \
    wayfire
}
########################

### colorful command ###
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
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"
alias bathelp='bat --plain --language=help'
alias duf="LANG=C.UTF-8 duf"
########################

### 定义自动补全函数 ###
_help_autocomplete() {
    if [[ $CURRENT -eq 2 ]]; then
        _command_names
    fi
}
help() {
    "$@" --help 2>&1 | bathelp
}
compdef _help_autocomplete help  # 使用compdef为help函数定义自动补全
########################    


### 复制当前输入命令 ###
cmd_to_clip () {
    printf %s "${BUFFER}" |  uniclip -c
}
zle -N cmd_to_clip
# 以下包装到zsh-vi-mode的初始函数后防止被overwrite
zvm_after_init() {
    bindkey '^N' cmd_to_clip
    # autosuggestions 箭头移动单词, 不使用zsh-vi-mode可以不加因为其会自动读取
    source ~/.oh-my-zsh/custom/my_patches.zsh
    source ~/.oh-my-zsh/custom/my_fzf.zsh
}
########################

export HISTSIZE=100000
export SAVEHIST=100000

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
