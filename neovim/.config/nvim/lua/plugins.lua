local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
-- Themes
    Plug 'navarasu/onedark.nvim'
    Plug 'LunarVim/darkplus.nvim'
    Plug ('catppuccin/nvim', { as = 'catppuccin' })
-- Appearance
    Plug 'xiyaowong/transparent.nvim'
    Plug 'lukas-reineke/indent-blankline.nvim' -- This plugin adds indentation guides to all lines (including empty lines)
    Plug 'nvim-lualine/lualine.nvim' -- A blazing fast and easy to configure Neovim statusline written in Lua
    Plug 'nvim-tree/nvim-web-devicons' -- Web devicons for nvim-tree plugin
    Plug 'folke/twilight.nvim' -- Twilight plugin dims inactive prtions of the code you're editing
-- Utilities
--
    Plug ('tpope/vim-fugitive')
    Plug ('nvim-telescope/telescope.nvim', { branch = '0.1.x' })
    Plug 'nvim-lua/plenary.nvim' -- Required dependence for Telescope
    Plug 'christoomey/vim-tmux-navigator' -- Navigate seamlessly between tmux and nvim splits with Ctlr-h/j/k/l
    Plug 'nvim-tree/nvim-tree.lua' -- A file explorer for nvim
    Plug ('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'}) -- Tree-sitter is a parser generator tool and an incremental parsing library
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug ('iamcco/markdown-preview.nvim', { ['do'] = vim.fn['mkdp#util#install()'], ['for'] = {'markdown', 'vim-plug'}})
    Plug ('tpope/vim-commentary') -- Comment stuff out. Use "gcc" to comment out a line (takes a count), "gc" to comment out the target of a motion
    Plug 'ap/vim-css-color' -- Preview colours in source code while editing
-- Completion / linters / formatters
    Plug ('windwp/nvim-autopairs')
    Plug ('neoclide/coc.nvim', {branch = 'release'}) -- A fast code completion engine
    Plug ('dimasaryo/coc-robotframework', {['do'] = 'yarn install --frozen-lockfile && yarn build'})
    Plug ('fannheyward/coc-pyright') -- Coc extension for python
    Plug ('josa42/coc-lua') -- Coc extension for lua
-- Git
vim.call('plug#end')
