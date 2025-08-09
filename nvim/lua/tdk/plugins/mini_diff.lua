return {
  'echasnovski/mini.diff',
  version = '*',
  lazy = false,
  keys = {
    {
      '<leader>to',
      function() require('mini.diff').toggle_overlay() end,
      desc = 'Toggle diff overlay',
    },
  },
  opts = {
    view = {
      style = 'number',
    },
  },
}
