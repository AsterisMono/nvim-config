local keymap = vim.keymap

-- WARNING: This is the VSCode version of keymap config.

local function notify(cmd)
  return string.format("<cmd>call VSCodeNotify('%s')<CR>", cmd)
end

-- Multi tab and window editing
keymap.set('n', '<Space>', '<C-w>w')

-- Utility
keymap.set('n', '<leader>h', '<cmd>noh<CR>', { desc = 'Clear highlight' })
keymap.set('n', '<C-s>', '<cmd>write<CR>')

-- Telescope replica
-- Use Ctrl-Q to return to active editor
keymap.set('n', '\'f', notify 'workbench.action.quickOpen')
keymap.set('n', '\'r', notify 'workbench.action.findInFiles')
keymap.set('n', '\'\'', notify 'workbench.view.explorer')
keymap.set('n', '\'x', notify 'workbench.action.closeSidebar')

-- Live-server
keymap.set('n', '<leader>ls', notify 'extension.liveServer.goOnline')

-- Peek definition and find reference
keymap.set('n', '<leader>pd', notify 'editor.action.peekDefinition')
keymap.set('n', '<leader>fr', notify 'references-view.findReferences')
