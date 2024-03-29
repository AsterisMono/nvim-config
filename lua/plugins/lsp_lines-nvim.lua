return {
  url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  event = 'LspAttach',
  config = function()
    require("lsp_lines").setup()
    -- Disable virtual_text since it's redundant due to lsp_lines.
    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = false,
    })
    vim.keymap.set("", "<Leader>ll", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
  end
}
