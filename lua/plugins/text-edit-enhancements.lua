return {
  {
    'tpope/vim-commentary',
    event = 'VeryLazy'
  },
  {
    'tpope/vim-surround',
    event = 'VeryLazy'
  },
  {
    'kana/vim-textobj-entire',
    event = 'VeryLazy',
    dependencies = {
      'kana/vim-textobj-user'
    },
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    init = function()
      -- Insert `(` after select function or method item
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end,
    opts = {}
  }
}
