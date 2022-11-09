require('bufferline').setup({
  options = {
    mode = 'tabs',
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    diagnostics = "nvim_lsp",
  },
})

vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', {})
