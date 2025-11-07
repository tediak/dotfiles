vim.pack.add({ 'https://github.com/datsfilipe/vesper.nvim' })

local vesper = require('vesper')

vesper.setup({
  transparent = true,
  italics = {
    comments = false,
    keywords = false,
    functions = false,
    strings = false,
    variables = false,
  },
})
