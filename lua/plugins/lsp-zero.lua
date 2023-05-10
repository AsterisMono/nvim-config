return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required
    {
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    { 'williamboman/mason-lspconfig.nvim' },

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },     -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'L3MON4D3/LuaSnip' },     -- Required
    { 'onsails/lspkind.nvim' }, -- Beautify
  },
  config = function()
    local lsp = require('lsp-zero').preset({})

    lsp.on_attach(function(client, bufnr)
      lsp.default_keymaps({ buffer = bufnr })
    end)

    -- Disable LSP semanticTokensProvider after nvim 9.0
    -- Treesitter at home:
    lsp.set_server_config({
      on_init = function(client)
        client.server_capabilities.semanticTokensProvider = nil
      end,
    })

    lsp.format_on_save({
      servers = {
        ['lua_ls'] = { 'lua' },
        ['pyright'] = { 'python' },
      }
    })

    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls()) -- Integrate nvim lua apis

    lsp.setup()

    -- nvim-cmp config
    local cmp = require('cmp')
    cmp.setup({
      mapping = {
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
      },
      preselect = 'item',
      completion = {
        completeopt = 'menu,menuone,noinsert'
      },
      formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = require('lspkind').cmp_format({
          mode = 'symbol',       -- show only symbol annotations
          maxwidth = 50,         -- prevent the popup from showing more than provided characters
          ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
        })
      }
    })
  end,
}
