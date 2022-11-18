require('packer').startup(function(use)
  -- Utility
  use 'wbthomason/packer.nvim' -- Package manager
  use 'nvim-lua/plenary.nvim' -- Common utilities

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = function()
      require('asterismono.plugin-rc.nvim-treesitter-rc')
    end
  } -- Highlighting

  -- Coc framework
  use { 'neoclide/coc.nvim', branch = 'release' }

  -- Finger efficiency
  use 'tpope/vim-surround'
  use { 'justinmk/vim-sneak', config = function() require('asterismono.plugin-rc.vim-sneak-rc') end }
  use 'vim-scripts/ReplaceWithRegister'
  use 'tpope/vim-commentary'
  use { 'phaazon/hop.nvim', config = function() require('asterismono.plugin-rc.hop-rc') end }
  use 'wellle/targets.vim'
  use { 'chentoast/marks.nvim', config = function() require('asterismono.plugin-rc.marks-nvim-rc') end }
  use { 'mizlan/iswap.nvim', config = function() require('asterismono.plugin-rc.iswap-rc') end }

  -- Smarter editor
  use { 'windwp/nvim-autopairs', config = function() require('asterismono.plugin-rc.nvim-autopairs') end } -- Auto pair brackets
  use 'jghauser/mkdir.nvim' -- Auto mkdir
  use { 'AckslD/nvim-neoclip.lua', config = function() require('asterismono.plugin-rc.nvim-neoclip-rc') end } -- Smart clipboard
  use 'mg979/vim-visual-multi' -- Multi cursor
  use 'amadeus/vim-convert-color-to' -- Color code converter
  use { 'yamatsum/nvim-cursorline', config = function() require('asterismono.plugin-rc.nvim-cursorline-rc') end } -- Word underline
  use { 'linty-org/key-menu.nvim', config = function() require('asterismono.plugin-rc.key-menu-rc') end } -- Key suggestion

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', config = function() require('asterismono.plugin-rc.telescope-rc') end }

  -- UI components
  use { 'akinsho/nvim-bufferline.lua', config = function() require('asterismono.plugin-rc.bufferline-rc') end } -- Tabline
  use { 'kyazdani42/nvim-web-devicons', config = function() require('asterismono.plugin-rc.nvim-web-devicons-rc') end } -- File icons
  use 'onsails/lspkind.nvim' -- Auto complete icons
  use { 'lewis6991/gitsigns.nvim', config = function() require('asterismono.plugin-rc.gitsigns-rc') end } -- Git status line
  use { 'norcalli/nvim-colorizer.lua', config = function() require('asterismono.plugin-rc.nvim-colorizer-rc') end } -- Color code highlighter
  use { 'nvim-tree/nvim-tree.lua', config = function() require('asterismono.plugin-rc.nvim-tree-rc') end } -- Tree-style file explorer
  use { 'nvim-lualine/lualine.nvim', config = function() require('asterismono.plugin-rc.lualine-rc') end } -- Status line
  use { 'kdheepak/lazygit.nvim', config = function() require('asterismono.plugin-rc.lazygit-rc') end } -- Lazygit interface
  use { 'lukas-reineke/indent-blankline.nvim',
    config = function() require('asterismono.plugin-rc.indent-blankline-rc') end } -- Indent lines

  -- Color schemes
  use 'sainnhe/everforest'

  -- Development tools
  use 'manzeloth/live-server'

  -- Miscellaneous
  use 'wakatime/vim-wakatime' -- Coding time stats
end)
