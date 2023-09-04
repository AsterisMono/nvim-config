return {
  "folke/trouble.nvim",
  keys = {
    { "<leader>xx", function() require("trouble").open() end, desc = "Trouble" },
    { "<leader>xw", function() require("trouble").open("workspace_diagnostics") end, desc = "Workspace Diagnostics" },
    { "<leader>xd", function() require("trouble").open("document_diagnostics") end, desc = "Document Diagnostics" },
    { "<leader>xq", function() require("trouble").open("quickfix") end, desc = "Quickfix" },
    { "<leader>xl", function() require("trouble").open("loclist") end, desc = "Loc List" },
    { "gR", function() require("trouble").open("lsp_references") end, desc = "LSP References" },
  },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
}
