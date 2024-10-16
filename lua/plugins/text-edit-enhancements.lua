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
}
