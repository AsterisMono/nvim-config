vim.cmd("autocmd!")

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Setup keymaps
require("config.keymaps")

-- Disable netrw for nvim-tree
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- Encoding
vim.scriptencoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Disable fillchars
vim.opt.fillchars = "eob: "

-- Vim options
vim.opt.number = true -- Show line numbers
vim.opt.autoindent = true -- Auto indent
vim.opt.smartindent = true -- Smart indent

vim.opt.hlsearch = true -- Highlight search results
vim.opt.backup = false -- No backup files
-- [[
-- What is a backup file?
-- When you edit a file, Vim creates a backup file. This is a copy of the file you are editing. You can use the backup file to recover the original file if you make a mistake. The backup file is a hidden file, so you won't see it unless you use ls -a.
-- ]]
vim.opt.showcmd = true -- Show command in bottom bar
vim.opt.cmdheight = 1 -- Height of the command bar
vim.opt.laststatus = 3 -- Always display the status line
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.scrolloff = 10 -- Lines of context
vim.opt.shell = "fish" -- Shell to use
vim.opt.inccommand = "split" -- Show effects of a command incrementally
vim.opt.ignorecase = true -- Ignore case
vim.opt.smarttab = true -- Smart tabs, expand tabs to spaces
vim.opt.breakindent = true -- Wrapped line will be indented
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.backspace = { "start", "eol", "indent" }
-- [[
-- start: allow backspacing over everything in insert mode
-- eol: allow backspacing over line breaks (join lines)
-- indent: allow backspacing over autoindent
-- ]]
vim.opt.path:append({ "**" }) -- Search for files in subdirectories
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.undofile = true -- Persistent undo

-- UI
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.cursorline = true -- Highlight current line
vim.opt.termguicolors = true -- True color support
vim.opt.winblend = 0 -- Transparency
vim.opt.wildoptions = "pum" -- Show popup menu
vim.opt.pumblend = 5 -- Popup menu transparency
vim.opt.signcolumn = "yes" -- Prevent gutter from moving

-- Recommended session options for auto-session
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions,globals"

-- Themes and colorschemes
vim.opt.background = "light"

-- Auto save on focus lost
vim.cmd("autocmd FocusLost * :wa")

-- Yank highlight
vim.cmd([[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=150}
  augroup END
]])

vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
})

-- Neovide
if vim.g.neovide then
	vim.o.guifont = "FiraCode Nerd Font:h13:style=Retina"
	vim.g.neovide_opacity = 0.9

	local function set_ime(args)
		if args.event:match("Enter$") then
			vim.g.neovide_input_ime = true
		else
			vim.g.neovide_input_ime = false
		end
	end

	local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

	vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
		group = ime_input,
		pattern = "*",
		callback = set_ime,
	})

	vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
		group = ime_input,
		pattern = "[/\\?]",
		callback = set_ime,
	})

	vim.g.neovide_cursor_animation_length = 0
	vim.g.neovide_cursor_short_animation_length = 0
	vim.g.neovide_scroll_animation_length = 0.1
end
