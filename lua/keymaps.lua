local keymap = vim.keymap
local opts = {
  noremap = true, -- non-recursive
  silent = true,  -- do not show message
}
-- Hint: see `:h vim.map.set()`

-- Utility keymaps
keymap.set('n', '<leader>h', '<cmd>noh<CR>', { desc = 'Clear highlight' }, opts)
keymap.set('n', '<C-s>', '<cmd>write<CR>', opts)
keymap.set('n', '<C-x>', '<cmd>wqa<CR>', opts)

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize windows with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)
