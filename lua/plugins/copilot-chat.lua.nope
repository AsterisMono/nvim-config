local inline_chat_popup_options = {
  relative = "cursor",
  position = {
    row = 2,
    col = 2,
  },
  size = 20,
  border = {
    style = "rounded",
    text = {
      top = "Copilot",
      top_align = "left",
    },
  },
  win_options = {
    winhighlight = "Normal:Normal,FloatBorder:SpecialChar",
  },
}
return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cond = not vim.g.vscode,
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
      { "MunifTanjim/nui.nvim" },
    },
    opts = {
      debug = false, -- Enable debugging
      -- See Configuration section for rest
    },
    keys = {
      {
        '<leader>cc',
        function()
          local Input = require("nui.input")
          local event = require("nui.utils.autocmd").event

          local input = Input(inline_chat_popup_options, {
            prompt = "> ",
            default_value = "",
            on_submit = function(value)
              vim.cmd("'<,'>CopilotChat " .. value)
            end,
          })

          input:map("n", "<Esc>", function()
            input:unmount()
          end, { noremap = true })

          input:mount()
        end,
        mode = "v",
        desc = 'Copilot Chat (Selection)'
      },
      {
        '<leader>cc',
        '<cmd>CopilotChat<CR>',
        mode = "n",
        desc = 'Copilot Chat'
      },
      {
        '<leader>cm',
        '<cmd>CopilotChatCommit<CR>',
        mode = "n",
        desc = 'Generate commit message'
      },
      {
        '<leader>ce',
        '<cmd>CopilotChatExplain<CR>',
        mode = "v",
        desc = 'Explain'
      },
      {
        '<leader>cr',
        '<cmd>CopilotChatReview<CR>',
        mode = "v",
        desc = 'Review'
      },
      {
        '<leader>ct',
        '<cmd>CopilotChatTest<CR>',
        mode = "v",
        desc = 'Generate tests'
      },
      {
        '<leader>cf',
        '<cmd>CopilotChatFix<CR>',
        mode = "v",
        desc = 'Fix selected code'
      },
      {
        '<leader>cd',
        '<cmd>CopilotChatDocs<CR>',
        mode = "v",
        desc = 'Generate documentation'
      },
      {
        '<leader>cb',
        function()
          local input = vim.fn.input("Chat with current buffer")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        mode = "n",
        desc = 'Chat with current buffer'
      },
      {
        '<leader>cq',
        function()
          local input = vim.fn.input("Ask anything")
          if input ~= "" then
            require("CopilotChat").ask(input)
          end
        end
      }
    }
  },
}
