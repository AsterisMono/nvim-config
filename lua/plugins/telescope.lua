return {
  'nvim-telescope/telescope.nvim',
  event = "VeryLazy",
  cmd = 'Telescope',
  version = false,
  keys = {
    { '\'f', '<cmd>Telescope find_files<CR>'                  , desc = 'Find files' },
    { '\'r', '<cmd>Telescope live_grep<CR>'                   , desc = 'Live grep' },
    { '\'b', '<cmd>Telescope buffers'                         , desc = 'Buffers' },
    { '\'e', '<cmd>Telescope resume initial_mode=normal<CR>'  , desc = 'Resume' },
  },
  opts = {

  },
  config = function(_, opts)
    local telescope = require('telescope')
    telescope.setup(opts)
  end
}
