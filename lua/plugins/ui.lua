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
			wk.add({ "<leader>t", group = "Tabs" })
			wk.add({ "<leader>a", group = "Avante" })
			wk.add({ "'g", group = "Telescope Git" })
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
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			file_types = { "markdown", "Avante" },
		},
		ft = { "markdown", "Avante" },
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
		"akinsho/toggleterm.nvim",
		version = "*",
		init = function()
			vim.api.nvim_create_autocmd("ExitPre", {
				callback = function()
					for _, buf in ipairs(vim.api.nvim_list_bufs()) do
						if vim.bo[buf].buftype == "terminal" and vim.api.nvim_buf_is_loaded(buf) then
							vim.api.nvim_buf_delete(buf, { force = true })
						end
					end
				end,
			})
			local highlights = require("rose-pine.plugins.toggleterm")
			require("toggleterm").setup({
				open_mapping = "<C-`>",
				insert_mappings = true,
				terminal_mappings = true,
				highlights = highlights,
			})
			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
				vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
			end
			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		end,
	},
	{
		"nanozuki/tabby.nvim",
		init = function()
			vim.o.showtabline = 2
		end,
		config = function()
			local theme = {
				fill = "TabLineFill",
				head = "TabLine",
				current_tab = "TabLineSel",
				tab = "TabLine",
				win = "TabLine",
				current_win = { style = "bold" },
				tail = "TabLine",
			}
			local modified_symbol = ""

			local function buf_modified(buf)
				if vim.bo[buf].modified then
					return modified_symbol
				else
					return ""
				end
			end

			local function tab_modified(tab)
				local wins = require("tabby.module.api").get_tab_wins(tab)
				for _, x in pairs(wins) do
					if vim.bo[vim.api.nvim_win_get_buf(x)].modified then
						return modified_symbol
					end
				end
				return ""
			end
			vim.api.nvim_set_keymap("n", "<leader>tn", ":$tabnew<CR>", { desc = "New tab", noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab", noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { desc = "Close other tabs", noremap = true })
			-- move current tab to previous position
			vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>", { desc = "Move tab to next", noremap = true })
			-- move current tab to next position
			vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>", { desc = "Move tab to prev", noremap = true })
			for i = 1, 9 do
				vim.keymap.set("n", "<A-" .. i .. ">", function()
					vim.cmd(i .. "tabnext")
				end)
			end
			require("tabby").setup({
				line = function(line)
					return {
						{
							{ " 󱄅 ", hl = theme.head },
							line.sep(" ", theme.head, theme.fill),
						},
						line.tabs().foreach(function(tab)
							local hl = tab.is_current() and theme.current_tab or theme.tab
							return {
								-- line.sep("", hl, theme.fill),
								tab.number(),
								tab.name(),
								tab_modified(tab.id),
								-- line.sep("", hl, theme.fill),
								hl = hl,
								margin = " ",
							}
						end),
						line.spacer(),
						line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
							local hl = win.is_current() and theme.current_win or theme.win
							return {
								-- line.sep("", theme.win, theme.fill),
								{
									win.buf_name(),
									hl = hl,
								},
								buf_modified(win.buf().id),
								-- line.sep("", theme.win, theme.fill),
								-- hl = theme.win,
								margin = " ",
							}
						end),
						{
							line.sep(" ", theme.tail, theme.fill),
							{ "  ", hl = theme.tail },
						},
						hl = theme.fill,
					}
				end,
			})
		end,
	},
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true },
		},
		keys = {
			-- 👇 in this section, choose your own keymappings!
			{
				"'F",
				mode = { "n", "v" },
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
			{
				-- Open in the current working directory
				"<leader>y",
				"<cmd>Yazi cwd<cr>",
				desc = "Yazi",
			},
		},
		---@type YaziConfig | {}
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,
			keymaps = {
				show_help = "<f1>",
			},
		},
		-- 👇 if you use `open_for_directories=true`, this is recommended
		init = function()
			-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
			-- vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
	},
}
