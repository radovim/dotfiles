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
syntax on

"Highlight cursor line underneath the cursor vertically
"set cursorline

"Set shift width to 4 spaces
set shiftwidth=4

"Set tab width to 4 columns
set tabstop=4

"Use spaces characters instead if tabs
set expandtab

"Does NOT automatically insert the current comment leader after hitting
"<Enter> in Insert mode and anfter hitting 'o' or 'O' in Normal mode
set formatoptions-=cro

"Enable folding
set foldenable
set foldnestmax=1

"While searching through a file incrementally highlight matching charachters as you type
set incsearch

"Ignore capital letters during search
set ignorecase

"Override the ignorecase option if searching for capital letters.
"This will allow you to search specifically for capital letters.
set smartcase

"Show partial command you type in the last line of the screen
set showcmd

"Show the mode you are on the last line
set showmode

"Show matching words during a search
set showmatch

"Use highlighting when doing a search
set hlsearch

"Set the commands to save in history default number is 20.
set history=1000

"Enable auto completion menu after pressing TAB
set wildmenu

"Make wildmenu behave like similar to Bash completion
set wildmode=list:longest

"There are certain files that we would never want to edit with Vim.
"Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Center the cursor vertically when mowing to the next word during a search
nnoremap n nzz
nnoremap N Nzz
nnoremap ]] ]]zz
nnoremap [[ [[zz
nnoremap [] []zz
nnoremap ][ ][zz
nnoremap <c-d> <c-d>zz

"Manage split screen
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-left> <c-w>>
nnoremap <c-right> <c-w><

"Manage tabs
nnoremap <C-n> :tabnew<CR>

"Set cursor type(shape)
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END
