return {
  'akinsho/nvim-bufferline.lua',
  event = { "UIEnter" },
  init = function()
    vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>')
    vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>')
    vim.keymap.set('n', 'X', '<cmd>bdelete<CR>', { desc = 'Close tab' })
    vim.keymap.set('n', '<leader>bx', '<cmd>BufferLinePickClose<CR>', { desc = 'Pick to close' })
    vim.keymap.set('n', '<leader>bp', '<cmd>BufferLineTogglePin<CR>', { desc = 'Pin buffer' })
    -- bh, bl: close buffer to the left/right, bo: close all but current buffer
    vim.keymap.set('n', '<leader>bl', '<cmd>BufferLineCloseRight<CR>', { desc = 'Close to the right' })
    vim.keymap.set('n', '<leader>bh', '<cmd>BufferLineCloseLeft<CR>', { desc = 'Close to the left' })
    vim.keymap.set('n', '<leader>bo', '<cmd>BufferLineCloseOthers<CR>', { desc = 'Close others' })
  end,
  config = function()
    require("bufferline").setup {
      options = {
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        diagnostics = "nvim_lsp",
        color_icons = true,
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end
      },
    }
  end
}
