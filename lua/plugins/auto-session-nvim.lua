return {
  'rmagatti/auto-session',
  lazy = false,
  config = function()
    require("auto-session").setup {
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      bypass_session_save_file_types = { "NvimTree", "lazy" },
      auto_save_enabled = true,
      auto_restore_enabled = true,
      pre_save_cmds = {
        "NvimTreeClose",
        "silent! wa",
      },
      session_lens = {
        buftypes_to_ignore = { "NvimTree" }
      }
    }
  end,
  keys = {
    { "<leader>ss", function() require("auto-session.session-lens").search_session() end, desc = "Search Session" },
    { "<leader>sw", ":SessionSave",                                                       desc = "Save Session" },
    { "<leader>sd", ":Autosession delete<CR>",                                            desc = "Delete Session" },
  },
}
