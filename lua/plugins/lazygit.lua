return {
  'kdheepak/lazygit.nvim',
  cond = not vim.g.vscode,
  keys = {
    { '<leader>gg', '<cmd>LazyGit<CR>', desc = 'Lazygit' },
  }
}
