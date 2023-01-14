return {
  'lukas-reineke/indent-blankline.nvim',
  event = { 'BufReadPre' , 'BufNew' },
  opts = {
    show_current_context = true,
    show_current_context_start = true,
  }
}
