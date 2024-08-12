return {
  'mrcjkb/rustaceanvim',
  cond = not vim.g.vscode,
  version = '^4', -- Recommended
  ft = { 'rust' },
}
