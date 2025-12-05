"Allows for project-local configuration files
set exrc

"Disable creating swap file
set noswapfile 

"Disable compatibility with vi
set nocompatible 

"Enable line numbers
set number
set relativenumber

"Enable file type detection
filetype on

"Enagle plugins and load plugin for the  detected file type
filetype plugin on

"Load an indent file for the detected file type
filetype indent on

"Enable smart indents
set smartindent

"Enable c indents
set cindent

"Turn syntax highlighting on
syntax enable

"Highlight cursor line underneath the cursor vertically
set cursorline

"Set shift width to 4 spaces
set shiftwidth=4

"Set tab width to 4 columns
set tabstop=4

"Use spaces characters instead if tabs
set expandtab

"While searching through a file incrementally highlight matching charachters as you type
set incsearch

"Ignore capital letters during search
set ignorecase

"Override the ignorecase option if searching for capital letters.
"This will allow you to searc hspecifically for capital letters.
set smartcase

"Show partial command you type in the last line of the screen
set showcmd

"Show the mode you are on the last line
set showmode

"Show matching words during a search
"set showmatch

"Use highlighting when doing a search
set hlsearch

"Set the commands to save in history default number is 20.
set history=1000

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

"Enable auto completion menu after pressing TAB
set wildmenu

"Make wildmenu behave like similar to Bash completion
set wildmode=list:longest

"There are certain files that we would never want to edit with Vim.
"Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


set tags=./tags;,tags;

"set statusline+=%f\ %m%r%h\ %=%l,%c\ \ \ \ \ \ \ %p%%
set statusline=%<%F\ %h%w%m%r%=%-14.(%l,%c%V%)\ %p%%
set laststatus=2
set shortmess-=S

"Use ripgrep for grepping
if executable('rg')
	set grepprg=rg\ --vimgrep\ --hidden\ --glob\ '!.git'
endif

"=======================
"  Keybindings
"=======================
nnoremap ]] ]]zz
nnoremap [[ [[zz
nnoremap [] []zz
nnoremap ][ ][zz
nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz

"Move line under cursor up or down
nnoremap <A-k> :m .-2<CR>==
nnoremap <A-j> :m .+1<CR>==
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
"=======================
"  Plugins
"=======================
"
call plug#begin()
    Plug 'morhetz/gruvbox'
    Plug 'drsooch/gruber-darker-vim'
    Plug 'ap/vim-buftabline'
    Plug 'joshdick/onedark.vim'
call plug#end()

let g:gruvbox_contrast_dark='hard'
set bg=dark
colorscheme GruberDarker
