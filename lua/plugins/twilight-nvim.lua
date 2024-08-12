return {
  "folke/twilight.nvim",
  cond = not vim.g.vscode,
  lazy = true,
  cmd = "Twilight",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    dimming = {
      color = { "#6D718C" },
      alpha = 1,
    }
  }
}
