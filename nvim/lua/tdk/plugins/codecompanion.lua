vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/j-hui/fidget.nvim',
  'https://github.com/olimorris/codecompanion.nvim',
})

local codecompanion = require('codecompanion')
local wk = require('which-key')

wk.add({
  { '<leader>s', group = 'CodeCompanion' },
})

codecompanion.setup({
  strategies = {
    chat = {
      adapter = {
        name = 'copilot',
        model = 'gpt-4.1',
      },
    },
    inline = {
      adapter = 'copilot',
      model = 'gpt-4',
    },
    cmd = {
      adapter = 'copilot',
      model = 'gpt-4',
    },
  },
  display = {
    chat = {
      window = {
        layout = 'vertical',
        position = 'right',
        width = 0.3,
        opts = {
          cursorline = false,
          cursorcolumn = false,
          signcolumn = 'no',
          wrap = true,
        },
      },
    },
  },
})

local progress = require('fidget.progress')
local handles = {}

local group = vim.api.nvim_create_augroup('CodeCompanionFidget', { clear = true })

vim.api.nvim_create_autocmd('User', {
  pattern = 'CodeCompanionRequestStarted',
  group = group,
  callback = function(event)
    local id = event.data.id
    handles[id] = progress.handle.create({
      title = 'CodeCompanion',
      message = 'Thinking...',
      lsp_client = { name = event.data.adapter.formatted_name },
    })
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'CodeCompanionRequestFinished',
  group = group,
  callback = function(event)
    local id = event.data.id
    local handle = handles[id]
    if handle then
      local message = event.data.status == 'success' and 'Done' or 'Failed'
      handle.message = message
      handle:finish()
      handles[id] = nil
    end
  end,
})

vim.keymap.set('n', '<leader>ss', '<cmd>CodeCompanionChat toggle<cr>', { desc = 'Toggle CodeCompanion Chat' })
vim.keymap.set({ 'n', 'v' }, '<leader>sa', '<cmd>CodeCompanionActions<cr>', { desc = 'Run CodeCompanion actions' })
