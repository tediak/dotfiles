vim.pack.add({ 'https://github.com/olivercederborg/poimandres.nvim' })

local poimandres = require('poimandres')

poimandres.setup({
  bold_vert_split = false,
  disable_background = true,
  disable_float_background = true,
  disable_italics = true,
})
