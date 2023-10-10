local keymap = vim.keymap
local opts = {
  noremap = true, -- non-recursive
  silent = true,  -- do not show message
}
-- Hint: see `:h vim.map.set()`

-- Utility keymaps
keymap.set('n', '<leader>h', '<cmd>noh<CR>', { desc = 'Clear highlight' }, opts)
