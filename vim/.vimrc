"Set gui font
set guifont="Iosevka Nerd Font Mono"

"Allows for project-local configuration files
set exrc

"Disable creating swap file
set noswapfile 

"Disable compatibility with vi
set nocompatible 

"Enable line numbers
set number
set relativenumber

"Switch between buffers without saving changes immediately
set hidden

"Enable file type detection
filetype on

""Enagle plugins and load plugin for the  detected file type
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

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

set matchpairs+=<:>,=:;

"Tell Vim where to search for 'tags' file
set tags=./tags;,tags;

function! SearchCountInfo() abort
    if !v:hlsearch
        return ''
    endif
    try
        " maxcount: 0 means no limit on the number of matches counted
        " timeout: maximum time in milliseconds to spend counting
        let l:count_info = searchcount({'maxcount': 0, 'timeout': 50})
    catch /^Vim\%((\a\+)\)\=:\%(E486\)\@!/
        " Handle pattern not found or other errors gracefully
        return '[?/??]'
    endtry

    if l:count_info.total > 0
        if l:count_info.incomplete
            " If counting timed out or reached maxcount before completion
            return printf('[%d/??]', l:count_info.current)
        else
            return printf('[%d/%d]', l:count_info.current, l:count_info.total)
        endif
    else
        return '[0/0]'
    endif
endfunction

set statusline=%<%F\ %h%w%m%r%=%{SearchCountInfo()}\ %-14.(%l,%c%V%)\ %p%%
set laststatus=2

"Use ripgrep for grepping
if executable('rg')
	set grepprg=rg\ --vimgrep\ --hidden
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
nnoremap n nzz
nnoremap N Nzz


"Move line under cursor up or down
nnoremap <A-k> :m .-2<CR>==
nnoremap <A-j> :m .+1<CR>==

"Auto-pair curly braces
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"Move to the next and previous bugger
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

"=======================
"  Plugins
"=======================
"
" Enable build in Man plugin
runtime! ftplugin/man.vim

call plug#begin()
    Plug 'morhetz/gruvbox'
    Plug 'radovim/gruber-darker-vim'
    Plug 'joshdick/onedark.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'tpope/vim-commentary'
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()


"=============================================================================
"  Autocplition plugin
"=============================================================================
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
"=============================================================================

"====================
"  Themes
"===================
let g:gruvbox_contrast_dark='medium'
set bg=dark
colorscheme GruberDarker
