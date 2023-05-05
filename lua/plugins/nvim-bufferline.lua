return {
  'akinsho/nvim-bufferline.lua',
  event = 'VeryLazy',
  init = function()
    vim.keymap.set('n', '<A-j>', '<cmd>BufferLineCycleNext<CR>')
    vim.keymap.set('n', '<A-k>', '<cmd>BufferLineCyclePrev<CR>')
    vim.keymap.set('n', '<A-x>', '<cmd>bdelete<CR>', { desc = 'Close tab' })
    vim.keymap.set('n', '<leader>x', '<cmd>BufferLinePickClose<CR>', { desc = 'Pick to close' })
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
