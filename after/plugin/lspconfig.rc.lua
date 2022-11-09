local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = { 'sumneko_lua', 'cssls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end

-- emmet_ls HTML only
lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { 'html', 'typescriptreact', 'javascriptreact' }
})

