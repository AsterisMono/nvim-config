return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline",
    },
    views = {
      mini = {
        winhighlight = {},
        win_options = {
          winblend = 0
        }
      }
    }
  }
}
