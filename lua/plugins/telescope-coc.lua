return {
  'fannheyward/telescope-coc.nvim',
  keys = {
    { '<leader>e', '<cmd>Telescope coc diagnostics initial_mode=normal<CR>', { desc = 'Diagnostics' } },
    { '<leader>sy', '<cmd>Telescope coc document_symbols<CR>', { desc = 'Document Symbols' } },
    { '<leader>ca', '<cmd>Telescope coc code_actions initial_mode=normal<CR>', { desc = 'Code Actions' } },

    { '<leader>fr', '<cmd>Telescope coc references initial_mode=normal<CR>', { desc = 'Find References' } },
    { '<leader>fd', '<cmd>Telescope coc definitions initial_mode=normal<CR>', { desc = 'Find Definitions' } },
  },
  config = function()
    vim.cmd('CocStart')
    require('telescope').load_extension('coc')
  end
}
