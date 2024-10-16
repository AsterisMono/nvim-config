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
				tsserver_locale = "zh_cn",
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
}
