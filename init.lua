vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

-- Preferences
-- Leader key is <Space> by mini.basics
local opts = { silent = true, noremap = true }
vim.cmd.colorscheme("miniautumn")
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.scrolloff = 10 -- Lines of context
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
})

-- mini.nvim
-- UI and basics
require("mini.icons").setup()
require("mini.basics").setup({
  options = { extra_ui = true },
  mappings = { windows = true },
})
require("mini.notify").setup()
require("mini.cmdline").setup()
require("mini.statusline").setup()
require("mini.starter").setup()
require("mini.tabline").setup()
require("mini.trailspace").setup()
require("mini.indentscope").setup({
  draw = { delay = 0 },
})
require("mini.extra").setup()
require("mini.diff").setup()

-- Buffer management
-- [b, ]b for buffer switching
require("mini.bufremove").setup()
vim.keymap.set("n", "X", function() MiniBufremove.delete() end, opts)

-- Picker (Telescope alternative)
require("mini.pick").setup()
vim.keymap.set("n", "<leader>f", function() MiniPick.builtin.files() end, opts)
vim.keymap.set("n", "<leader>r", function() MiniPick.builtin.grep_live() end, opts)
vim.keymap.set("n", "<leader>b", function() MiniPick.builtin.buffers() end, opts)
vim.keymap.set("n", "<leader>R", function() MiniPick.builtin.resume() end, opts)
vim.keymap.set("n", "<leader>d", function() MiniExtra.pickers.diagnostic() end, opts)
vim.keymap.set("n", "<leader>gh", function() MiniExtra.pickers.git_hunks() end, opts)

-- File explorer (Yazi)
vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim" })
vim.pack.add({ "https://github.com/mikavilpas/yazi.nvim" })
vim.g.loaded_netrwPlugin = 1 -- mark netrw as loaded so it's not loaded at all.
vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    require("yazi").setup({
      open_for_directories = true,
    })
  end,
})
vim.keymap.set("n", "<leader>F", function() require("yazi").yazi() end, opts)

-- Text editing
require("mini.ai").setup()
require("mini.comment").setup()
require("mini.pairs").setup()
require("mini.bracketed").setup()
require("mini.jump").setup()

-- Completion
require("mini.completion").setup()

-- M-h, M-l, M-j, M-k. Available in visual and normal modes
require("mini.move").setup()

-- Session management
require("mini.sessions").setup({
  autoread = true,
})
vim.keymap.set("n", "<leader>sw", function() MiniSessions.write() end, opts)
vim.keymap.set("n", "<leader>ss", function() MiniSessions.select() end, opts)
vim.keymap.set("n", "<leader>sR", function() MiniSessions.restart() end, opts)

-- Flash.nvim
vim.pack.add({ "https://github.com/folke/flash.nvim" })
require("flash").setup({ modes = { char = { jumplabels = true } } })
vim.keymap.set("n", "s", function() require("flash").jump() end, opts)
vim.keymap.set("o", "r", function() require("flash").remote() end, opts)

-- LSP
vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })
vim.lsp.enable({ "lua_ls", "nixd", "rust_analyzer", "gopls", "html", "hls", "yamlls" })

-- Treesitter
vim.pack.add({ "https://github.com/romus204/tree-sitter-manager.nvim" })
require("tree-sitter-manager").setup({
  ensure_installed = { "lua", "nix", "rust", "go", "html", "haskell", "yaml" },
})

-- Conform.nvim (Formatter)
vim.pack.add({ "https://github.com/stevearc/conform.nvim" })
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    nix = { "nixfmt" },
    rust = { "rustfmt" },
    go = { "gofmt" },
    html = { "prettier" },
    haskell = { "ormolu" },
    yaml = { "yamlfmt" },
    json = { "prettier" },
  },
  format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
})

-- Lazygit Integration
vim.pack.add({ "https://github.com/kdheepak/lazygit.nvim" })
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", opts)

-- LLM Workflow
vim.pack.add({ "https://github.com/ThePrimeagen/99" })
local _99 = require("99")
_99.setup({
  tmp_dir = "./.tmp",
  provider = _99.Providers.ClaudeCodeProvider,
  model = "claude-sonnet-4-6",
})
vim.keymap.set("v", "<leader>9v", function() _99.visual() end, opts)
vim.keymap.set("n", "<leader>9s", function() _99.search() end, opts)
vim.keymap.set("n", "<leader>9x", function() _99.stop_all_requests() end, opts)
