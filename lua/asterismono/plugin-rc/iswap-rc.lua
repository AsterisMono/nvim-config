require('iswap').setup({})

-- Also see <leader>ss -> mksession
vim.keymap.set('n', '<leader>sw', '<cmd>:ISwap<CR>', { desc = 'Swap tokens' })
vim.keymap.set('n', '<leader>st', '<cmd>:ISwapWith<CR>', { desc = 'Swap this with' })
