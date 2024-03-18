vim.keymap.set('n', "<SPACE>", "<Nop>")
vim.g.mapleader = " "
vim.keymap.set('n', '<c-n>', ':tabnew <CR>')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '<CR>', 'o<Esc>')

-- Resize window
vim.keymap.set("n", "<C-w><left>", "<C-w><")
vim.keymap.set("n", "<C-w><right>", "<C-w>>")
vim.keymap.set("n", "<C-w><up>", "<C-w>+")
vim.keymap.set("n", "<C-w><down>", "<C-w>-")

-- Undotree plugin
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
