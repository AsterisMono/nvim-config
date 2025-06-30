return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		version = false,
		keys = {
			{ "'f", "<cmd>Telescope find_files<CR>", desc = "Find files" },
			{ "'r", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
			{ "'R", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Grep in current file" },
			{ "'b", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
			{ "'e", "<cmd>Telescope resume<CR>", desc = "Resume" },
			{ "'gb", "<cmd>Telescope git_branches<CR>", desc = "Git branches" },
			{ "'gc", "<cmd>Telescope git_commits<CR>", desc = "Git commits" },
			{ "'gs", "<cmd>Telescope git_status<CR>", desc = "Git status" },
			{ "'j", "<cmd>Telescope jumplist<CR>", desc = "Jumplist" },
			{ "'lr", "<cmd>Telescope lsp_references<CR>", desc = "LSP references" },
			{ "'d", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
			{ "'D", "<cmd>Telescope diagnostics bufnr=0<CR>", desc = "Buffer diagnostics" },
			{ "'o", "<cmd>Telescope oldfiles<CR>", desc = "Oldfiles" },
			{ "'J", "<cmd>Telescope just<CR>", desc = "Just" },
			{ "'t", "<cmd>Telescope telescope-tabs list_tabs<CR>", desc = "Tabs" },
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<Esc>"] = actions.close,
						},
						n = {
							["q"] = actions.close,
						},
					},
				},
				pickers = {
					buffers = {
						mappings = {
							i = {
								["<c-d>"] = actions.delete_buffer + actions.move_to_top,
							},
						},
					},
				},
				extensions = {
					file_browser = {
						hijack_netrw = true,
					},
					just = {
						action = function(command)
							vim.cmd('TermExec cmd="' .. command .. '"')
						end,
					},
				},
			})
			telescope.load_extension("file_browser")
			telescope.load_extension("just")
			telescope.load_extension("telescope-tabs")
		end,
	},
	{
		url = "https://codeberg.org/elfahor/telescope-just.nvim",
		lazy = true,
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"LukasPietzschmann/telescope-tabs",
		lazy = true,
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			entry_formatter = function(tab_id, buffer_ids, file_names, file_paths, is_current)
				local tab_name = require("tabby.feature.tab_name").get(tab_id)
				return string.format("%d: %s%s", tab_id, tab_name, is_current and " <" or "")
			end,
			entry_ordinal = function(tab_id, buffer_ids, file_names, file_paths, is_current)
				return require("tabby.feature.tab_name").get(tab_id)
			end,
		},
	},
}
