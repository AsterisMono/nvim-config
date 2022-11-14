local keymap = vim.keymap

-- Change word under cursor
keymap.set('n', 'dw', 'diw')
keymap.set('n', 'cw', 'ciw')

-- Multi tab and window editing
keymap.set('n', 'te', ':tabedit')
keymap.set('n', '<Space>', '<C-w>w')

-- Save session
keymap.set('n', '<leader>ss', '<cmd>mksession! session.vim<CR>', {desc='Save Session'})

-- Utility
keymap.set('n', '<leader>h', '<cmd>noh<CR>', {desc='Clear highlight'})

-- Plugins
require 'key-menu'.set('n', '<leader>c', {desc='Color code'})
keymap.set('n', '<leader>cr', '<cmd>ConvertColorTo rgba<CR>', {desc='Convert to rgba'})
keymap.set('n', '<leader>ch', '<cmd>ConvertColorTo hex<CR>', {desc='Convert to hex'})

require 'key-menu'.set('n', '<leader>l', {desc='Liveserver'})
keymap.set('n', '<leader>ls', '<cmd>LiveServer start<CR>', {desc='Start liveserver'})
