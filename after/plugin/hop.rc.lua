local hop = require('hop')
hop.setup()

-- Triple leader key smash
vim.keymap.set('', '<leader><leader><leader>', '<cmd>HopWord<CR>')
