local builtin = require('telescope.builtin')

vim.keymap.set('n', '\'f', builtin.find_files, {})
vim.keymap.set('n', '\'r', builtin.live_grep, {})
vim.keymap.set('n', '\'b', builtin.buffers, {})
vim.keymap.set('n', '\'e', builtin.diagnostics, {})

