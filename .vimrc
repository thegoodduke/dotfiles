if version >= 603
    set helplang=cn
    set encoding=utf-8
endif

set nocompatible               " be iMproved
"==========================================
"General
"==========================================

" history存储长度
set history=100

"“filetype on“命令打开文件类型检测功能，它相当于文件类型检测功能的开关。
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
"”filetype plugin on“允许vim加载文件类型插件
filetype plugin on
"以上三项设置的简写
"filetype plugin indent on

"set autoindent
"set cindent

"==========================================
" autocmd
"==========================================
au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set autoindent |
\ set expandtab |
\ set fileformat=unix

au BufNewFile,BufRead *.html,*.css,*.js
\ set tabstop=2 |
\ set softtabstop=2 |
\ set autoindent |
\ set shiftwidth=2

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"==========================================
" show and format
"==========================================

set number                  " 行号
set wrap
set showmatch               " 匹配括号高亮

" 高亮搜索
set hlsearch
" 随着键入即时搜索
set incsearch
" 有一个或以上大写字母时仍大小写敏感
set smartcase

" 将Tab自动转化成空格
set expandtab
"1 tab == 4 spaces
"(自动) 缩进每一步使用的空白数目
set shiftwidth=4
" 文件里的 <Tab> 代表的空格数
set tabstop=4
" 按退格键时可以一次删掉 4 个空格
"set softtabstop

color desert

"==========================================
"" status
"==========================================
"显示当前的行号列号：
set ruler
"在状态栏显示正在输入的命令
set showcmd

" 光标上下两侧最少保留的屏幕行数。这使你工作时总有一些可见的上下文,缺省为0
"set so=7

"==========================================
""colors and fonts
"==========================================
""开启语法高亮
syntax enable
syntax on


"==========================================
"" file encode
"==========================================
" 设置新文件的编码为 UTF-8
set fileencoding=utf8
set fileencodings=utf-8,gb2312

"==========================================
"" vundle
"==========================================

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Plugin 'easymotion/vim-easymotion'
Plugin 'nvie/vim-flake8'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'scrooloose/syntastic'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'taglist.vim'
Plugin 'fholgado/minibufexpl.vim'
"Plugin 'winmanager'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" For flake8
autocmd BufWritePost *.py call Flake8()

" For indent-guides
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
"let g:indent_guides_enable_on_vim_startup = 1
"The default mapping to toggle the plugin is <Leader>ig.
"IndentGuidesToggle

" For minbufexplorer
let g:miniBufExplorerAutoStart = 0
map <Leader>mbt :MBEToggle<cr>

" For simplefold
let g:SimpylFold_docstring_preview=0

" For winManager
"let g:winManagerWindowLayout='NERDTree|Taglist'
let g:AutoOpenWinManager = 1

" For taglist
map <silent> <leader>tl :TlistToggle<cr> "To define a mapping which will not be echoed on the command line,即不回显
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口

" For simplefold
set laststatus=2   " Always show the statusline
let g:Powerline_symbols = 'unicode'

" For Nerdtree
" 关闭NERDTree快捷键
map <leader>t :NERDTreeToggle<CR>
" " 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" " 是否显示隐藏文件
let NERDTreeShowHidden=0
" " 设置宽度
let NERDTreeWinSize=31
" " 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=0
" " 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" " 显示书签列表
let NERDTreeShowBookmarks=1

" For Nerdtree-tabs
map <Leader>n <plug>NERDTreeTabsToggle<CR>
" nerdtree 和 nerdtree-tabs配合使用，最终只使用<leader>n来就可以完成99%的功能。

" For easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" the above <Plug> means 使能插件的含义(即easymotion-s的含义)
" the abobe nmap means normal map

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" modify leader(查看help leader，要使用mapleader)
"let mapleader = ','
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" linebackward/lineforward
map <leader>h <Plug>(easymotion-linebackward)
map <leader>l <Plug>(easymotion-lineforward)

"==========================================
" vim notes
"==========================================
"查看某个选项是否被应用了，如wrap选项，使用如下：
"set wrap? 或set nowrap?
"
"如何使用help：
"help x，表示x命令的help
"help 'number'，表示number选项的help，即选项要加单引号
"
"如何 help 查找：
"直接:help ,然后搜索filetype，使用Ctrl + ]当光标在链接位置的时候，可以直接跳到链接内容，链接一般是蓝色,使用Ctrl + t，返回上次页面
"filetype不是选项和set是并列的,直接:filetype 就可以看filetype设置了哪些。
"help NERD_tree.txt(插件帮助）
"ctags用法：在code目录执行 ctags -R. 然后，进入文件 ctrl + ] 就可以跳转了。
