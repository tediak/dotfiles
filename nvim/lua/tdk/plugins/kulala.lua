return {
  'mistweaverco/kulala.nvim',
  opts = {
    default_env = 'local',
    global_keymaps = true,
    request_timeout = 10000,
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
  },
}
