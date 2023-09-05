return {
  'rest-nvim/rest.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {},
  keys = {
    { "<leader>rr", "<Plug>RestNvim", desc = "Run request", silent = true },
    { "<leader>rl", "<Plug>RestNvimLast", desc = "Run last request", silent = true },
  }
}
