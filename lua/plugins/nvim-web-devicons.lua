return {
  'nvim-tree/nvim-web-devicons',
  cond = not vim.g.vscode,
  lazy = true,
  opts = {
    color_icons = true,
    default = true,
  }
}
