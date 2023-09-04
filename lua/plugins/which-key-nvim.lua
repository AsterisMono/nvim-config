return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {},
  config = function()
    local wk = require("which-key")
    wk.register({ l = { name = "LSP Actions" } }, { prefix = "<leader>" })
    wk.register({ g = { name = "Git" } }, { prefix = "<leader>" })
    wk.register({ c = { name = "Convert Colors" } }, { prefix = "<leader>" })
    wk.register({ x = { name = "Trouble" } }, { prefix = "<leader>" })
  end
}
