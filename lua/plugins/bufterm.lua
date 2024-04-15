return {
  'boltlessengineer/bufterm.nvim',
  config = function()
    require('bufterm').setup()
    vim.keymap.set('t', '<C-[>', '<C-\\><C-n>')
  end,
  keys = {
    { '<leader>t', '<cmd>BufTermEnter<CR>', desc = 'Open buffer terminal' },
  }
}
