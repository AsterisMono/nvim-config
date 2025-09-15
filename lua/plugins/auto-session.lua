return {
	"rmagatti/auto-session",
	lazy = false,
	config = function()
		require("auto-session").setup({
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			bypass_session_save_file_types = { "NvimTree", "lazy" },
			session_lens = {
				picker = "telescope",
				buftypes_to_ignore = { "NvimTree" },
				load_on_setup = false,
			},
			-- Auto create session inside git projects
			auto_create = function()
				local cmd = "git rev-parse --is-inside-work-tree"
				return vim.fn.system(cmd) == "true\n"
			end,
			pre_save_cmds = {
				function()
					vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
				end,
			},
		})
	end,
	keys = {
		{ "<leader>ss", ":AutoSession search<CR>", desc = "Search Session" },
		{ "<leader>sw", ":AutoSession save<CR>", desc = "Save Session" },
		{ "<leader>sd", ":AutoSession delete<CR>", desc = "Delete Session" },
	},
}
