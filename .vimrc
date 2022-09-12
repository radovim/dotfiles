"set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required



"My plugins:
"---------------------------------
Plugin 'herrbischoff/cobalt2.vim'
Plugin 'VundleVim/Vundle.vim'
"Plugin 'ycm-core/YouCompleteMe'
Plugin 'francoiscabrol/ranger.vim'
"Plugin 'ervandew/supertab'
"---------------------------------
"
"
"
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"  Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"  Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"  Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"  Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"My settings:
"------------------------------------------------------------
set mouse=a

"set <up>=OA
"set <down>=OB
"set <right>=OC
"set <left>=OD

set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab
set cursorline 
syntax on 
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2
set foldmethod=syntax
set number

set laststatus=2
let g:jedi#use_tabs_not_buffers = 1
let &t_EI .= "\<Esc>[2 q" "curso shape wiil be 'solid block' in ____ mode
let &t_SI.="\e[5 q" "cursosr shape will be 'blinking vertical bar' in INSERT mode
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
"hi MatchParen ctermbg=yellow guibg=yellow term=none cterm=none gui=italic
"------------------------------------------------------------
