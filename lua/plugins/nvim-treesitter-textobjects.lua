return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  dependencies = {
    'nvim-treesitter/nvim-treesitter'
  },
  config = function()
    require('nvim-treesitter.configs').setup({
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Auto jump forward for match textobj
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
          },
          selection_modes = {
            ["@function.outer"] = 'v', -- charwise selection for functions
          },
          include_surrounding_whitespace = true,
        }
      }
    })
  end
}
