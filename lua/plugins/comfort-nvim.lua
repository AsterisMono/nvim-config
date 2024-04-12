local prettier = { {
  "prettierd", "prettier"
} }
return {
  'stevearc/conform.nvim',
  event = { "BufWritePre" },
  opts = {
    formatters_by_ft = {
      javascript = prettier,
      typescript = prettier,
      javascriptreact = prettier,
      typescriptreact = prettier,
      html = prettier,
      css = prettier,
      json = prettier,
    },
    format_on_save = {
      timeout_ms = 500,
      quiet = false,
      lsp_fallback = true,
    }
  },
}
