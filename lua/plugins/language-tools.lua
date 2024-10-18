return {
	{
		"pmizio/typescript-tools.nvim",
		ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {
			on_attach = function(client, bufnr)
				-- Disable tsserver formatting, we're rolling biome/prettier
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
				typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
				javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
				lua = { "stylua" },
				nix = { "nixpkgs_fmt" },
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
	-- Code linter (not in use)
	-- nvim-lint only provides linting injection (no code actions).
	-- See `lspconfig.lua` for linting injected into LSP
	-- {
	-- 	"mfussenegger/nvim-lint",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	config = function()
	-- 		require("lint").linters_by_ft = {
	-- 			typescript = { "biomejs" },
	-- 			javascript = { "biomejs" },
	-- 			typescriptreact = { "biomejs" },
	-- 			javascriptreact = { "biomejs" },
	-- 		}
	-- 		vim.api.nvim_create_autocmd({ "InsertLeave", "BufReadPost" }, {
	-- 			pattern = "*",
	-- 			callback = function()
	-- 				require("lint").try_lint()
	-- 			end,
	-- 		})
	-- 	end,
	-- },
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNew" },
		opts = {
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
				enable = not vim.g.vscode,
				additional_vim_regex_highlighting = false,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					node_incremental = "<CR>",
					node_decremental = "<BS>",
				},
			},
		},
		config = function(opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = { "BufReadPre", "BufNew" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
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
}
