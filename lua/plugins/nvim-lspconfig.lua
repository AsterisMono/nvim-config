return {
  'neovim/nvim-lspconfig',
  cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'williamboman/mason-lspconfig.nvim' },
  },
  config = function()
    local lsp_zero = require('lsp-zero')
    lsp_zero.extend_lspconfig()

    lsp_zero.on_attach(function(client, bufnr)
      lsp_zero.default_keymaps({
        buffer = bufnr,
        exclude = { 'gr' },
        preserve_mappings = false
      })
    end)

    -- lsp_zero.format_on_save({
    --   format_opts = {
    --     async = false,
    --     timeout_ms = 10000,
    --   },
    --   servers = {
    --     ['null-ls'] = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'html', 'css', 'json' },
    --     ['lua_ls'] = { 'lua' },
    --     ['rust_analyzer'] = { 'rust' },
    --   }
    -- })

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {
        'tsserver',
        'eslint',
        'lua_ls',
        'emmet_ls',
        'jsonls',
        'cssls',
        'html',
        'rust_analyzer',
      },
      handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
          local lua_opts = lsp_zero.nvim_lua_ls()
          require('lspconfig').lua_ls.setup(lua_opts)
        end,
        rust_analyzer = function()
          -- Do not config for rust_analyzer
          -- Use rustacean.nvim instead
        end
      }
    })

    -- Disable LSP semanticTokensProvider after nvim 9.0
    -- Treesitter at home:
    lsp_zero.set_server_config({
      on_init = function(client)
        client.server_capabilities.semanticTokensProvider = nil
      end,
    })
  end
}
