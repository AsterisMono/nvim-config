return {
	"rose-pine/neovim",
	lazy = false,
	priority = 1000,
	config = function(_, opts)
		vim.cmd.colorscheme("rose-pine-dawn")
	end,
}
