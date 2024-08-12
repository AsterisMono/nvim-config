return {
  'windwp/nvim-autopairs',
  cond = not vim.g.vscode,
  event = "LspAttach",
  opts = {} -- this is equalent to setup({}) function
}
