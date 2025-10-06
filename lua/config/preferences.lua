vim.cmd("autocmd!")

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Encoding
vim.scriptencoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Disable fillchars
vim.opt.fillchars = "eob: "

-- Vim options
vim.opt.number = true      -- Show line numbers
vim.opt.autoindent = true  -- Auto indent
vim.opt.smartindent = true -- Smart indent

vim.opt.hlsearch = true    -- Highlight search results
vim.opt.backup = false     -- No backup files
-- [[
-- What is a backup file?
-- When you edit a file, Vim creates a backup file. This is a copy of the file you are editing. You can use the backup file to recover the original file if you make a mistake. The backup file is a hidden file, so you won't see it unless you use ls -a.
-- ]]
vim.opt.shell = "fish"       -- Shell to use
vim.opt.inccommand = "split" -- Show effects of a command incrementally
vim.opt.ignorecase = true    -- Ignore case
vim.opt.smarttab = true      -- Smart tabs, expand tabs to spaces
vim.opt.breakindent = true   -- Wrapped line will be indented
vim.opt.shiftwidth = 2       -- Size of an indent
vim.opt.tabstop = 2          -- Number of spaces tabs count for
vim.opt.backspace = { "start", "eol", "indent" }
-- [[
-- start: allow backspacing over everything in insert mode
-- eol: allow backspacing over line breaks (join lines)
-- indent: allow backspacing over autoindent
-- ]]
vim.opt.path:append({ "**" }) -- Search for files in subdirectories
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.undofile = true       -- Persistent undo

-- Yank highlight
vim.cmd([[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=150}
  augroup END
]])
