return {
  'VonHeikemen/lsp-zero.nvim',
  cond = not vim.g.vscode,
  branch = 'v3.x',
  lazy = true,
  config = false,
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required
    {
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
      lazy = false,
      config = true,
    },
    { 'williamboman/mason-lspconfig.nvim' },

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },             -- Required
    { 'hrsh7th/cmp-buffer' },           -- Recommended
    { 'hrsh7th/cmp-path' },             -- Recommended
    { 'hrsh7th/cmp-nvim-lsp' },         -- Required
    { 'saadparwaiz1/cmp_luasnip' },     -- Recommended
    { "rafamadriz/friendly-snippets" }, -- Snippets
    { 'L3MON4D3/LuaSnip' },             -- Required
    { 'onsails/lspkind.nvim' },         -- Beautify
  },
  init = function()
    -- Disable automatic setup, we are doing it manually
    vim.g.lsp_zero_extend_cmp = 0
    vim.g.lsp_zero_extend_lspconfig = 0
  end,
}
