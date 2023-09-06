return {
  'echasnovski/mini.nvim', 
  lazy = false,
  version = false,
  config = function(_, opts)
    require('mini.sessions').setup({
      autowrite = true,
      verbose = { read = false, write = true, delete = true }
    })
    require('mini.starter').setup()
  end,
  keys = {
    { "<leader>sw", function() require('mini.sessions').write(vim.fn.input("Session name: ", "")) end, desc = "Write session" },
    { "<leader>ss", function() require('mini.sessions').select() end, desc = "Select session" },
    { "<leader>sd", function() require('mini.starter').open() end, desc = "Dashboard" }
  }
}
