"********************************************************
""                   一般性配置                          *
"********************************************************

"关闭vim一致性原则
set nocompatible
"显示行号
set number
"设置历史记录条数
set history=1000
"设置取消备份 禁止临时文件的生成
set nobackup
set noswapfile
"设置匹配模式
set showmatch
"设置c/c++对齐方式
set autoindent
set cindent
"开启语法高亮功能
syntax enable
syntax on 
"制定配色方案为256色
set t_Co=256
"设置搜索时忽略大小写
set ignorecase
"配置backspace的工作方式
set backspace=indent,eol,start
"设置在vim中可以使用鼠标a, 使用鼠标复制内容到剪切板v
set mouse=v
"设置tab宽度
set tabstop=4
"设置自动对齐空格数
set shiftwidth=4
"设置退格键时可以删除4个空格
set smarttab
set softtabstop=4
"将tab键自动转换为空格
set expandtab
"设置编码方式
set encoding=utf-8
"自动判断编码时 依次尝试以下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"检测文件类型
filetype off
"针对不同的文件采取不同的缩进方式
filetype indent on
"允许插件
filetype plugin on
"启动智能补全
filetype plugin indent on
"Vim记住上次光标位置
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif
"Vim自动补全括号
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
"inoremap < <><ESC>i
"行和列所处位置高亮
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
"禁用缩进用于粘贴
set pastetoggle=<F9>
"*********************************************************
""                  Molokai 配置                        *
"*********************************************************
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

"*********************************************************
""                  vundle 配置                           *
"*********************************************************

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"My Bundles here:
Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-fugitive'
call vundle#end()

"*****************************************************
""                   NERDTree配置                     *
"*****************************************************
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
map <F2> :NERDTreeToggle<CR>

"*****************************************************
""                   airline配置                      *
"*****************************************************
set laststatus=2
set lazyredraw
let g:airline_theme="molokai" 
" 这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1   
" 打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" 设置切换Buffer快捷键"
nnoremap <F11> :bn<CR>
nnoremap <F12> :bp<CR>
" 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
" 设置consolas字体"前面已经设置过
set guifont=Consolas\ for\ Powerline\ FixedD:h11
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

"*****************************************************
""                  tagbar配置                       *
"*****************************************************
let g:tagbar_ctags_bin='ctags'
let g:tagbar_width=30
map <F3> :Tagbar<CR>

"*****************************************************
""           YouCompleteMe配置                        *
"*****************************************************
" YCM settings
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" UltiSnips setting
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"


"*****************************************************
""           Conque-GDB配置                        *
"*****************************************************
let g:ConqueTerm_CloseOnEnd = 1                                                       
let g:ConqueTerm_StartMessages = 0                                                    
                                                                                      
function DebugSession()                                                               
    silent make -o vimgdb -gcflags "-N -l"                                            
    redraw!                                                                           
    if (filereadable("vimgdb"))                                                       
        ConqueGdb vimgdb                                                              
    else                                                                              
        echom "Couldn't find debug file"                                              
    endif                                                                             
endfunction                                                                           
function DebugSessionCleanup(term)                                                    
    if (filereadable("vimgdb"))                                                       
        let ds=delete("vimgdb")                                                       
    endif                                                                             
endfunction                                                                           
call conque_term#register_function("after_close", "DebugSessionCleanup")              
nmap <leader>d :call DebugSession()<CR>;  
