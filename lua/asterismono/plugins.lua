require('packer').startup(function(use)
  -- Utility
  use 'wbthomason/packer.nvim' -- Package manager
  use 'nvim-lua/plenary.nvim' -- Common utilities

  -- LSP and highlighting
  -- use 'neovim/nvim-lspconfig' -- LSP
  -- use 'williamboman/mason.nvim' -- LSP package autoinstall
  -- use 'williamboman/mason-lspconfig.nvim'
  -- use 'glepnir/lspsaga.nvim' -- LSP UIs
  -- use 'jose-elias-alvarez/null-ls.nvim' -- Inject LSP diagnostics
  -- use 'ray-x/lsp_signature.nvim' -- Function signature and document hover
  -- use {
  --   'nvim-treesitter/nvim-treesitter',
  --   run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  -- } -- Highlighting

  -- Auto completion
  -- use 'hrsh7th/nvim-cmp'
  -- use 'hrsh7th/cmp-nvim-lsp'
  -- use 'hrsh7th/cmp-path'
  -- use 'saadparwaiz1/cmp_luasnip'
  -- use 'L3MON4D3/LuaSnip'
  -- use 'aca/emmet-ls' -- Smart HTML completion

  -- Coc framework



  -- Finger efficiency
  use 'tpope/vim-surround'
  use { 'justinmk/vim-sneak', config = require('asterismono.plugin-rc.vim-sneak-rc') }
  use 'vim-scripts/ReplaceWithRegister'
  use 'tpope/vim-commentary'
  use { 'phaazon/hop.nvim', config = require('asterismono.plugin-rc.gitsigns-rc') }
  use 'wellle/targets.vim'
  use { 'chentoast/marks.nvim', config = require('asterismono.plugin-rc.marks-nvim-rc') }
  use { 'mizlan/iswap.nvim', config = require('asterismono.plugin-rc.iswap-rc') }

  -- Smarter editor
  use { 'windwp/nvim-autopairs', config = require('asterismono.plugin-rc.nvim-autopairs') } -- Auto pair brackets
  use 'jghauser/mkdir.nvim' -- Auto mkdir
  use { 'AckslD/nvim-neoclip.lua', config = require('asterismono.plugin-rc.nvim-neoclip-rc') } -- Smart clipboard
  use 'mg979/vim-visual-multi' -- Multi cursor
  use 'amadeus/vim-convert-color-to' -- Color code converter
  use { 'yamatsum/nvim-cursorline', config = require('asterismono.plugin-rc.nvim-cursorline-rc') } -- Word underline
  use { 'linty-org/key-menu.nvim', config = require('asterismono.plugin-rc.key-menu-rc') } -- Key suggestion

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', config = require('asterismono.plugin-rc.telescope-rc') }

  -- UI components
  use { 'akinsho/nvim-bufferline.lua', config = require('asterismono.plugin-rc.bufferline-rc') } -- Tabline
  use { 'kyazdani42/nvim-web-devicons', config = require('asterismono.plugin-rc.nvim-web-devicons-rc') } -- File icons
  use 'onsails/lspkind.nvim' -- Auto complete icons
  use { 'lewis6991/gitsigns.nvim', config = require('asterismono.plugin-rc.gitsigns-rc') } -- Git status line
  use { 'norcalli/nvim-colorizer.lua', config = require('asterismono.plugin-rc.nvim-colorizer-rc') } -- Color code highlighter
  use { 'nvim-tree/nvim-tree.lua', config = require('asterismono.plugin-rc.nvim-tree-rc') } -- Tree-style file explorer
  use { 'nvim-lualine/lualine.nvim', config = require('asterismono.plugin-rc.lualine-rc') } -- Status line
  use { 'kdheepak/lazygit.nvim', config = require('asterismono.plugin-rc.lazygit-rc') } -- Lazygit interface
  use { 'lukas-reineke/indent-blankline.nvim', config = require('asterismono.plugin-rc.indent-blankline-rc') } -- Indent lines

  -- Color schemes
  use 'sainnhe/everforest'

  -- Development tools
  use 'manzeloth/live-server'

  -- Miscellaneous
  use 'wakatime/vim-wakatime' -- Coding time stats
end)
