require('neoclip').setup()
require('telescope').load_extension('neoclip')

vim.keymap.set('n', '\'y', '<cmd>Telescope neoclip<CR>', {desc='Registers'})
