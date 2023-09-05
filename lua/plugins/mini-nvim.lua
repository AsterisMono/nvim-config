return {
  'echasnovski/mini.nvim', 
  version = false,
  config = function(_, opts)
    require('mini.sessions').setup({
      autowrite = true,
      verbose = { read = false, write = true, delete = true }
    })
    require('mini.starter').setup()
  end
}
