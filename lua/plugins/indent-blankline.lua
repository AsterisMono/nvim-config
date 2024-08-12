return {
  'lukas-reineke/indent-blankline.nvim',
  cond = not vim.g.vscode,
  main = "ibl",
  event = { 'BufReadPre', 'BufNew' },
  opts = {}
}
