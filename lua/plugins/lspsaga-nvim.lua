return {
  'nvimdev/lspsaga.nvim',
  event = 'LspAttach',
  keys = {
    { '<leader>ld', '<cmd>Lspsaga peek_definition<CR>', desc = 'Peek Definition' },
    { ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>' },
    { '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>' },
    { 'K', '<cmd>Lspsaga hover_doc<CR>' },
    -- { 'K', '<cmd>Lspsaga hover_doc ++keep<CR>' }, -- Pin hover window
    { '<leader>lo', '<cmd>Lspsaga outline<CR>', desc = 'Outline' },
    { '<leader>lr', '<cmd>Lspsaga rename<CR>', desc = 'Rename' },
  },
  config = function()
    require('lspsaga').setup({})
  end,
}
