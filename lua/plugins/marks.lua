return {
  'chentoast/marks.nvim',
  event = { 'BufReadPre' , 'BufNew' },
  opts = {
    default_mappings = true,
  },
  config = function(plugin, opts)
    require('marks').setup(opts)
  end
}
