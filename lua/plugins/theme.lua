return {
	"rose-pine/neovim",
	lazy = false,
	priority = 1000,
	config = function(_, opts)
		require("rose-pine").setup({
			highlight_groups = {
				CurSearch = { fg = "base", bg = "leaf", inherit = false },
				Search = { fg = "text", bg = "leaf", blend = 20, inherit = false },
				TelescopeBorder = { fg = "overlay", bg = "overlay" },
				TelescopeNormal = { fg = "subtle", bg = "overlay" },
				TelescopeSelection = { fg = "text", bg = "highlight_med" },
				TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
				TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

				TelescopeTitle = { fg = "base", bg = "love" },
				TelescopePromptTitle = { fg = "base", bg = "pine" },
				TelescopePreviewTitle = { fg = "base", bg = "iris" },

				TelescopePromptNormal = { fg = "text", bg = "surface" },
				TelescopePromptBorder = { fg = "surface", bg = "surface" },

				BlinkCmpDoc = { fg = "subtle", bg = "overlay" },
				BlinkCmpDocBorder = { fg = "overlay", bg = "overlay" },
				BlinkCmpDocSeparator = { fg = "subtle", bg = "overlay" },
				BlinkCmpSignatureHelp = { fg = "subtle", bg = "overlay" },
				BlinkCmpSignatureBorder = { fg = "overlay", bg = "overlay" },
			},
		})
		vim.cmd.colorscheme("rose-pine")
	end,
}
