return {
	"rmagatti/auto-session",
	lazy = false,
	config = function()
		require("auto-session").setup({
			allowed_dirs = { "~/Projects/*", "~/.config/nvim" },
			bypass_save_file_types = { "lazy", "neo-tree" },
			cwd_change_handling = true,
			close_filetypes_on_save = { "checkhealth", "lazy", "neo-tree" },
			session_lens = {
				picker = "telescope",
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
