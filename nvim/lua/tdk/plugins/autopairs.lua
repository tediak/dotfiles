vim.pack.add({ 'https://github.com/windwp/nvim-autopairs' })

local autopairs = require('nvim-autopairs')

autopairs.setup({
  disable_filetype = { 'vim' },
})
