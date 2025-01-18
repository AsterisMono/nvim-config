--return {
--	"maxmx03/solarized.nvim",
--	lazy = false,
--	priority = 1000,
--	---@type solarized.config
--	opts = {
--		error_lens = {
--			text = true,
--			symbol = true,
--		},
--	},
--	config = function(_, opts)
--		vim.o.termguicolors = true
--		vim.o.background = "light"
--		require("solarized").setup(opts)
--		vim.cmd.colorscheme("solarized")
--	end,
--}

return {
	"Shatur/neovim-ayu",
	opts = {
		-- Transparency
		overrides = {
			Normal = { bg = "None" },
			NormalFloat = { bg = "none" },
			ColorColumn = { bg = "None" },
			SignColumn = { bg = "None" },
			Folded = { bg = "None" },
			FoldColumn = { bg = "None" },
			CursorLine = { bg = "None" },
			CursorColumn = { bg = "None" },
			VertSplit = { bg = "None" },
		},
	},
	config = function(_, opts)
		vim.o.termguicolors = true
		vim.o.background = "light"
		require("ayu").setup(opts)
		vim.cmd.colorscheme("ayu")
	end,
}
