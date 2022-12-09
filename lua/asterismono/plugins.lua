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
  use 'kkharji/sqlite.lua' -- SQLite support

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
  use_with_config 'phaazon/hop.nvim'
  use 'wellle/targets.vim'
  use_with_config 'chentoast/marks.nvim'
  use_with_config 'mizlan/iswap.nvim'

  -- Smarter editor
  use 'LunarWatcher/auto-pairs' -- Auto pair brackets
  use 'jghauser/mkdir.nvim' -- Auto mkdir
  use_with_config 'mg979/vim-visual-multi' -- Multi cursor
  use_with_config 'amadeus/vim-convert-color-to' -- Color code converter
  use_with_config 'yamatsum/nvim-cursorline' -- Word underline
  use_with_config 'linty-org/key-menu.nvim' -- Key suggestion
  use_with_config 'ahmedkhalf/project.nvim' -- Project management
  use_with_config 'Shatur/neovim-session-manager' -- Session management

  -- Telescope
  use_with_config 'nvim-telescope/telescope.nvim'
  use_with_config 'AckslD/nvim-neoclip.lua' -- Smart clipboard
  use_with_config 'nvim-telescope/telescope-frecency.nvim' -- MRU
  use 'fannheyward/telescope-coc.nvim' -- Coc integration

  -- UI components
  use_with_config 'akinsho/nvim-bufferline.lua' -- Tabline
  use_with_config 'kyazdani42/nvim-web-devicons' -- File icons
  use_with_config 'lewis6991/gitsigns.nvim' -- Git status line
  use_with_config 'norcalli/nvim-colorizer.lua' -- Color code highlighter
  use_with_config 'nvim-lualine/lualine.nvim' -- Status line
  use_with_config 'kdheepak/lazygit.nvim' -- Lazygit interface
  use_with_config 'lukas-reineke/indent-blankline.nvim' -- Indent lines
  use_with_config 'akinsho/toggleterm.nvim'
  use_with_config 'nvim-tree/nvim-tree.lua'

  -- Color schemes
  use 'sainnhe/everforest'

  -- Development tools
  use_with_config 'manzeloth/live-server'

  -- Miscellaneous
  use 'wakatime/vim-wakatime' -- Coding time stats
end)
