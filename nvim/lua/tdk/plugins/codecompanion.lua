return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    {
      'MeanderingProgrammer/render-markdown.nvim',
      ft = { 'markdown', 'codecompanion' },
      opts = {
        code = {
          style = 'normal'
        },
        heading = {
          icons = { ' ○ ', '○ ', '○ ', '○ ', '○ ', '○ ' },
        },
      },
    },
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
