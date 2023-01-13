return {
  'chentoast/marks.nvim',
  event = 'BufReadPre',
  opts = {
    default_mappings = true,
  },
  config = function(plugin, opts)
    require('marks').setup(opts)
  end
}
