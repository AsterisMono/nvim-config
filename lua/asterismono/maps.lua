local keymap = vim.keymap

-- Change word under cursor
keymap.set('n', 'dw', 'diw')
keymap.set('n', 'cw', 'ciw')

-- Multi tab and window editing
keymap.set('n', 'te', ':tabedit')
keymap.set('n', '<Space>', '<C-w>w')

-- Save session
keymap.set('n', '<leader>ss', '<cmd>mksession session.vim<CR>')

-- Utility
keymap.set('n', '<leader>h', '<cmd>noh<CR>')

-- Plugins
keymap.set('n', '<leader>cr', '<cmd>ConvertColorTo rgba<CR>')
keymap.set('n', '<leader>ch', '<cmd>ConvertColorTo hex<CR>')
keymap.set('n', '<leader>ls', '<cmd>LiveServer start<CR>')
