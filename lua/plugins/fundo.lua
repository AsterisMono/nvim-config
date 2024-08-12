return {
  {
    'kevinhwang91/nvim-fundo',
    cond = not vim.g.vscode,
    build = function()
      require('fundo').install()
    end,
    config = true,
    event = 'VeryLazy'
  },
  {
    'kevinhwang91/promise-async',
    lazy = true
  }
}
