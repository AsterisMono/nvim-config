return {
	{
		"tpope/vim-commentary",
		event = "InsertEnter",
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},
	{
		"kana/vim-textobj-entire",
		event = "InsertEnter",
		dependencies = {
			"kana/vim-textobj-user",
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {
			modes = {
				char = {
					jump_labels = true,
				},
			},
		},
    -- stylua: ignore
		keys = {
			{ "s", mode = "n", function() require("flash").jump() end, desc = "Flash" },
			{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
			{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      { "<leader>ls", function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		},
	},
	{
		"kevinhwang91/nvim-fundo",
		dependencies = {
			"kevinhwang91/promise-async",
			lazy = true,
		},
		build = function()
			require("fundo").install()
		end,
		config = true,
		event = "VeryLazy",
	},
	{
		"vim-scripts/ReplaceWithRegister",
		event = "VeryLazy",
	},
	{
		"wellle/targets.vim",
		event = "VeryLazy",
	},
	{
		"gbprod/yanky.nvim",
		event = "VeryLazy",
		config = function()
			require("yanky").setup({
				highlight = {
					on_put = false,
					on_yank = false,
				},
			})
			vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")

			vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
			vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
			vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
			vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

			vim.keymap.set("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)")
			vim.keymap.set("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)")
			vim.keymap.set("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)")
			vim.keymap.set("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)")

			vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
			vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		-- lazy loading is not particularly necessary for this plugin.
		-- nvim-ts-autotag is efficient in choosing when it needs to load
		opts = {},
	},
	{
		"saifulapm/commasemi.nvim",
		lazy = false,
		opts = {
			leader = "<localleader>",
			keymaps = true,
			commands = true,
		},
	},
}
