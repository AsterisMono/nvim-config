return {
  'github/copilot.vim',
  cond = not vim.g.vscode,
  config = function()
    vim.keymap.set('i', '<C-J>', 'copilot#Accept("<CR>")', {
      expr = true,
      replace_keycodes = false
    })
    vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')
    vim.keymap.set('i', '<C-H>', '<Plug>(copilot-suggest)')
  end
}
