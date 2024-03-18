local builtin = require('telescope.builtin')
local telescope = require('telescope')

-- Include hidden files in search
telescope.setup {pickers = {find_files = {hidden = true}}}

vim.keymap.set('n', '<leader><C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fh', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
--vim.keymap.set('n', 'fh', builtin.help_tags, {})
