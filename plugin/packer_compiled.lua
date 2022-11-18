-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/var/home/cmiki/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/var/home/cmiki/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/var/home/cmiki/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/var/home/cmiki/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/var/home/cmiki/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ReplaceWithRegister = {
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/ReplaceWithRegister",
    url = "https://github.com/vim-scripts/ReplaceWithRegister"
  },
  ["coc.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0&asterismono.plugin-rc.coc-nvim-rc\frequire\0" },
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  everforest = {
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0&asterismono.plugin-rc.gitsigns-rc\frequire\0" },
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0!asterismono.plugin-rc.hop-rc\frequire\0" },
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nI\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0.asterismono.plugin-rc.indent-blankline-rc\frequire\0" },
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["iswap.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0#asterismono.plugin-rc.iswap-rc\frequire\0" },
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/iswap.nvim",
    url = "https://github.com/mizlan/iswap.nvim"
  },
  ["key-menu.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0&asterismono.plugin-rc.key-menu-rc\frequire\0" },
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/key-menu.nvim",
    url = "https://github.com/linty-org/key-menu.nvim"
  },
  ["lazygit.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0%asterismono.plugin-rc.lazygit-rc\frequire\0" },
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["live-server"] = {
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/live-server",
    url = "https://github.com/manzeloth/live-server"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0%asterismono.plugin-rc.lualine-rc\frequire\0" },
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["marks.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0#asterismono.plugin-rc.marks-rc\frequire\0" },
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/marks.nvim",
    url = "https://github.com/chentoast/marks.nvim"
  },
  ["mkdir.nvim"] = {
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/mkdir.nvim",
    url = "https://github.com/jghauser/mkdir.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nG\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0,asterismono.plugin-rc.nvim-autopairs-rc\frequire\0" },
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\nH\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0-asterismono.plugin-rc.nvim-bufferline-rc\frequire\0" },
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua",
    url = "https://github.com/akinsho/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nG\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0,asterismono.plugin-rc.nvim-colorizer-rc\frequire\0" },
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-cursorline"] = {
    config = { "\27LJ\2\nH\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0-asterismono.plugin-rc.nvim-cursorline-rc\frequire\0" },
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/nvim-cursorline",
    url = "https://github.com/yamatsum/nvim-cursorline"
  },
  ["nvim-neoclip.lua"] = {
    config = { "\27LJ\2\nE\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0*asterismono.plugin-rc.nvim-neoclip-rc\frequire\0" },
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nB\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0'asterismono.plugin-rc.nvim-tree-rc\frequire\0" },
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nH\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0-asterismono.plugin-rc.nvim-treesitter-rc\frequire\0" },
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nJ\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0/asterismono.plugin-rc.nvim-web-devicons-rc\frequire\0" },
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nB\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0'asterismono.plugin-rc.telescope-rc\frequire\0" },
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-convert-color-to"] = {
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/vim-convert-color-to",
    url = "https://github.com/amadeus/vim-convert-color-to"
  },
  ["vim-sneak"] = {
    config = { "\27LJ\2\nB\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0'asterismono.plugin-rc.vim-sneak-rc\frequire\0" },
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/vim-sneak",
    url = "https://github.com/justinmk/vim-sneak"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-visual-multi"] = {
    config = { "\27LJ\2\nI\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0.asterismono.plugin-rc.vim-visual-multi-rc\frequire\0" },
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/var/home/cmiki/.local/share/nvim/site/pack/packer/start/vim-wakatime",
    url = "https://github.com/wakatime/vim-wakatime"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0!asterismono.plugin-rc.hop-rc\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0-asterismono.plugin-rc.nvim-bufferline-rc\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: marks.nvim
time([[Config for marks.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0#asterismono.plugin-rc.marks-rc\frequire\0", "config", "marks.nvim")
time([[Config for marks.nvim]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nJ\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0/asterismono.plugin-rc.nvim-web-devicons-rc\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: iswap.nvim
time([[Config for iswap.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0#asterismono.plugin-rc.iswap-rc\frequire\0", "config", "iswap.nvim")
time([[Config for iswap.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0-asterismono.plugin-rc.nvim-treesitter-rc\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nG\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0,asterismono.plugin-rc.nvim-autopairs-rc\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-neoclip.lua
time([[Config for nvim-neoclip.lua]], true)
try_loadstring("\27LJ\2\nE\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0*asterismono.plugin-rc.nvim-neoclip-rc\frequire\0", "config", "nvim-neoclip.lua")
time([[Config for nvim-neoclip.lua]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nB\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0'asterismono.plugin-rc.nvim-tree-rc\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: vim-visual-multi
time([[Config for vim-visual-multi]], true)
try_loadstring("\27LJ\2\nI\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0.asterismono.plugin-rc.vim-visual-multi-rc\frequire\0", "config", "vim-visual-multi")
time([[Config for vim-visual-multi]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0%asterismono.plugin-rc.lualine-rc\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nB\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0'asterismono.plugin-rc.telescope-rc\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-cursorline
time([[Config for nvim-cursorline]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0-asterismono.plugin-rc.nvim-cursorline-rc\frequire\0", "config", "nvim-cursorline")
time([[Config for nvim-cursorline]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0&asterismono.plugin-rc.gitsigns-rc\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: lazygit.nvim
time([[Config for lazygit.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0%asterismono.plugin-rc.lazygit-rc\frequire\0", "config", "lazygit.nvim")
time([[Config for lazygit.nvim]], false)
-- Config for: key-menu.nvim
time([[Config for key-menu.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0&asterismono.plugin-rc.key-menu-rc\frequire\0", "config", "key-menu.nvim")
time([[Config for key-menu.nvim]], false)
-- Config for: coc.nvim
time([[Config for coc.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0&asterismono.plugin-rc.coc-nvim-rc\frequire\0", "config", "coc.nvim")
time([[Config for coc.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\nG\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0,asterismono.plugin-rc.nvim-colorizer-rc\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nI\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0.asterismono.plugin-rc.indent-blankline-rc\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: vim-sneak
time([[Config for vim-sneak]], true)
try_loadstring("\27LJ\2\nB\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0'asterismono.plugin-rc.vim-sneak-rc\frequire\0", "config", "vim-sneak")
time([[Config for vim-sneak]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
