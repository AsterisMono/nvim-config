vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
local auto_session = require("auto-session")
auto_session.setup {
  log_level = "error",
  auto_session_enabled = true,
  auto_session_create_enabled = true,
  auto_session_enable_last_session = true,
  auto_restore_enabled = true,
  -- pre_save_cmds = { "lua require'nvim-tree'.setup()", "tabdo NvimTreeClose" }
}
