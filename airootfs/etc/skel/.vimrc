set tabstop=4
set number
" 开启鼠标支持
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set autoindent
set relativenumber
set cursorline
"set go=
syntax on
set hlsearch
" 解决中文乱码问题
let &termencoding=&encoding
set fileencodings=utf-8,gbk
" 不与 Vi 兼容（采用 Vim 自己的操作命令）。
set nocompatible
" 在底部显示，当前处于命令模式还是插入模式。
set showmode
" 命令模式下，在底部显示，当前键入的指令。
set showcmd
" 启用256色。
set t_Co=256
" 开启文件类型检查，并且载入与该类型对应的缩进规则
filetype indent on

set shiftwidth=4
set expandtab

set softtabstop=4
" 自动折行，即太长的行分成几行显示。
set wrap
" 只有遇到指定的符号（比如空格、连词号和其他标点符号），才发生折行。也就是说，不会在单词内部折行。
set linebreak
" 指定折行处与编辑窗口的右边缘之间空出的字符数。
set wrapmargin=2
" 垂直滚动时，光标距离顶部/底部的位置（单位：行）。
set scrolloff=5
" 是否显示状态栏。0 表示不显示，1 表示只在多窗口时显示，2 表示显示。
set laststatus=2
" 光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号。
set showmatch
" 输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果。
set incsearch
" 搜索时忽略大小写。
set ignorecase
" 如果同时打开了ignorecase，那么对于只有一个大写字母的搜索词，将大小写敏感；其他情况都是大小写不敏感。比如，搜索Test时，将不匹配test；搜索test时，将匹配Test。
" set smartcase

" 保留撤销历史。Vim 会在编辑时保存操作历史，用来供用户撤消更改。默认情况下，操作记录只在本次编辑时有效，一旦编辑结束、文件关闭，操作历史就消失了。打开这个设置，可以在文件关闭后，操作记录保留在一个文件里面，继续存在。这意味着，重新打开一个文件，可以撤销上一次编辑时的操作。撤消文件是跟原文件保存在一起的隐藏文件，文件名以.un~开头。
set undofile
" 设置备份文件、交换文件、操作历史文件的保存位置。结尾的//表示生成的文件名带有绝对路径，路径中用%替换目录分隔符，这样可以防止文件重名。
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//
" 自动切换工作目录。这主要用在一个 Vim 会话之中打开多个文件的情况，默认的工作目录是打开的第一个文件的目录。该配置可以将工作目录自动切换到，正在编辑的文件的目录。需要创建好目录，不然会报错
set autochdir
" Vim 需要记住多少次历史操作。
set history=1000
" 打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），就会发出提示。
set autoread

" 如果行尾有多余的空格（包括 Tab 键），该配置将让这些空格显示成可见的小方块。
" set listchars=tab:»■,trail:■
" set list
" 命令模式下，底部操作指令按下 Tab 键自动补全。第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令。
set wildmenu
set wildmode=longest:list,full


" normal模式block光标，insert/visual模式beam光标
" https://stackoverflow.com/questions/6488683/how-to-change-the-cursor-between-normal-and-insert-modes-in-vim/42118416#42118416
"Ps = 0  -> blinking block.
"Ps = 1  -> blinking block (default).
"Ps = 2  -> steady block.
"Ps = 3  -> blinking underline.
"Ps = 4  -> steady underline.
"Ps = 5  -> blinking bar (xterm).
"Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END
" solve delay problem
set ttimeout
set ttimeoutlen=1
set ttyfast

call plug#begin()
Plug 'jasonccox/vim-wayland-clipboard'
call plug#end()

