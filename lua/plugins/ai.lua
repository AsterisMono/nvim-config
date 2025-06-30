return {
	{
		"yetone/avante.nvim",
		build = "make",
		event = "VeryLazy",
		version = false, -- Never set this value to "*"! Never!
		---@module 'avante'
		---@type avante.Config
		opts = {
			provider = "gemini",
			input = {
				provider = "dressing",
				provider_opts = {},
			},
			highlights = {
				---@type AvanteConflictHighlights
				diff = {
					current = "DiffText",
					incoming = "DiffAdd",
				},
			},
		},
		keys = {
			{
				"<leader>aF",
				function()
					local avante_add_files = function(files)
						local sidebar = require("avante").get()

						local open = sidebar:is_open()

						if not open then
							require("avante.api").ask()
							sidebar = require("avante").get()
						end

						for _, filepath in pairs(files) do
							local relative_path = require("avante.utils").relative_path(filepath)
							sidebar.file_selector:add_selected_file(relative_path)
						end
					end
					require("yazi").yazi({
						hooks = {
							yazi_opened_multiple_files = function(chosen_files, config, state)
								avante_add_files(chosen_files)
							end,
						},
					})
				end,
				desc = "avante: add files via yazi",
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			{
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
					},
				},
			},
		},
	},
}
