return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  lazy = false,
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
    { 'hrsh7th/nvim-cmp' },             -- Required
    { 'hrsh7th/cmp-buffer' },           -- Recommended
    { 'hrsh7th/cmp-path' },             -- Recommended
    { 'hrsh7th/cmp-nvim-lsp' },         -- Required
    { 'saadparwaiz1/cmp_luasnip' },     -- Recommended
    { "rafamadriz/friendly-snippets" }, -- Snippets
    { 'L3MON4D3/LuaSnip' },             -- Required
    { 'onsails/lspkind.nvim' },         -- Beautify
  },
  config = function()
    local lsp_zero = require('lsp-zero')

    lsp_zero.on_attach(function(client, bufnr)
      lsp_zero.default_keymaps({
        buffer = bufnr,
        exclude = { 'gr' },
        preserve_mappings = false
      })
    end)

    lsp_zero.format_on_save({
      format_opts = {
        async = false,
        timeout_ms = 10000,
      },
      servers = {
        ['null-ls'] = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'html', 'css', 'json' },
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
      }
    })

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
        'prettierd',
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

    -- nvim-cmp config
    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()
    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup({
      mapping = {
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
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

    -- I want to insert `(` after select function or method item
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
  end,
  keys = {
    {
      '=',
      function()
        vim.lsp.buf.format({ async = false })
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), 'x', true)
      end,
      desc = 'Format selected',
      mode = "v",
    },
  }
}
