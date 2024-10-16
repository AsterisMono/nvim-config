function generate_bufferline_mappings()
	local mappings = {}
	for i = 1, 9 do
		table.insert(mappings, {
			string.format("<A-%d>", i),
			function()
				require("bufferline").go_to(i, true)
			end,
			silent = true,
		})
	end
	return mappings
end

return {
	-- Bottom: status line
	{
		"nvim-lualine/lualine.nvim",
		event = "UIEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
			},
			extensions = { "nvim-tree" },
		},
	},
	-- Top: buffer line
	{
		"akinsho/nvim-bufferline.lua",
		event = "UIEnter",
		init = function()
			vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>")
			vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>")
			vim.keymap.set("n", "X", "<cmd>bdelete<CR>", { desc = "Close tab" })
			vim.keymap.set("n", "<leader>bx", "<cmd>BufferLinePickClose<CR>", { desc = "Pick to close" })
			vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<CR>", { desc = "Pin buffer" })
			-- bh, bl: close buffer to the left/right, bo: close all but current buffer
			vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseRight<CR>", { desc = "Close to the right" })
			vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineCloseLeft<CR>", { desc = "Close to the left" })
			vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", { desc = "Close others" })
			vim.keymap.set("n", "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<CR>", { desc = "Close unpinned" })
		end,
		opts = {
			options = {
				numbers = function(opts)
					return string.format("%s", opts.ordinal)
				end,
				always_show_bufferline = false,
				show_buffer_close_icons = false,
				show_close_icon = false,
				diagnostics = "nvim_lsp",
				color_icons = true,
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
			},
		},
		keys = generate_bufferline_mappings(),
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
			})
			wk.add({ "<leader>l", group = "LSP Actions" })
			wk.add({ "<leader>g", group = "Git" })
			wk.add({ "<leader>s", group = "Sessions" })
			wk.add({ "<leader>b", group = "Buffers" })
		end,
	},
}
