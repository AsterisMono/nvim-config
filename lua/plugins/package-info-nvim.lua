return {
  'vuki656/package-info.nvim',
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  event = 'VeryLazy',
  opts = {
    package_manager = 'pnpm'
  },
  keys = {
    -- -- Show dependency versions
    -- { "<LEADER>ns", require("package-info").show },

    -- -- Hide dependency versions
    -- { "<LEADER>nc", require("package-info").hide },

    -- -- Toggle dependency versions
    -- { "<LEADER>nt", require("package-info").toggle },

    -- Update dependency on the line
    { "<LEADER>nu", "<cmd>lua require('package-info').update()<CR>", desc = "Update dependency" },

    -- Delete dependency on the line
    { "<LEADER>nd", "<cmd>lua require('package-info').delete()<CR>", desc = "Remove dependency" },

    -- Install a new dependency
    { "<LEADER>ni", "<cmd>lua require('package-info').install()<CR>", desc = "Add dependency" },

    -- Install a different dependency version
    { "<LEADER>np", "<cmd>lua require('package-info').change_version()<CR>", desc = "Install a different version" }
  }

}
