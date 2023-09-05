return {
  'nvimdev/lspsaga.nvim',
  event = 'LspAttach',
  keys = {
    { '<leader>ld', '<cmd>Lspsaga peek_definition<CR>', desc = 'Peek Definition' },
    { ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>' },
    { '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>' },
    { 'K', '<cmd>Lspsaga hover_doc<CR>' },
    { '<leader>lk', '<cmd>Lspsaga hover_doc ++keep<CR>', desc = 'Pin hover doc' }, -- Pin hover window
    { '<leader>lo', '<cmd>Lspsaga outline<CR>', desc = 'Outline' },
    { '<leader>lr', '<cmd>Lspsaga rename<CR>', desc = 'Rename' }, -- Ctrl-k to cancel
    { '<leader>la', '<cmd>Lspsaga code_action<CR>', desc = 'Code Action' }, -- Ctrl-k to cancel
  },
  config = function()
    require('lspsaga').setup({})
  end,
}
