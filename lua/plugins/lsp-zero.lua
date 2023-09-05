return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
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
    { 'hrsh7th/nvim-cmp' },     -- Required
    { 'hrsh7th/cmp-buffer' },   -- Recommended
    { 'hrsh7th/cmp-path' },     -- Recommended
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'saadparwaiz1/cmp_luasnip' }, -- Recommended
    { "rafamadriz/friendly-snippets" }, -- Snippets
    { 'L3MON4D3/LuaSnip' },     -- Required
    { 'onsails/lspkind.nvim' }, -- Beautify
  },
  config = function()
    local lsp = require('lsp-zero').preset({
      name = 'recommended'
    })

    lsp.on_attach(function(client, bufnr)
      lsp.default_keymaps({ buffer = bufnr })
    end)

    lsp.ensure_installed({
      'tsserver',
      'eslint',
      'lua_ls',
      'emmet_ls',
      'jsonls',
      'cssls',
      'html'
    })

    -- Disable LSP semanticTokensProvider after nvim 9.0
    -- Treesitter at home:
    lsp.set_server_config({
      on_init = function(client)
        client.server_capabilities.semanticTokensProvider = nil
      end,
    })

    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls()) -- Integrate nvim lua apis

    lsp.setup()

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
