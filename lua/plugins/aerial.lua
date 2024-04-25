return {
  'stevearc/aerial.nvim',
  lazy = true,
  opts = {
    highlight_on_hover = true,
    autojump = true,
  },
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  keys = {
    { '<leader>lo', '<cmd>AerialToggle<CR>', desc = 'Outline' },
    {
      '\'s',
      function()
        local telescope = require('telescope')
        telescope.load_extension("aerial")
        telescope.extensions.aerial.aerial()
      end,
      desc = 'Outline'
    },
  }
}
