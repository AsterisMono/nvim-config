return {
  'AckslD/nvim-neoclip.lua',
  config = function()
    require('neoclip').setup()
    require('telescope').load_extension('neoclip')
  end,
  keys = {
    { '\'y', '<cmd>Telescope neoclip initial_mode=normal<CR>', { desc = 'Registers' } }
  }
}
