return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  keys = {
    {
      's',
      mode = { 'n', 'x', 'o' },
      function() require('flash').jump() end,
      desc = 'Flash',
    },
    {
      '<esc>',
      mode = { 'c' },
      function() require('flash').toggle() end,
      desc = 'Toggle Flash Search',
    },
  },
  opts = {
    jump = {
      autojump = false,
    },
  },
}
