require 'key-menu'.set('n', '<leader>c', { desc = 'Colors and code actions' })
vim.keymap.set('n', '<leader>cr', '<cmd>ConvertColorTo rgba<CR>', { desc = 'Convert to rgba' })
vim.keymap.set('n', '<leader>ch', '<cmd>ConvertColorTo hex<CR>', { desc = 'Convert to hex' })
