return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  version = false,
  keys = {
    { '\'f', '<cmd>Telescope find_files<CR>', { desc = 'Find files' } },
    { '\'r', '<cmd>Telescope live_grep<CR>', { desc = 'Live grep' } },
    { '\'b', '<cmd>Telescope buffers initial_mode=normal<CR>', { desc = 'Buffers' } },
    { '\'e', '<cmd>Telescope resume initial_mode=normal<CR>', { desc = 'Resume' } },
    { '<leader>mm', '<cmd>Telescope marks<cr>', { desc = 'Marks' } },

  },
  opts = {
    extensions = {
      coc = {
        theme = 'ivy',
        prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
      }
    },
  },
  config = function(_, opts)
    local telescope = require('telescope')
    telescope.setup(opts)
    telescope.load_extension('neoclip')
  end
}
