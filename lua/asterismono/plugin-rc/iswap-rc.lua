require('iswap').setup({})

-- Also see <leader>ss -> mksession
require 'key-menu'.set('n', '<leader>s', {desc='Swap and Session'})
vim.keymap.set('n', '<leader>sw', '<cmd>:ISwap<CR>', {desc='Swap tokens'})
vim.keymap.set('n', '<leader>st', '<cmd>:ISwapWith<CR>', {desc='Swap this with'})
