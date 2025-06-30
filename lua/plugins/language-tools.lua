return {
	{
		"pmizio/typescript-tools.nvim",
		ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {
			on_attach = function(client, bufnr)
				-- Disable tsserver formatting, we're rolling eslint/prettier
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,
			settings = {
				tsserver_locale = "zh-cn",
			},
		},
	},
	-- Conform.nvim for code formatting
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			formatters_by_ft = {
				-- LSP formatter in ts/js/tsx/jsx is ESLint.
				-- lsp_format = "first": ESLint, then prettier
				typescript = { "prettier", lsp_format = "first" },
				javascript = { "prettier", lsp_format = "first" },
				typescriptreact = { "prettier", lsp_format = "first" },
				javascriptreact = { "prettier", lsp_format = "first" },
				json = { "prettier", lsp_format = "first" },
				html = { "prettier", lsp_format = "first" },
				lua = { "stylua" },
				nix = { "nixfmt" },
				rust = { "rustfmt", lsp_format = "fallback" },
			},
			format_on_save = { timeout_ms = 500 },
		},
		init = function()
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNew" },
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		config = function()
			require("nvim-treesitter.configs").setup({
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
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Auto jump forward for match textobj
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
						},
						selection_modes = {
							["@function.outer"] = "v", -- charwise selection for functions
						},
						include_surrounding_whitespace = true,
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]f"] = "@function.outer",
							["]c"] = "@class.outer",
							["]]"] = "@block.outer",
						},
						goto_previous_start = {
							["[f"] = "@function.outer",
							["[c"] = "@class.outer",
							["[["] = "@block.outer",
						},
					},
				},
			})
		end,
	},
	-- tailwind-tools.lua
	{
		"luckasRanarison/tailwind-tools.nvim",
		ft = { "typescriptreact", "javascriptreact", "html" },
		name = "tailwind-tools",
		build = ":UpdateRemotePlugins",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			server = { override = false },
		}, -- your configuration
	},
	-- rust
	{
		"mrcjkb/rustaceanvim",
		version = "^6",
		lazy = false,
		init = function()
			vim.g.rustaceanvim = {
				server = {
					default_settings = {
						["rust-analyzer"] = {
							files = {
								exclude = { ".direnv", ".devenv", "node_modules" },
							},
						},
					},
				},
			}
		end,
	},
	{
		"b0o/schemastore.nvim",
		event = "InsertEnter",
	},
}
