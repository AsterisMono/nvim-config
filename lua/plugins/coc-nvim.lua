local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
local silent_opts = { silent = true }

return {
  'neoclide/coc.nvim',
  branch = 'release',
  event = 'BufReadPre',
  cmd = 'CocStart',
  keys = {
    -- Diagnostic
    { '[e', '<Plug>(coc-diagnostic-prev)' },
    { ']e', '<Plug>(coc-diagnostic-next)' },

    -- LSP actions
    { '<leader>r', '<Plug>(coc-rename)', { desc = "Rename" } },
    { 'gd', '<Plug>(coc-definition)', silent_opts },
    { 'K', "<cmd>call CocActionAsync('doHover')<cr>" },
    { '<leader>qf', '<Plug>(coc-fix-current)', { silent = true, desc = "Quickfix" } },
    { '<leader>ac', '<Plug>(coc-codeaction)', { silent = true, desc = "Code Actions" } },
  },
  config = function()
    -- Complete with tab
    vim.keymap.set('i', '<Tab>', 'pumvisible() ? coc#_select_confirm() : "\\<Tab>"', opts)
    -- Complete with Enter
    vim.keymap.set('i', '<CR>', 'pumvisible() ? coc#pum#confirm() : "\\<CR>"', opts)
    vim.g.coc_global_extensions = { 'coc-tsserver', 'coc-json', 'coc-html', 'coc-css', 'coc-emmet', 'coc-prettier',
      'coc-eslint', 'coc-sumneko-lua', 'coc-html-css-support' }
  end
}
