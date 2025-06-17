return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	version = false,
	keys = {
		{ "'f", "<cmd>Telescope find_files<CR>", desc = "Find files" },
		{ "'r", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
		{ "'R", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Grep in current file" },
		{ "'b", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
		{ "'e", "<cmd>Telescope resume initial_mode=normal<CR>", desc = "Resume" },
		{ "'gb", "<cmd>Telescope git_branches<CR>", desc = "Git branches" },
		{ "'gc", "<cmd>Telescope git_commits<CR>", desc = "Git commits" },
		{ "'gs", "<cmd>Telescope git_status<CR>", desc = "Git status" },
		{ "'j", "<cmd>Telescope jumplist<CR>", desc = "Jumplist" },
		{ "'lr", "<cmd>Telescope lsp_references<CR>", desc = "LSP references" },
	},
}
