return {
  "FabijanZulj/blame.nvim",
  cond = not vim.g.vscode,
  opts = {},
  keys = {
    { '<leader>gb', '<cmd>BlameToggle virtual<CR>', desc = 'Git Blame' },
  }
}
