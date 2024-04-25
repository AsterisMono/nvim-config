return {
  'folke/noice.nvim',
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  event = 'UIEnter',
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
    },
    lsp = {
      signature = {
        enabled = false
      },
      hover = {
        enabled = false
      }
    }
  }
}
