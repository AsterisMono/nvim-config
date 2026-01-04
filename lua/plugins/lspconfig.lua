return {
	-- Autocompletion
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		build = "nix run .#build-plugin",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			enabled = function()
				local disabled_filetypes = { "NvimTree", "DressingInput", "neo-tree" } -- Add extra fileypes you do not want blink enabled.
				return not vim.tbl_contains(disabled_filetypes, vim.bo.filetype)
			end,
			keymap = {
				preset = "super-tab",
				["<C-e>"] = { "show_documentation", "hide_documentation" },
				["<CR>"] = {
					function(cmp)
						if cmp.snippet_active() then
							return cmp.accept()
						else
							return cmp.select_and_accept()
						end
					end,
					"snippet_forward",
					"fallback",
				},
			},

			signature = {
				enabled = true,
				window = {
					show_documentation = true,
				},
			},

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			-- (Default) Only show the documentation popup when manually triggered
			completion = {
				-- Show documentation when selecting a completion item
				documentation = { auto_show = true, auto_show_delay_ms = 500 },
				list = {
					selection = {
						auto_insert = false,
					},
				},
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = {
				implementation = "prefer_rust_with_warning",
				sorts = {
					function(a, b)
						if (a.client_name == nil or b.client_name == nil) or (a.client_name == b.client_name) then
							return
						end
						return b.client_name == "emmet-language-server"
					end,
					-- default sorts
					"score",
					"sort_text",
				},
			},
		},
		opts_extend = { "sources.default" },
		config = function(_, opts)
			local cmp = require("blink.cmp")
			cmp.setup(opts)
			-- Show signature help after completion
			vim.api.nvim_create_autocmd("User", {
				pattern = "BlinkCmpAccept",
				callback = function(ev)
					local item = ev.data.item
					if item.kind == require("blink.cmp.types").CompletionItemKind.Function then
						vim.defer_fn(function()
							require("blink.cmp").show_signature()
						end, 10)
					end
				end,
			})
		end,
	},
	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = "LspInfo",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.lsp.config("emmet-language-server", {
				cmd = { "bunx", "emmet-language-server", "--stdio" },
			})
			vim.lsp.config("tailwindcss", {
				cmd = { "bunx", "tailwindcss-language-server", "--stdio" },
			})
			vim.lsp.config("jsonls", {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})
			vim.lsp.config("yamlls", {
				settings = {
					yaml = {
						schemaStore = {
							enable = false,
							url = "",
						},
						schemas = require("schemastore").yaml.schemas(),
					},
				},
			})
			vim.lsp.config("eslint", {
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
			vim.lsp.config("vtsls", {
				cmd = { "bunx", "@vtsls/language-server", "--stdio" },
				on_attach = function(client, _)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			})
			vim.lsp.config("gh_actions_ls", {
				cmd = { "bunx", "gh-actions-language-server", "--stdio" },
			})
			vim.lsp.config("dockerls", {
				cmd = { "bunx", "docker-langserver", "--stdio" },
			})
			vim.lsp.config("astro", {
				cmd = { "bunx", "astro-ls", "--stdio" },
			})
			vim.lsp.enable({
				"lua_ls",
				"nixd",
				"tailwindcss",
				"jsonls",
				"yamlls",
				"cssls",
				"html",
				"eslint",
				"vtsls",
				"rust_analyzer",
				"gopls",
				"dockerls",
				"emmet-language-server",
			})
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local keymap_opts = { buffer = event.buf }
					local function with_desc(desc)
						return vim.tbl_extend("force", keymap_opts, { desc = desc })
					end

					vim.keymap.set("n", "K", function()
						vim.lsp.buf.hover()
					end, with_desc("Hover"))
					vim.keymap.set("n", "gd", function()
						vim.lsp.buf.definition()
					end, with_desc("Go to definition"))
					vim.keymap.set("n", "go", function()
						vim.lsp.buf.type_definition()
					end, with_desc("Go to type definition"))
					vim.keymap.set("n", "gs", function()
						vim.lsp.buf.signature_help()
					end, with_desc("Signature help"))
					-- vim.keymap.set("n", "<leader>lr", function()
					-- 	vim.lsp.buf.rename()
					-- end, with_desc("Rename"))
					vim.keymap.set("n", "<leader>la", function()
						vim.lsp.buf.code_action()
					end, with_desc("Code actions"))
				end,
			})
		end,
	},
}
