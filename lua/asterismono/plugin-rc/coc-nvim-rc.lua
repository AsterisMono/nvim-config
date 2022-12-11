local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
local silent_opts = { silent = true }
-- Complete with tab
vim.keymap.set('i', '<Tab>', 'pumvisible() ? coc#_select_confirm() : "\\<Tab>"', opts)
-- Complete with Enter
vim.keymap.set('i', '<CR>', 'pumvisible() ? coc#pum#confirm() : "\\<CR>"', opts)

-- Diagnostic
vim.keymap.set('n', '[e', '<Plug>(coc-diagnostic-prev)')
vim.keymap.set('n', ']e', '<Plug>(coc-diagnostic-next)')

-- LSP actions
vim.keymap.set('n', '<leader>r', '<Plug>(coc-rename)', { desc = "Rename" })
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', silent_opts)
vim.keymap.set('n', 'K', "<cmd>call CocActionAsync('doHover')<cr>")
vim.keymap.set('n', '<leader>qf', '<Plug>(coc-fix-current)', { silent = true, desc = "Quickfix" })
vim.keymap.set('n', '<leader>ac', '<Plug>(coc-codeaction)', { silent = true, desc = "Code Actions" })

vim.g.coc_global_extensions = { 'coc-tsserver', 'coc-json', 'coc-html', 'coc-css', 'coc-emmet', 'coc-prettier',
  'coc-eslint', 'coc-sumneko-lua', 'coc-html-css-support' }
