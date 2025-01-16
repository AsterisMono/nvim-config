return {
	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "onsails/lspkind.nvim" },
		},
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			local tailwind = require("tailwind-tools.cmp")

			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "text",
						before = tailwind.lspkind_format,
					}),
				},
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = "select" }),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
				}),
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				-- Pre select first item
				preselect = "item",
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
			})
		end,
	},
	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = "LspInfo",
		event = { "BufReadPre", "BufNewFile" },
		init = function()
			-- Reserve a space in the gutter
			-- This will avoid an annoying layout shift in the screen
			vim.opt.signcolumn = "yes"
		end,
		config = function()
			local lsp_defaults = require("lspconfig").util.default_config

			-- Add cmp_nvim_lsp capabilities settings to lspconfig
			-- This should be executed before you configure any language server
			lsp_defaults.capabilities =
				vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- LspAttach is where you enable features that only work
			-- if there is a language server active in the file
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
					vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
					vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
					vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
					vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
					vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
					vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
					vim.keymap.set("n", "<leader>lR", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
					vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
				end,
			})
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({})
			lspconfig.nixd.setup({})
			lspconfig.tailwindcss.setup({
				cmd = { "npx", "tailwindcss-language-server", "--stdio" },
			})

			-- vscode-langservers-extracted
			lspconfig.jsonls.setup({})
			lspconfig.cssls.setup({})
			lspconfig.html.setup({})

			-- Enable ESLint. LSP format is handled by Conform.nvim.
			lspconfig.eslint.setup({
				filetypes = {
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"vue",
					"html",
					"markdown",
					"json",
					"jsonc",
					"yaml",
					"toml",
					"xml",
					"gql",
					"graphql",
					"astro",
					"svelte",
					"css",
					"less",
					"scss",
					"pcss",
					"postcss",
				},
				settings = {
					rulesCustomizations = {
						{ rule = "style/*", severity = "off", fixable = true },
						{ rule = "format/*", severity = "off", fixable = true },
						{ rule = "*-indent", severity = "off", fixable = true },
						{ rule = "*-spacing", severity = "off", fixable = true },
						{ rule = "*-spaces", severity = "off", fixable = true },
						{ rule = "*-order", severity = "off", fixable = true },
						{ rule = "*-dangle", severity = "off", fixable = true },
						{ rule = "*-newline", severity = "off", fixable = true },
						{ rule = "*quotes", severity = "off", fixable = true },
						{ rule = "*semi", severity = "off", fixable = true },
					},
				},
			})
		end,
	},
}
