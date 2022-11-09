local keymap = vim.keymap

keymap.set('n', 'dw', 'diw')
keymap.set('n', 'cw', 'ciw')

keymap.set('n', 'te', ':tabedit')
keymap.set('n', '<Space>', '<C-W>w')

keymap.set('n', '<leader>s', '<cmd>write<CR>')
