local keymap = vim.keymap

-- Utility keymaps
keymap.set('n', '<leader>h', '<cmd>noh<CR>', { desc = 'Clear highlight' })
keymap.set('n', '<C-s>', '<cmd>write<CR>')
