vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true
vim.opt.shell = "/bin/bash" 
vim.o.syntax = "on"
vim.o.filetype = "plugin"
vim.o.filetype = "ident"
vim.o.filetype = "on"
vim.opt.wrap = true
vim.opt.cursorline = true
vim.opt.smartindent = true -- enable smart auto indentation
vim.opt.shiftwidth = 4 -- width for autoindents
vim.opt.hlsearch = true -- highlight search results
vim.opt.incsearch = true-- incremental search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 4 -- number of columns occupied by a tab
vim.opt.softtabstop = 4 -- see multiple spaces as tabstop
vim.opt.expandtab = true-- converts tabs to white space
vim.opt.foldenable = true
vim.opt.encoding = "utf-8"
vim.cmd([[ set colorcolumn=80 ]]) --set an 80 column border for good coding style
vim.opt.cursorline = true --highlight cursor line
vim.opt.spell = true
vim.opt.spelllang = "en_us"
vim.opt.swapfile = false --disable creating swap file

-- Highlight all white spaces
vim.cmd([[ set list listchars=tab:\ \ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨ ]])

-- ROBOT FRAMEWORK
vim.cmd('autocmd BufNewFile,BufRead *.robot setlocal filetype=robot')
vim.cmd('nmap <silent> <C-l> <Plug>(coc-coc-robotframework-keymap)')

-- ============================================================================
-- SET THE COLOR SCHEME
-- ============================================================================

-- Catppuccin color schemes are listed gradually from lighter to darker
-- vim.cmd[[colorscheme catppuccin-latte]]
-- vim.cmd[[colorscheme catppuccin-frappe]]
vim.cmd[[colorscheme catppuccin-macchiato]]
-- vim.cmd[[colorscheme catppuccin-mocha]]

-- One Dark
-- vim.cmd[[colorscheme onedark]]

-- VSCode's dark theme
-- vim.cmd[[colorscheme darkplus]]
