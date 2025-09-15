local keyOpts = { noremap = true, silent = true }
return {
	-- Bottom: status line
	{
		"nvim-lualine/lualine.nvim",
		event = "UIEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "nord",
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
			require("toggleterm").setup({
				open_mapping = "<C-`>",
				insert_mappings = true,
				terminal_mappings = true,
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
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
			local map = vim.api.nvim_set_keymap
			-- Move to previous/next
			map("n", "H", "<Cmd>BufferPrevious<CR>", keyOpts)
			map("n", "L", "<Cmd>BufferNext<CR>", keyOpts)

			-- Re-order to previous/next
			map("n", "<A-H>", "<Cmd>BufferMovePrevious<CR>", keyOpts)
			map("n", "<A-L>", "<Cmd>BufferMoveNext<CR>", keyOpts)

			-- Goto buffer in position...
			map("n", "<C-1>", "<Cmd>BufferGoto 1<CR>", keyOpts)
			map("n", "<C-2>", "<Cmd>BufferGoto 2<CR>", keyOpts)
			map("n", "<C-3>", "<Cmd>BufferGoto 3<CR>", keyOpts)
			map("n", "<C-4>", "<Cmd>BufferGoto 4<CR>", keyOpts)
			map("n", "<C-5>", "<Cmd>BufferGoto 5<CR>", keyOpts)
			map("n", "<C-6>", "<Cmd>BufferGoto 6<CR>", keyOpts)
			map("n", "<C-7>", "<Cmd>BufferGoto 7<CR>", keyOpts)
			map("n", "<C-8>", "<Cmd>BufferGoto 8<CR>", keyOpts)
			map("n", "<C-9>", "<Cmd>BufferGoto 9<CR>", keyOpts)
			map("n", "<C-0>", "<Cmd>BufferLast<CR>", keyOpts)

			-- Pin/unpin buffer
			map("n", "<leader>bp", "<Cmd>BufferPin<CR>", keyOpts)

			-- Close buffer
			map("n", "X", "<Cmd>BufferClose<CR>", keyOpts)

			-- Close commands
			map("n", "<leader>bo", "<Cmd>BufferCloseAllButCurrentOrPinned<CR>", keyOpts)
			map("n", "<leader>bO", "<Cmd>BufferCloseAllButCurrent<CR>", keyOpts)
			map("n", "<leader>bh", "<Cmd>BufferCloseBuffersLeft<CR>", keyOpts)
			map("n", "<leader>bl", "<Cmd>BufferCloseBuffersRight<CR>", keyOpts)
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
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		config = function()
			local api = require("nvim-tree.api")
			local function edit_or_open()
				local node = api.tree.get_node_under_cursor()

				if node.nodes ~= nil then
					-- expand or collapse folder
					api.node.open.edit()
				else
					-- open file
					api.node.open.edit()
					-- Close the tree if file was opened
					api.tree.close()
				end
			end

			-- open as vsplit on current node
			local function open_bg()
				local node = api.tree.get_node_under_cursor()

				if node.nodes ~= nil then
					-- expand or collapse folder
					api.node.open.edit()
				else
					-- open file to buffer list
					api.node.open.edit()
				end

				-- Finally refocus on tree if it was lost
				api.tree.focus()
			end
			require("nvim-tree").setup({
				hijack_cursor = true,
				sync_root_with_cwd = true,
				respect_buf_cwd = true,
				actions = {
					open_file = {
						quit_on_open = true,
					},
				},
				on_attach = function(bufnr)
					local function opts(desc)
						return {
							desc = "nvim-tree: " .. desc,
							buffer = bufnr,
							noremap = true,
							silent = true,
							nowait = true,
						}
					end
					api.config.mappings.default_on_attach(bufnr)
					-- on_attach
					vim.keymap.set("n", "l", edit_or_open, opts("Edit Or Open"))
					vim.keymap.set("n", "L", open_bg, opts("Open in new tab"))
					vim.keymap.set("n", "h", api.tree.close, opts("Close"))
					vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
				end,
			})
		end,
		keys = {
			{ "<C-'>", "<Cmd>NvimTreeToggle<CR>", keyOpts },
			{ "'F", "<Cmd>NvimTreeFindFile<CR>", keyOpts },
		},
	},
}
