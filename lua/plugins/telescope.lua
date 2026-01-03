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
			{ "'j", "<cmd>Telescope jumplist<CR>", desc = "Jumplist" },
			{ "'lr", "<cmd>Telescope lsp_references<CR>", desc = "LSP references" },
			{ "'d", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
			{ "'D", "<cmd>Telescope diagnostics bufnr=0<CR>", desc = "Buffer diagnostics" },
			{ "'o", "<cmd>Telescope oldfiles<CR>", desc = "Oldfiles" },
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
		end,
	},
}
