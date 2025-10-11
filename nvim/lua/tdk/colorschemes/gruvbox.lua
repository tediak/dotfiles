vim.pack.add({ 'https://github.com/ellisonleao/gruvbox.nvim' })

local gruvbox = require('gruvbox')

gruvbox.setup({
  italic = {
    strings = false
  }
})
