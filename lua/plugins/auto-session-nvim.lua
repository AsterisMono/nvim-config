return {
  'rmagatti/auto-session',
  lazy = false,
  config = function()
    local autocmd = vim.api.nvim_create_autocmd
    -- Preserve nvimTree state
    autocmd({ "BufEnter" }, {
      pattern = "NvimTree*",
      callback = function()
        local api = require "nvim-tree.api"
        local view = require "nvim-tree.view"

        if not view.is_visible() then
          api.tree.open()
        end
      end,
    })
    require("auto-session").setup {
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      bypass_session_save_file_types = { "NvimTree", "lazy" },
      auto_save_enabled = true,
      auto_restore_enabled = true,
      session_lens = {
        buftypes_to_ignore = { "NvimTree" }
      }
    }
  end,
  keys = {
    { "<leader>ss", function() require("auto-session.session-lens").search_session() end, desc = "Search Session" },
    { "<leader>sw", ":SessionSave<CR>",                                                   desc = "Save Session" },
    { "<leader>sd", ":Autosession delete<CR>",                                            desc = "Delete Session" },
  },
}
