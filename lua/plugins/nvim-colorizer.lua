return {
  'norcalli/nvim-colorizer.lua',
  cond = not vim.g.vscode,
  event = { 'BufReadPre', 'BufNew' },
  config = true
}
