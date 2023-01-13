return {
  'akinsho/nvim-bufferline.lua',
  event = 'VeryLazy',
  init = function()
    vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>')
    vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>')
    vim.keymap.set('n', '<leader>x', '<cmd>bdelete<CR>', { desc = 'Close tab' })
    vim.keymap.set('n', '<leader>X', '<cmd>BufferLinePickClose<CR>', { desc = 'Pick to close' })
    vim.keymap.set('n', '<leader><leader>', '<cmd>BufferLinePick<CR>', { desc = 'Pick tab' })
  end,
  opts = {
    options = {
      always_show_bufferline = false,
      show_buffer_close_icons = false,
      show_close_icon = false,
      color_icons = true,
    },
  }
}
