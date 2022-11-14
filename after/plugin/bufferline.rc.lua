require('bufferline').setup({
  options = {
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    diagnostics = "nvim_lsp",
  },
})

vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', {})
vim.keymap.set('n', '<leader>x', '<cmd>BufferLinePickClose<CR>', {})
vim.keymap.set('n', '<leader><leader>', '<cmd>BufferLinePick<CR>', {})
