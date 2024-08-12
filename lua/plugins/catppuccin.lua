return {
  "catppuccin/nvim",
  cond = not vim.g.vscode,
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
      show_end_of_buffer = false,
      integrations = {
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        flash = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        lsp_saga = true,
        mason = true,
        cmp = true,
        telescope = {
          enabled = true,
        },
        lsp_trouble = true,
      }
    })
    vim.cmd('colorscheme catppuccin-macchiato')
  end
}
