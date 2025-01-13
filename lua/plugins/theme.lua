return {
	"maxmx03/solarized.nvim",
	lazy = false,
	priority = 1000,
	---@type solarized.config
	opts = {
		error_lens = {
			text = true,
			symbol = true,
		},
	},
	config = function(_, opts)
		vim.o.termguicolors = true
		vim.o.background = "light"
		require("solarized").setup(opts)
		vim.cmd.colorscheme("solarized")
	end,
}
