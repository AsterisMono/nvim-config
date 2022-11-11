local keymap = vim.keymap

keymap.set('n', 'dw', 'diw')
keymap.set('n', 'cw', 'ciw')

keymap.set('n', 'te', ':tabedit')
keymap.set('n', '<Space>', '<C-w>w')

keymap.set('n', '<leader>s', '<cmd>write<CR>')

keymap.set('n', '<leader>h', '<cmd>noh<CR>')

keymap.set('n', '<leader>c', '<cmd>ConvertColorTo rgba<CR>')
