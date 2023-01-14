return {
  "nvim-treesitter/nvim-treesitter",
  event = { 'BufReadPre' , 'BufNew' },
  opts = {
    sync_install = false,
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
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<CR>',
        node_incremental = '<CR>',
        node_decremental = '<BS>',
      }
    }
  },
  config = function(plugin, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}
