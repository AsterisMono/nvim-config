return {
  'ahmedkhalf/project.nvim',
  event = "VeryLazy",
  config = function()
    require('project_nvim').setup()
    require('telescope').load_extension('projects')
  end,
  keys = {
    { '\'p', '<cmd>Telescope projects initial_mode=normal<CR>', { desc = 'Projects' } },
  }
}
