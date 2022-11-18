vim.keymap.set('i', '<Tab>', 'pumvisible() ? coc#_select_confirm() : "\\<Tab>"', { expr = true })

vim.g.coc_global_extensions = { 'coc-tsserver', 'coc-json', 'coc-html', 'coc-css', 'coc-emmet' }
