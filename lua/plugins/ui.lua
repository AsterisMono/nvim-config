return {
	{
		"nvim-lualine/lualine.nvim",
		event = "UIEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
			},
		},
	},
}
