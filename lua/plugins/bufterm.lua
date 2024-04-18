return {
  'boltlessengineer/bufterm.nvim',
  config = function()
    require('bufterm').setup()
    vim.keymap.set('t', '<C-[>', '<C-\\><C-n>')
  end,
  keys = {
    { '<leader>t', '<cmd>BufTermEnter<CR>', desc = 'Open buffer terminal' },
    {
      '<C-t>',
      function()
        local term        = require('bufterm.terminal')
        local ui          = require('bufterm.ui')
        local recent_term = term.get_recent_term()
        -- if recent_term is nil, spawn a new terminal
        if not recent_term then
          local Terminal = term.Terminal
          local new_term = Terminal:new({
            buflisted = false,
          })
          new_term:spawn()
          recent_term = term.get_recent_term()
        end
        ui.toggle_float(recent_term.bufnr)
      end,
      desc = 'Open buffer terminal',
      mode = { "n", "t" }
    },
  }
}
