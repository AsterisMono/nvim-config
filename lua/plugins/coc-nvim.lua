return {
  'neoclide/coc.nvim',
  branch = 'release',
  config = function()
    local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
    -- Completion, Enter hijack and diagnostics
    vim.keymap.set('i', '<Tab>', 'pumvisible() ? coc#_select_confirm() : "\\<Tab>"', opts)
    vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
    vim.keymap.set('n', '[e', '<Plug>(coc-diagnostic-prev)')
    vim.keymap.set('n', ']e', '<Plug>(coc-diagnostic-next)')

    -- LSP actions
    vim.keymap.set('n', '<leader>lr', '<Plug>(coc-rename)', { desc = "Rename", silent = true })
    vim.keymap.set('n', '<leader>lR', '<Plug>(coc-codeaction-refactor)', { desc = "Refactor", silent = true })
    vim.keymap.set('x', '<leader>lR', '<Plug>(coc-codeaction-refactor-selected)', { desc = "Refactor selected", silent = true })
    vim.keymap.set('n', '<leader>lf', '<Plug>(coc-fix-current)', { silent = true, desc = "Quickfix" })
    vim.keymap.set('n', '<leader>la', '<Plug>(coc-codeaction)', { silent = true, desc = "Code Actions" })
    vim.keymap.set('n', '<leader>ld', ':<C-u>CocList diagnostics<cr>',
      { silent = true, nowait = true, desc = "Diagnostics" })
    -- Goto commands
    vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true, desc = "Definition" })
    vim.keymap.set("n", "gt", "<Plug>(coc-type-definition)", { silent = true, desc = "Type Definition" })
    vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true, desc = "Implementation" })
    vim.keymap.set("n", "gR", "<Plug>(coc-references)", { silent = true, desc = "References" })

    -- Use K to show documentation in preview window
    function _G.show_docs()
      local cw = vim.fn.expand('<cword>')
      if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
      elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
      else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
      end
    end

    vim.keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })

    vim.keymap.set("x", "=", "<Plug>(coc-format-selected)", { silent = true })

    local float_opts = {silent = true, nowait = true, expr = true}
    -- FIXME: Not behaving correctly with neoscroll
    vim.keymap.set("n", "<PageDn>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', float_opts)
    vim.keymap.set("n", "<PageUp>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', float_opts)
    vim.keymap.set("i", "<C-f>",
           'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', float_opts)

    vim.keymap.set("i", "<C-b>",
           'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', float_opts)
    -- vim.keymap.set("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', float_opts)
    -- vim.keymap.set("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', float_opts)
    
    -- Pre-installed extensions
    vim.g.coc_global_extensions = { 'coc-tsserver', 'coc-json', 'coc-html', 'coc-css', 'coc-emmet', 'coc-prettier',
      'coc-eslint', 'coc-sumneko-lua', 'coc-html-css-support', 'coc-pairs'}
  end
}

