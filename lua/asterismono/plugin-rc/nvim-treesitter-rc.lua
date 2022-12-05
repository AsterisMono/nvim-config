require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "tsx",
    "json",
    "css",
    "html",
    "lua",
    "yaml",
    "javascript",
    "typescript"
  },
  highlight = {
    enable = false,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
    }
  }
}

-- Folding by treesitter
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- No default folding
vim.wo.foldlevel = 99
