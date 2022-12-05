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

  -- Finger efficiency
  use 'tpope/vim-surround'
  use_with_config 'justinmk/vim-sneak'
  use 'vim-scripts/ReplaceWithRegister'
  use_with_config 'phaazon/hop.nvim'
  use 'wellle/targets.vim'
  use_with_config 'chentoast/marks.nvim'
  use_with_config 'mizlan/iswap.nvim'

  -- Color schemes
  use 'sainnhe/everforest'
end)
