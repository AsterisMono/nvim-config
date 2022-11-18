-- Complete with tab
vim.keymap.set('i', '<Tab>', 'pumvisible() ? coc#_select_confirm() : "\\<Tab>"', { expr = true })
-- Complete with Enter
vim.keymap.set('i', '<CR>', 'pumvisible() ? coc#pum#confirm() : "\\<CR>"', { expr = true })

-- Diagnostic
vim.keymap.set('n', '[e', '<Plug>(coc-diagnostic-prev)')
vim.keymap.set('n', ']e', '<Plug>(coc-diagnostic-next)')

-- LSP actions
vim.keymap.set('n', '<leader>r', '<Plug>(coc-rename)', { desc = "Rename" })
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)')
vim.keymap.set('n', 'gr', '<Plug>(coc-references)')
vim.keymap.set('n', 'K', "<cmd>call CocActionAsync('doHover')<cr>")


vim.g.coc_global_extensions = { 'coc-tsserver', 'coc-json', 'coc-html', 'coc-css', 'coc-emmet', 'coc-prettier',
  'coc-eslint', 'coc-sumneko-lua' }
