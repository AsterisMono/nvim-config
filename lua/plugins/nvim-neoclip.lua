return {
  'AckslD/nvim-neoclip.lua',
  config = function()
    require('neoclip').setup()
  end,
  event = 'TextYankPost',
  keys = {
    { '\'y', '<cmd>Telescope neoclip initial_mode=normal<CR>', { desc = 'Registers' } }
  }
}
