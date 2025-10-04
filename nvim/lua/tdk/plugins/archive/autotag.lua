vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/windwp/nvim-ts-autotag',
})

local autotag = require('nvim-ts-autotag')

autotag.setup({
  opts = {
    enable_close_on_slash = true,
  },
})
