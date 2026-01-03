local keyOpts = function(desc)
	return { noremap = true, silent = true, desc = desc }
end
local map = vim.keymap.set
return {
	-- Bottom: status line
	{
		"nvim-lualine/lualine.nvim",
		event = "UIEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "rose-pine",
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = { "filename" },
				lualine_x = {
					{
						"fileformat",
						icons_enabled = true,
						symbols = {
							unix = "LF",
							dos = "CRLF",
							mac = "CR",
						},
					},
				},
			},
		},
	},
	-- Dressing: nvim UI enhancements
	{
		"stevearc/dressing.nvim",
		event = "UIEnter",
		opts = {},
	},
	-- Noice
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		event = "UIEnter",
		opts = {
			cmdline = {
				enabled = true,
				view = "cmdline",
			},
			views = {
				mini = {
					winhighlight = {},
					win_options = {
						winblend = 0,
					},
				},
			},
			lsp = {
				signature = {
					enabled = false,
				},
				hover = {
					enabled = false,
				},
			},
			routes = {
				{
					filter = { event = "notify", find = "No code actions available" },
					opts = { skip = true },
				},
			},
		},
		config = function(_, opts)
			require("noice").setup(opts)
			map("n", "<leader>no", ":Noice pick<CR>", keyOpts("Noice picker"))
		end,
	},
	{
		{
			"smjonas/inc-rename.nvim",
			config = function()
				require("inc_rename").setup({
					input_buffer_type = "dressing",
				})
				vim.keymap.set("n", "<leader>lr", ":IncRename ")
			end,
		},
	},
	-- Git signs in the gutter
	{
		"lewis6991/gitsigns.nvim",
		config = true,
		event = { "BufReadPre", "BufNew" },
	},
	-- Indent lines visualized
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "UIEnter",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")
			wk.setup({
				delay = 500,
				plugins = {
					marks = false,
				},
			})
			wk.add({ "<leader>l", group = "LSP Actions" })
			wk.add({ "<leader>g", group = "Git" })
			wk.add({ "<leader>s", group = "Sessions" })
			wk.add({ "<leader>b", group = "Buffer" })
			wk.add({ "<leader>n", group = "Noice" })
			wk.add({ "'l", group = "Telescope LSP" })
		end,
	},
	-- Git blame
	{
		"FabijanZulj/blame.nvim",
		opts = {},
		keys = {
			{ "<leader>gb", "<cmd>BlameToggle virtual<CR>", desc = "Git Blame" },
		},
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
			-- Move to previous/next
			map("n", "<C-h>", "<Cmd>BufferPrevious<CR>", keyOpts("Next buffer"))
			map("n", "<C-l>", "<Cmd>BufferNext<CR>", keyOpts("Prev buffer"))

			-- Re-order to previous/next
			map("n", "<A-H>", "<Cmd>BufferMovePrevious<CR>", keyOpts("Move buffer to prev"))
			map("n", "<A-L>", "<Cmd>BufferMoveNext<CR>", keyOpts("Move buffer to next"))

			-- Goto buffer in position...
			map("n", "<C-1>", "<Cmd>BufferGoto 1<CR>", keyOpts("Go to buf 1"))
			map("n", "<C-2>", "<Cmd>BufferGoto 2<CR>", keyOpts("Go to buf 2"))
			map("n", "<C-3>", "<Cmd>BufferGoto 3<CR>", keyOpts("Go to buf 3"))
			map("n", "<C-4>", "<Cmd>BufferGoto 4<CR>", keyOpts("Go to buf 4"))
			map("n", "<C-5>", "<Cmd>BufferGoto 5<CR>", keyOpts("Go to buf 5"))
			map("n", "<C-6>", "<Cmd>BufferGoto 6<CR>", keyOpts("Go to buf 6"))
			map("n", "<C-7>", "<Cmd>BufferGoto 7<CR>", keyOpts("Go to buf 7"))
			map("n", "<C-8>", "<Cmd>BufferGoto 8<CR>", keyOpts("Go to buf 8"))
			map("n", "<C-9>", "<Cmd>BufferGoto 9<CR>", keyOpts("Go to buf 9"))
			map("n", "<C-0>", "<Cmd>BufferLast<CR>", keyOpts("Go to last buf"))

			-- Pin/unpin buffer
			map("n", "<leader>bp", "<Cmd>BufferPin<CR>", keyOpts("Pin buffer"))

			-- Close buffer
			map("n", "<C-x>", function()
				-- Get a list of all listed buffers
				local listed_buffers = vim.fn.getbufinfo({ buflisted = 1 })

				if #listed_buffers <= 1 then
					vim.cmd("quit")
				else
					vim.cmd("BufferClose")
				end
			end, keyOpts("Close buffer or quit"))

			-- Close commands
			map(
				"n",
				"<leader>bo",
				"<Cmd>BufferCloseAllButCurrentOrPinned<CR>",
				keyOpts("Close other buffer but pinned")
			)
			map("n", "<leader>bO", "<Cmd>BufferCloseAllButCurrent<CR>", keyOpts("Close all"))
			map("n", "<leader>bh", "<Cmd>BufferCloseBuffersLeft<CR>", keyOpts("Close to left"))
			map("n", "<leader>bl", "<Cmd>BufferCloseBuffersRight<CR>", keyOpts("Close to right"))
		end,
		opts = {
			animation = false,
			icons = {
				buffer_index = true,
				button = "",
				modified = { button = "" },
			},
			sidebar_filetypes = {
				NvimTree = true,
			},
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
	{
		"chrisgrieser/nvim-origami",
		event = "VeryLazy",
		opts = {},
		-- recommended: disable vim's auto-folding
		init = function()
			vim.opt.foldlevel = 99
			vim.opt.foldlevelstart = 99
		end,
	},
}
