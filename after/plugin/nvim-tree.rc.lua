require('nvim-tree').setup({
  hijack_cursor = true,
  actions = {
    open_file = {
      quit_on_open = true,
    }
  }
})

vim.keymap.set('n', '\'\'', '<cmd>NvimTreeToggle<CR>', {})
