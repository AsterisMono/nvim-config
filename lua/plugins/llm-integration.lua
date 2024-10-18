return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false,
	init = function()
		-- Compress status line
		vim.opt.laststatus = 3
	end,
	opts = {
		provider = "openai",
		openai = {
			-- api_key_name = { "op", "read", "op://Private/Claude/credential" },
			api_key_name = { "cat", "/Users/cmiki/.secrets/claude_api" },
			endpoint = "https://aihubmix.com/v1",
			model = "claude-3-5-sonnet-20240620",
			temperature = 0,
			max_tokens = 4096,
		},
	},
	build = "make",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		-- "zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
