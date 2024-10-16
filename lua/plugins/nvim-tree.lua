return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		opts = {
			color_icons = true,
			default = true,
		},
	},
	opts = {
		hijack_cursor = true,
		sync_root_with_cwd = true,
		respect_buf_cwd = true,
		actions = {
			open_file = {
				quit_on_open = true,
			},
		},
		update_focused_file = {
			enable = true,
			update_root = true,
		},
	},
	keys = {
		{ "''", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Tree" } },
	},
}
