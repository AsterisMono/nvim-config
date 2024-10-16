return {
	{
		"tpope/vim-commentary",
		event = "InsertEnter",
	},
	{
		"tpope/vim-surround",
		event = "InsertEnter",
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
		config = function()
			require("nvim-autopairs").setup({})

			-- Insert `(` after select function or method item
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
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
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
			{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
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
}
