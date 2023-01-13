local telescope = function(builtin, opts)
  local params = { builtin = builtin, opts = opts }
  return function()
    builtin = params.builtin
    opts = params.opts
    opts = vim.tbl_deep_extend("force", { cwd = M.get_root() }, opts or {})
    if builtin == "files" then
      if vim.loop.fs_stat((opts.cwd or vim.loop.cwd()) .. "/.git") then
        opts.show_untracked = true
        builtin = "git_files"
      else
        builtin = "find_files"
      end
    end
    require("telescope.builtin")[builtin](opts)
  end
end

return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  version = false,
  keys = {
    { '\'f', telescope('files'), { desc = 'Find files' } },
    { '\'r', telescope('live_grep'), { desc = 'Live grep' } },
    { '\'b', '<cmd>Telescope buffers initial_mode=normal<CR>', { desc = 'Buffers' } },
    { '<leader>mm', '<cmd>Telescope marks<cr>', { desc = 'Marks' } },

  },
  opts = {
    extensions = {
      coc = {
        theme = 'ivy',
        prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
      }
    },
  },
}
