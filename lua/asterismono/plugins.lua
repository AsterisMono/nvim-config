require('packer').startup(function(use)
  -- Utility
  use 'wbthomason/packer.nvim' -- Package manager
  use 'nvim-lua/plenary.nvim' -- Common utilities

  -- LSP and highlighting
  use 'neovim/nvim-lspconfig' -- LSP
  use 'williamboman/mason.nvim' -- LSP package autoinstall
  use 'williamboman/mason-lspconfig.nvim'
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'jose-elias-alvarez/null-ls.nvim' -- Inject LSP diagnostics
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  } -- Highlighting

  -- Auto completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'

  -- Finger efficiency
  use 'tpope/vim-surround'
  use 'justinmk/vim-sneak'
  use 'vim-scripts/ReplaceWithRegister'
  use 'tpope/vim-commentary'
  use 'phaazon/hop.nvim'
  use 'wellle/targets.vim'

  -- Smarter editor
  use 'windwp/nvim-autopairs' -- Auto pair brackets
  use 'aca/emmet-ls' -- Smart HTML completion
  use 'jghauser/mkdir.nvim' -- Auto mkdir
  use 'AckslD/nvim-neoclip.lua' -- Smart clipboard
  use 'mg979/vim-visual-multi' -- Multi cursor
  use 'amadeus/vim-convert-color-to' -- Color code converter

  -- Telescope
  use 'nvim-telescope/telescope.nvim'

  -- UI components
  use 'akinsho/nvim-bufferline.lua' -- Tabline
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'lewis6991/gitsigns.nvim' -- Git status line
  use 'norcalli/nvim-colorizer.lua' -- Color code highlighter
  use 'nvim-tree/nvim-tree.lua' -- Tree-style file explorer
  use 'nvim-lualine/lualine.nvim' -- Status line

  -- Color schemes
  use 'sainnhe/everforest'

  -- Development tools
  use 'manzeloth/live-server'

  -- Miscellaneous
  use 'wakatime/vim-wakatime' -- Coding time stats
end)
