local builtin = require('telescope.builtin')

require 'key-menu'.set('n', '\'', {desc='Telescope'})
vim.keymap.set('n', '\'f', builtin.find_files, {desc='Find files'})
vim.keymap.set('n', '\'r', builtin.live_grep, {desc='Live grep'})
vim.keymap.set('n', '\'b', builtin.buffers, {desc='Buffers'})
vim.keymap.set('n', '\'e', builtin.diagnostics, {desc='Diagnostics'})
