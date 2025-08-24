return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  lazy = false,
  keys = {
    { '<leader>ss', '<cmd>CodeCompanionChat toggle<cr>', desc = 'Toggle CodeCompanion Chat' },
    {
      '<leader>sa',
      '<cmd>CodeCompanionActions<cr>',
      mode = { 'n', 'v' },
      desc = 'Run CodeCompanion actions',
    },
  },
  opts = {
    strategies = {
      chat = {
        adapter = {
          name = 'copilot',
          model = 'gpt-5',
        },
      },
      inline = {
        adapter = 'copilot',
        model = 'gpt-5',
      },
      cmd = {
        adapter = 'copilot',
        model = 'gpt-5',
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
  },
}
