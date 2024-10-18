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
	},
	opts = {
		defaults = {
			mappings = {
				n = {
					["q"] = require("telescope.actions").close,
				},
				i = {
					["<C-q>"] = require("telescope.actions").close,
				},
			},
		},
	},
}
