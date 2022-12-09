require('nvim-tree').setup({
  hijack_cursor = true,
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  actions = {
    open_file = {
      quit_on_open = true,
    }
  },
  update_focused_file = {
    enable = true,
    update_root = true
  }
})

vim.keymap.set('n', '\'\'', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle Tree' })
