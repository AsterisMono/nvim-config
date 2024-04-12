return {
  'nvim-telescope/telescope.nvim',
  event = "VeryLazy",
  cmd = 'Telescope',
  version = false,
  keys = {
    { '<leader>f', '<cmd>Telescope find_files<CR>',                 desc = 'Find files' },
    { '<leader>r', '<cmd>Telescope live_grep<CR>',                  desc = 'Live grep' },
    { '<leader>R', '<cmd>Telescope current_buffer_fuzzy_find<CR>',  desc = 'Grep in current file' },
    { '<leader>B', '<cmd>Telescope buffers<CR>',                    desc = 'Buffers' },
    { '<leader>e', '<cmd>Telescope resume initial_mode=normal<CR>', desc = 'Telescope resume' },
  },
  config = function()
    local telescope = require('telescope')
    telescope.setup({
      defaults = {
        mappings = {
          n = {
            ['q'] = require('telescope.actions').close,
          },
          i = {
            ['<C-q>'] = require('telescope.actions').close,
          },
        }
      }

    })
  end
}
