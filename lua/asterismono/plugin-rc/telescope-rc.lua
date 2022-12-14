local builtin = require('telescope.builtin')
local telescope = require("telescope")

telescope.setup({
  extensions = {
    coc = {
      theme = 'ivy',
      prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
    }
  },
})
telescope.load_extension('coc')
telescope.load_extension('neoclip')

-- vim.keymap.set('n', '\'\'', '<cmd>Telescope file_browser initial_mode=normal<CR>', { desc = 'File Browser' })

-- require 'key-menu'.set('n', '\'', { desc = 'Telescope' })
vim.keymap.set('n', '\'f', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '\'r', builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '\'b', '<cmd>Telescope buffers initial_mode=normal<CR>', { desc = 'Buffers' })
vim.keymap.set('n', '\'y', '<cmd>Telescope neoclip initial_mode=normal<CR>', { desc = 'Registers' })
vim.keymap.set('n', '\'p', '<cmd>Telescope projects initial_mode=normal<CR>', { desc = 'Projects' })
vim.keymap.set('n', '<leader>mm', builtin.marks, { desc = 'Marks' })

vim.keymap.set('n', '<leader>e', '<cmd>Telescope coc diagnostics initial_mode=normal<CR>', { desc = 'Diagnostics' })
vim.keymap.set('n', '<leader>sy', '<cmd>Telescope coc document_symbols<CR>', { desc = 'Document Symbols' })
vim.keymap.set('n', '<leader>ca', '<cmd>Telescope coc code_actions initial_mode=normal<CR>', { desc = 'Code Actions' })

require 'key-menu'.set('n', '<leader>f', { desc = 'Find' })
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope coc references initial_mode=normal<CR>', { desc = 'Find References' })
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope coc definitions initial_mode=normal<CR>', { desc = 'Find Definitions' })
vim.keymap.set('n', '<leader>mr', "<cmd>Telescope frecency initial_mode=normal<CR>",
  { noremap = true, silent = true, desc = 'MRU' })
