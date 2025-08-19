local keymap = vim.keymap
local opts = {
	noremap = true, -- non-recursive
	silent = true, -- do not show message
}
local safe_exit = function()
	vim.cmd("wa")
	vim.cmd("q")
end

-- Utility keymaps
keymap.set("n", "<leader>h", "<cmd>noh<CR>", { desc = "Clear highlight" })
keymap.set("n", "<C-s>", "<cmd>write<CR>", opts)
keymap.set("n", "<C-x>", safe_exit, opts)

local direction_aware_split = function()
	local cur_win_width = vim.api.nvim_win_get_width(0)
	local cur_win_height = vim.api.nvim_win_get_height(0)
	-- ooh magic number!
	if cur_win_width >= cur_win_height * 3 then
		vim.cmd("vsp")
	else
		vim.cmd("sp")
	end
end

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)
keymap.set("n", "<C-q>", direction_aware_split, opts)

-- Resize windows with c-arrows
-- delta: 2 lines
keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move screen around with arrows
keymap.set("n", "<Up>", "<C-y>", opts)
keymap.set("n", "<Down>", "<C-e>", opts)
