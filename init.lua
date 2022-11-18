-- Disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Preload lsp_signature
-- require "lsp_signature".setup(
--   require('asterismono.plugin-rc.lsp_signature-rc')
-- )

require('asterismono.base')
require('asterismono.plugins')
require('asterismono.maps')
