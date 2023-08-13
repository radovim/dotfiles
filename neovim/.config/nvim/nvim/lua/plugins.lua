local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
--Appearance
    Plug 'navarasu/onedark.nvim'
    Plug 'dracula/vim'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug ('nvim-telescope/telescope.nvim', { tag = '0.1.0' })
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-tree/nvim-web-devicons'
--Utilities
    Plug 'nvim-tree/nvim-tree.lua'
    Plug ('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
    Plug 'iamcco/markdown-preview.nvim' 
    Plug ('iamcco/markdown-preview.nvim', { ['do'] = vim.fn['mkdp#util#install()'], ['for'] = {'markdown', 'vim-plug'}})
    Plug ('tpope/vim-commentary')
    Plug 'ap/vim-css-color'
    Plug 'sharkdp/fd'
    Plug 'BurntSushi/ripgrep'
--Completion / linters / formatters
    Plug ('neoclide/coc.nvim', {branch = 'release'}) --a fast code completion engine
    Plug ('dimasaryo/coc-robotframework', {['do'] = 'yarn install --frozen-lockfile && yarn build'})
--Git
    Plug ('lewis6991/gitsigns.nvim')
vim.call('plug#end')

