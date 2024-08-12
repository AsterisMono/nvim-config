return {
  'hrsh7th/nvim-cmp',
  cond = not vim.g.vscode,
  event = 'InsertEnter',
  dependencies = {
    { 'L3MON4D3/LuaSnip' },
  },
  config = function()
    local lsp_zero = require('lsp-zero')
    lsp_zero.extend_cmp()

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
  end
}
