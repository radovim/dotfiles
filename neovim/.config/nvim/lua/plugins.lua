local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.config/nvim/plugged")
-- Themes
    Plug ("navarasu/onedark.nvim")
    Plug ("LunarVim/darkplus.nvim")
    Plug ("catppuccin/nvim", { as = "catppuccin" })
    Plug ("folke/tokyonight.nvim")
    Plug ("ellisonleao/gruvbox.nvim")
-- Appearance
    Plug ("xiyaowong/transparent.nvim")
    Plug ("lukas-reineke/indent-blankline.nvim")-- This plugin adds indentation guides to all lines (including empty lines)
    Plug ("nvim-lualine/lualine.nvim")-- A blazing fast and easy to configure Neovim statusline written in Lua
    Plug ("folke/twilight.nvim")-- Twilight plugin dims inactive portions of the code you're editing
    Plug ("RRethy/vim-illuminate")-- Automatically highlighting other uses of the word under the cursor
    Plug ("nvim-tree/nvim-web-devicons") -- Coloured icons(optional for bufferline)
    Plug ("akinsho/bufferline.nvim", { tag = "v4.9.1" })
-- Utilities
    Plug ("tpope/vim-fugitive")
    Plug ("lewis6991/gitsigns.nvim")
    Plug ("nvim-telescope/telescope.nvim", { branch = "0.1.x" })
    Plug ("nvim-lua/plenary.nvim") -- Required dependence for Telescope
    Plug ("christoomey/vim-tmux-navigator")-- Navigate seamlessly between tmux and nvim splits with Ctlr-h/j/k/l
    Plug ("nvim-treesitter/nvim-treesitter", {["do"] = ":TSUpdate"}) -- Tree-sitter is a parser generator tool and an incremental parsing library
    Plug ("nvim-treesitter/nvim-treesitter-textobjects")
    Plug ("nvim-treesitter/nvim-treesitter-context")
    Plug ("iamcco/markdown-preview.nvim", { ["do"] = vim.fn["mkdp#util#install()"], ["for"] = {"markdown", "vim-plug"}})
    Plug ("tpope/vim-commentary") -- Comment stuff out. Use "gcc" to comment out a line (takes a count), "gc" to comment out the target of a motion
    Plug ("folke/flash.nvim") -- Lets you navigate your code with search labels, enhanced character motions, and Treesitter integration.
    Plug ("mbbill/undotree") -- Undo tree
-- Completion / linters / formatters
    Plug ("windwp/nvim-autopairs")
    -- Uncomment the two plugins below if you want to manage the language servers from neovim
    Plug ("williamboman/mason-lspconfig.nvim")
    Plug ("williamboman/mason.nvim") -- Dependency for mason-lspconfig
    Plug ("neovim/nvim-lspconfig") -- Dependency for mason-lspconfig
    -- Autocompletion
    Plug ("hrsh7th/nvim-cmp")
    Plug ("hrsh7th/cmp-nvim-lsp")
    Plug ("neovim/nvim-lspconfig")
    Plug ("hrsh7th/cmp-nvim-lsp")
    Plug ("hrsh7th/cmp-buffer")
    Plug ("hrsh7th/cmp-path")
    Plug ("hrsh7th/cmp-cmdline")
    Plug ("hrsh7th/nvim-cmp")
    Plug ("L3MON4D3/LuaSnip")
    Plug ("saadparwaiz1/cmp_luasnip")

    -- Plug ("neoclide/coc.nvim", {branch = "release"}) -- A fast code completion engine
    -- Plug ("fannheyward/coc-pyright") -- Coc extension for python
    -- Plug ("josa42/coc-lua") -- Coc extension for lua
-- Git
vim.call("plug#end")
