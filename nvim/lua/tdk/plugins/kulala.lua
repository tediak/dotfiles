vim.pack.add({ 'https://github.com/mistweaverco/kulala.nvim' })

local kulala = require('kulala')

kulala.setup({
  default_env = 'local',
  global_keymaps = true,
  request_timeout = 60 * 1000,
  ui = {
    display_mode = 'split',
    split_direction = 'vertical',
    default_view = 'body',
    winbar = true,
    request_timeout = 60,
    default_winbar_panes = {
      'body',
      'headers',
      'headers_body',
      'verbose',
      'script_output',
      'report',
      'help',
    },
    icons = {
      inlay = {
        loading = '',
        done = '',
        error = '',
      },
    },
  },
})
