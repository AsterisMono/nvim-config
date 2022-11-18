require('packer').startup(function(use)

  local use_with_config = function(plugin)
    local repo_cut = plugin:match("/([^/]+)"):match("([^.]+)[.]?")
    local config_module = 'asterismono.plugin-rc.' .. string.gsub(repo_cut, '%.', '-') .. '-rc'
    local config_function = load("return function() require('" .. config_module .. "') end")()
    return use {
      plugin, config = config_function
    }
  end

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
  use { 'neoclide/coc.nvim', branch = 'release', config = function() require('asterismono.plugin-rc.coc-nvim-rc') end }

  -- Finger efficiency
  use 'tpope/vim-surround'
  use_with_config 'justinmk/vim-sneak'
  use 'vim-scripts/ReplaceWithRegister'
  use 'tpope/vim-commentary'
  -- use { 'phaazon/hop.nvim', config = function() require('asterismono.plugin-rc.hop-rc') end }
  use_with_config 'phaazon/hop.nvim'
  use 'wellle/targets.vim'
  use_with_config 'chentoast/marks.nvim'
  use_with_config 'mizlan/iswap.nvim'

  -- Smarter editor
  use_with_config 'windwp/nvim-autopairs' -- Auto pair brackets
  use 'jghauser/mkdir.nvim' -- Auto mkdir
  use_with_config 'AckslD/nvim-neoclip.lua' -- Smart clipboard
  use_with_config 'mg979/vim-visual-multi' -- Multi cursor
  use 'amadeus/vim-convert-color-to' -- Color code converter
  use_with_config 'yamatsum/nvim-cursorline' -- Word underline
  use_with_config 'linty-org/key-menu.nvim' -- Key suggestion

  -- Telescope
  use_with_config 'nvim-telescope/telescope.nvim'

  -- UI components
  use_with_config 'akinsho/nvim-bufferline.lua' -- Tabline
  use_with_config 'kyazdani42/nvim-web-devicons' -- File icons
  use 'onsails/lspkind.nvim' -- Auto complete icons
  use_with_config 'lewis6991/gitsigns.nvim' -- Git status line
  use_with_config 'norcalli/nvim-colorizer.lua' -- Color code highlighter
  use_with_config 'nvim-tree/nvim-tree.lua' -- Tree-style file explorer
  use_with_config 'nvim-lualine/lualine.nvim' -- Status line
  use_with_config 'kdheepak/lazygit.nvim' -- Lazygit interface
  use_with_config 'lukas-reineke/indent-blankline.nvim' -- Indent lines

  -- Color schemes
  use 'sainnhe/everforest'

  -- Development tools
  use 'manzeloth/live-server'

  -- Miscellaneous
  use 'wakatime/vim-wakatime' -- Coding time stats
end)
