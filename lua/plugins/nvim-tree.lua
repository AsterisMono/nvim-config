return {
  'nvim-tree/nvim-tree.lua',
  opts = {
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
  },
  keys = {
    { '\'\'',       '<cmd>NvimTreeToggle<CR>',   { desc = 'Toggle Tree' } },
    { '<leader>ff', '<cmd>NvimTreeFindFile<CR>', { desc = 'Find file in tree' } },
  }
}
