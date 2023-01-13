local keymap = vim.keymap

-- Multi tab and window editing
keymap.set('n', 'te', ':tabedit')
keymap.set('n', '<Space>', '<C-w>w')

-- Utility
keymap.set('n', '<leader>h', '<cmd>noh<CR>', { desc = 'Clear highlight' })
keymap.set('n', '<C-s>', '<cmd>write<CR>')
