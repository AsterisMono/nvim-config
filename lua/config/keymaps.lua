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

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize windows with arrows
-- delta: 2 lines
keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- LSP Diagnostics
keymap.set("n", "[e", vim.diagnostic.goto_prev)
keymap.set("n", "]e", vim.diagnostic.goto_next)
