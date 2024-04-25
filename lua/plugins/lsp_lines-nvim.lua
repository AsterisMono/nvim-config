local enabled = false
local toggle = function()
  enabled = not enabled
  vim.diagnostic.config({
    virtual_text = not enabled,
    virtual_lines = enabled,
  })
end
return {
  url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  event = 'LspAttach',
  config = function()
    require("lsp_lines").setup()
    vim.diagnostic.config({
      virtual_text = true,
      virtual_lines = false,
    })
    vim.keymap.set("", "<Leader>ll", toggle, { desc = "Toggle lsp_lines" })
  end
}
