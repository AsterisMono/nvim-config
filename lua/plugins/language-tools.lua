return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					json = { "prettier" },
					html = { "prettier" },
					lua = { "stylua" },
					nix = { "nixfmt" },
					yaml = { "yamlfmt" },
					just = { "just" },
					rust = { "rustfmt" },
					markdown = { "prettier", "injected" },
				},
				default_format_opts = {
					lsp_format = "fallback",
				},
				format_on_save = {
					lsp_format = "fallback",
				},
			})

			local ts_code_actions = {
				"source.addMissingImports.ts",
				"source.fixAll.eslint",
				"source.fixAll.ts",
				"source.removeUnusedImports.ts",
			}
			-- Code actions on save
			local code_action_configs = {
				typescriptreact = ts_code_actions,
				typescript = ts_code_actions,
			}

			local fmt_group = vim.api.nvim_create_augroup("FormatConfig", { clear = true })

			vim.api.nvim_create_autocmd("BufWritePre", {
				desc = "Code actions and format on save",
				pattern = "*",
				group = fmt_group,
				callback = function(ev)
					local bufnr = ev.buf
					local ft = vim.bo[bufnr].filetype

					local ft_actions = code_action_configs[ft]
					if ft_actions then
						for _, action in ipairs(ft_actions) do
							vim.lsp.buf.code_action({
								context = { diagnostics = {}, only = { action } },
								apply = true,
							})
						end
					end
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNew" },
		config = function()
			require("nvim-treesitter").setup({
				sync_install = false,
				ensure_installed = {
					"tsx",
					"json",
					"css",
					"html",
					"lua",
					"javascript",
					"typescript",
					"markdown",
					"markdown_inline",
					"rust",
					"go",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		init = function()
			-- Disable entire built-in ftplugin mappings to avoid conflicts.
			-- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
			vim.g.no_plugin_maps = true
		end,
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					enable = true,
					lookahead = true, -- Auto jump forward for match textobj
					selection_modes = {
						["@function.outer"] = "V",
					},
					include_surrounding_whitespace = false,
				},
				move = {
					set_jumps = true,
				},
			})

			local select = require("nvim-treesitter-textobjects.select")
			vim.keymap.set({ "x", "o" }, "af", function()
				select.select_textobject("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "if", function()
				select.select_textobject("@function.inner", "textobjects")
			end)
		end,
	},
	{
		"b0o/schemastore.nvim",
		event = "InsertEnter",
	},
}
