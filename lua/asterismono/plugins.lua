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
	use 'ms-jpq/coq_nvim' -- Fast as FUCK completion

  -- Finger efficiency
  use 'tpope/vim-surround'
  use 'justinmk/vim-sneak'
  use 'vim-scripts/ReplaceWithRegister'
  use 'tpope/vim-commentary'
  use 'phaazon/hop.nvim'
  
  -- Smarter editor
  use 'windwp/nvim-autopairs' -- Auto pair brackets
  use 'windwp/nvim-ts-autotag' -- Auto close HTML tags in TS
  use 'mattn/emmet-vim' -- Smart HTML completion
  use 'jghauser/mkdir.nvim' -- Auto mkdir

  -- Telescope
  use 'nvim-telescope/telescope.nvim'

  -- UI components
  use 'akinsho/nvim-bufferline.lua' -- Tabline
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'lewis6991/gitsigns.nvim' -- Git status line
  use 'chentoast/marks.nvim' -- Vim marks visualized
  use 'norcalli/nvim-colorizer.lua' -- Color code highlighter

  -- Color schemes
  use 'sainnhe/everforest'

  -- Development tools
  use 'manzeloth/live-server'
  use 'dinhhuy258/git.nvim'

  -- Miscellaneous
  use 'wakatime/vim-wakatime' -- Coding time stats
end)
