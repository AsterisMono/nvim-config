vim.cmd("autocmd!")

-- Encoding
vim.scriptencoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Vim options
vim.wo.number = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'bash'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true -- Wrapped line will be indented
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.undofile = true

-- Highlights
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5

-- Themes and colorschemes
vim.opt.background = 'dark'

-- Auto save on focus lost
vim.cmd('autocmd FocusLost * :wa')
