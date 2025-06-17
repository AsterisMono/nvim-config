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
				local disabled_filetypes = { "NvimTree", "DressingInput" } -- Add extra fileypes you do not want blink enabled.
				return not vim.tbl_contains(disabled_filetypes, vim.bo.filetype)
			end,
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
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
			fuzzy = { implementation = "prefer_rust_with_warning" },
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
		opts = {
			servers = {
				lua_ls = {},
				nixd = {},
				tailwindcss = {
					cmd = { "npx", "tailwindcss-language-server", "--stdio" },
				},
				jsonls = {},
				cssls = {},
				html = {},
				eslint = {
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
				},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")

			for server, config in pairs(opts.servers) do
				-- passing config.capabilities to blink.cmp merges with the capabilities in your
				-- `opts[server].capabilities, if you've defined it
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
			-- LspAttach is where you enable features that only work
			-- if there is a language server active in the file
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local keymap_opts = { buffer = event.buf }
					local function with_desc(desc)
						return vim.tbl_extend("force", keymap_opts, { desc = desc })
					end

					vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", with_desc("Hover"))
					vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", with_desc("Go to definition"))
					vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", with_desc("Go to declaration"))
					vim.keymap.set(
						"n",
						"gi",
						"<cmd>lua vim.lsp.buf.implementation()<cr>",
						with_desc("Find implementations")
					)
					vim.keymap.set(
						"n",
						"go",
						"<cmd>lua vim.lsp.buf.type_definition()<cr>",
						with_desc("Go to type definition")
					)
					vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", with_desc("Signature help"))
					vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", with_desc("Rename"))
					vim.keymap.set(
						"n",
						"<leader>lR",
						"<cmd>lua vim.lsp.buf.references()<cr>",
						with_desc("Find references")
					)
					vim.keymap.set(
						"n",
						"<leader>la",
						"<cmd>lua vim.lsp.buf.code_action()<cr>",
						with_desc("Code actions")
					)
				end,
			})
		end,
	},
}
