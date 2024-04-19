return {
  'nvimtools/none-ls.nvim',
  event = 'VeryLazy',
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- require("none-ls.diagnostics.eslint_d"), -- Use eslint-lsp defined in mason
        -- require("none-ls.code_actions.eslint_d"),
        null_ls.builtins.formatting.prettierd
      }
    })
  end
}
