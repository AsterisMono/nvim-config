-- Disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Preload lsp_signature
-- require "lsp_signature".setup(
--   require('asterismono.plugin-rc.lsp_signature-rc')
-- )

-- Neovide specific settings
vim.cmd [[
  if exists("g:neovide")
    let g:neovide_scale_factor = 0.8
    set shellcmdflag=-c
  endif
]]

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('asterismono.plugins')
require('asterismono.base')
require('asterismono.maps')
