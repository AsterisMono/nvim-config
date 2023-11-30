return {
  'akinsho/nvim-bufferline.lua',
  after = "catppuccin",
  init = function()
    vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>')
    vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>')
    vim.keymap.set('n', 'X', '<cmd>bdelete<CR>', { desc = 'Close tab' })
    vim.keymap.set('n', '<leader>x', '<cmd>BufferLinePickClose<CR>', { desc = 'Pick to close' })
  end,
  config = function ()
    require("bufferline").setup {
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
      options = {
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
      },
    }
  end
}
