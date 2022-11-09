require('nvim-tree').setup({
  hijack_cursor = true,
})

vim.keymap.set('n', '\'\'', '<cmd>NvimTreeToggle<CR>', {})
