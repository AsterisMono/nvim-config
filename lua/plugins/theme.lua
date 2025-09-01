return {
	"shaunsingh/nord.nvim",
	lazy = false,
	priority = 1000,
	config = function(_, opts)
		vim.opt.background = "dark"
		vim.g.nord_disable_background = true
		vim.g.nord_cursorline_transparent = true
		vim.g.nord_italic = false
		require('nord').set()
	end,
}
