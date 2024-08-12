return {
  'yamatsum/nvim-cursorline',
  cond = not vim.g.vscode,
  event = { 'BufReadPre', 'BufNew' },
  opts = {
    cursorline = {
      enable = false,
      timeout = 1000,
      number = false,
    },
    cursorword = {
      enable = true,
      min_length = 3,
      hl = { underline = true },
    }
  }
}
