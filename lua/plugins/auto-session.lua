return {
	"rmagatti/auto-session",
	lazy = false,
	config = function()
		-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
		-- 	callback = function()
		-- 		vim.defer_fn(function()
		-- 			local api = require("nvim-tree.api")
		-- 			local view = require("nvim-tree.view")

		-- 			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		-- 				local name = vim.api.nvim_buf_get_name(buf)
		-- 				if name:match("NvimTree*") then
		-- 					if not view.is_visible() then
		-- 						api.tree.toggle({ focus = false, find_file = true })
		-- 					end
		-- 					break
		-- 				end
		-- 			end
		-- 		end, 1) -- Jank defer to give lazy time to init the plugin, just 1 works for me increase as needed
		-- 	end,
		-- })
		require("auto-session").setup({
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			bypass_session_save_file_types = { "NvimTree", "lazy" },
			session_lens = {
				buftypes_to_ignore = { "NvimTree" },
				load_on_setup = false,
			},
			-- Auto create session inside git projects
			auto_create = function()
				local cmd = "git rev-parse --is-inside-work-tree"
				return vim.fn.system(cmd) == "true\n"
			end,
		})
	end,
	keys = {
		{
			"<leader>ss",
			function()
				require("auto-session").setup_session_lens()
				require("auto-session.session-lens").search_session()
			end,
			desc = "Search Session",
		},
		{ "<leader>sw", ":SessionSave<CR>", desc = "Save Session" },
		{ "<leader>sd", ":Autosession delete<CR>", desc = "Delete Session" },
	},
}
