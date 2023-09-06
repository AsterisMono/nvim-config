vim.cmd("autocmd!")

-- Encoding
vim.scriptencoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Vim options
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.autoindent = true     -- Auto indent
vim.opt.smartindent = true    -- Smart indent

vim.opt.hlsearch = true       -- Highlight search results
vim.opt.backup = false        -- No backup files
-- [[
-- What is a backup file?
-- When you edit a file, Vim creates a backup file. This is a copy of the file you are editing. You can use the backup file to recover the original file if you make a mistake. The backup file is a hidden file, so you won't see it unless you use ls -a.
-- ]]
vim.opt.showcmd = true       -- Show command in bottom bar
vim.opt.cmdheight = 1        -- Height of the command bar
vim.opt.laststatus = 2       -- Always display the status line
vim.opt.expandtab = true     -- Use spaces instead of tabs
vim.opt.scrolloff = 10       -- Lines of context
vim.opt.shell = 'bash'       -- Shell to use
vim.opt.inccommand = 'split' -- Show effects of a command incrementally
vim.opt.ignorecase = true    -- Ignore case
vim.opt.smarttab = true      -- Smart tabs, expand tabs to spaces
vim.opt.breakindent = true   -- Wrapped line will be indented
vim.opt.shiftwidth = 2       -- Size of an indent
vim.opt.tabstop = 2          -- Number of spaces tabs count for
vim.opt.backspace = { 'start', 'eol', 'indent' }
-- [[
-- start: allow backspacing over everything in insert mode
-- eol: allow backspacing over line breaks (join lines)
-- indent: allow backspacing over autoindent
-- ]]
vim.opt.path:append { '**' } -- Search for files in subdirectories
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.undofile = true      -- Persistent undo

-- UI
vim.opt.splitbelow = true    -- Put new windows below current
vim.opt.splitright = true    -- Put new windows right of current
vim.opt.cursorline = true    -- Highlight current line
vim.opt.termguicolors = true -- True color support
vim.opt.winblend = 0         -- Transparency
vim.opt.wildoptions = 'pum'  -- Show popup menu
vim.opt.pumblend = 5         -- Popup menu transparency

-- Themes and colorschemes
vim.opt.background = 'dark'

-- Auto save on focus lost
vim.cmd('autocmd FocusLost * :wa')

-- Yank highlight
vim.cmd [[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=150}
  augroup END
]]

vim.cmd [[ 
  sign define DiagnosticSignError text=  linehl= texthl=DiagnosticSignError numhl=
  sign define DiagnosticSignWarn text= linehl= texthl=DiagnosticSignWarn numhl= 
  sign define DiagnosticSignInfo text=  linehl= texthl=DiagnosticSignInfo numhl= 
  sign define DiagnosticSignHint text=💡  linehl= texthl=DiagnosticSignHint numhl= 
]]

-- Force open signcolumn to avoid jumping
vim.opt.signcolumn = "yes"
